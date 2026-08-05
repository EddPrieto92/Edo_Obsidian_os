const { Plugin, ItemView, TFolder, TFile, Notice } = require('obsidian');

const VIEW_TYPE = 'eihwazos-view';

// Entry notes conocidas para áreas que sí tienen contenido real hoy.
// El resto de las áreas se resuelve dinámicamente: si el área tiene
// alguna nota Markdown, se usa la primera (README/MOC si existe, si no
// la primera en orden alfabético); si no tiene ninguna, el nodo queda
// marcado como vacío y solo revela la carpeta.
const KNOWN_ENTRY_NOTES = {
  'IA': 'Edo/IA/Agentes/00 - Inicio rápido.md',
  'Proyectos': 'Edo/Proyectos/Proyectos activos.md',
  'Archivo': 'Edo/Archivo/Timeline.md',
  'Tecnología': 'Edo/Tecnología/Aprendizaje/Progreso Tech Lead.md',
};

const CENTRAL_NOTE = 'Edo/MOC - Edu.md';

function collectMarkdownFiles(folder, out) {
  out = out || [];
  for (const child of folder.children) {
    if (child instanceof TFolder) {
      collectMarkdownFiles(child, out);
    } else if (child instanceof TFile && child.extension === 'md') {
      out.push(child);
    }
  }
  return out;
}

function resolveEntryFile(app, areaFolder) {
  const known = KNOWN_ENTRY_NOTES[areaFolder.name];
  if (known) {
    const f = app.vault.getAbstractFileByPath(known);
    if (f instanceof TFile) return f;
  }
  const files = collectMarkdownFiles(areaFolder);
  if (files.length === 0) return null;
  const preferred = files.find((f) =>
    /^(readme|moc)/i.test(f.basename)
  );
  if (preferred) return preferred;
  files.sort((a, b) => a.basename.localeCompare(b.basename, 'es'));
  return files[0];
}

function revealFolder(app, folder) {
  try {
    const explorer = app.internalPlugins?.plugins?.['file-explorer']?.instance;
    if (explorer && typeof explorer.revealInFolder === 'function') {
      explorer.revealInFolder(folder);
      return;
    }
  } catch (e) {
    // API interna no disponible; degradar sin romper.
  }
  new Notice(`"${folder.name}" todavía no tiene notas.`);
}

class EihwazosView extends ItemView {
  constructor(leaf) {
    super(leaf);
    this.searchResults = [];
    this.selectedIndex = -1;
  }

  getViewType() {
    return VIEW_TYPE;
  }

  getDisplayText() {
    return 'EihwazOS';
  }

  getIcon() {
    return 'sparkles';
  }

  async onOpen() {
    this.render();
  }

  async onClose() {
    this.contentEl.empty();
  }

  render() {
    const app = this.app;
    const container = this.contentEl;
    container.empty();
    container.addClass('eihwazos-container');

    const root = container.createDiv({ cls: 'eihwazos-root' });

    // Núcleo central
    const core = root.createDiv({ cls: 'eihwazos-core' });
    core.createEl('p', { cls: 'eihwazos-core-title', text: 'EIHWAZOS' });
    core.createEl('p', {
      cls: 'eihwazos-core-subtitle',
      text: '¿Qué quieres encontrar o hacer?',
    });

    // Buscador
    const searchWrap = core.createDiv({ cls: 'eihwazos-search-wrap' });
    const input = searchWrap.createEl('input', {
      cls: 'eihwazos-search-input',
      attr: { type: 'text', placeholder: 'Buscar nota, proyecto, área o agente…' },
    });
    const resultsEl = searchWrap.createDiv({ cls: 'eihwazos-results' });

    const openFile = (file) => {
      app.workspace.getLeaf(false).openFile(file);
    };

    const runSearch = (query) => {
      resultsEl.empty();
      this.selectedIndex = -1;
      const q = query.trim().toLowerCase();
      if (!q) {
        this.searchResults = [];
        return;
      }
      const files = app.vault.getMarkdownFiles();
      const matches = [];
      for (const file of files) {
        const cache = app.metadataCache.getFileCache(file);
        const aliases = cache?.frontmatter?.aliases || [];
        const tags = (cache?.tags || []).map((t) => t.tag);
        const haystacks = [file.basename, file.path, ...aliases, ...tags]
          .filter(Boolean)
          .map((s) => String(s).toLowerCase());
        if (haystacks.some((h) => h.includes(q))) {
          matches.push(file);
        }
        if (matches.length >= 12) break;
      }
      this.searchResults = matches;
      matches.forEach((file, i) => {
        const item = resultsEl.createDiv({ cls: 'eihwazos-result-item' });
        item.createEl('span', { cls: 'eihwazos-result-title', text: file.basename });
        item.createEl('span', { cls: 'eihwazos-result-path', text: file.path });
        item.addEventListener('click', () => openFile(file));
        item.dataset.index = String(i);
      });
    };

    input.addEventListener('input', () => runSearch(input.value));

    input.addEventListener('keydown', (evt) => {
      if (evt.key === 'Escape') {
        input.value = '';
        runSearch('');
        input.blur();
        return;
      }
      if (evt.key === 'Enter') {
        const target =
          this.selectedIndex >= 0
            ? this.searchResults[this.selectedIndex]
            : this.searchResults[0];
        if (target) openFile(target);
        return;
      }
      if (evt.key === 'ArrowDown' || evt.key === 'ArrowUp') {
        if (this.searchResults.length === 0) return;
        evt.preventDefault();
        const delta = evt.key === 'ArrowDown' ? 1 : -1;
        this.selectedIndex =
          (this.selectedIndex + delta + this.searchResults.length) %
          this.searchResults.length;
        Array.from(resultsEl.children).forEach((el, i) => {
          el.toggleClass('is-selected', i === this.selectedIndex);
        });
      }
    });

    core.addEventListener('click', (evt) => {
      if (evt.target === core || evt.target.closest('.eihwazos-core-title')) {
        const central = app.vault.getAbstractFileByPath(CENTRAL_NOTE);
        if (central instanceof TFile) openFile(central);
      }
    });

    // Dominios reales
    const edoFolder = app.vault.getAbstractFileByPath('Edo');
    const domainsEl = root.createDiv({ cls: 'eihwazos-domains' });

    if (edoFolder instanceof TFolder) {
      const areas = edoFolder.children
        .filter((c) => c instanceof TFolder)
        .sort((a, b) => a.name.localeCompare(b.name, 'es'));

      for (const area of areas) {
        const entry = resolveEntryFile(app, area);
        const node = domainsEl.createDiv({
          cls: `eihwazos-node ${entry ? 'is-active' : 'is-empty'}`,
        });
        node.createEl('span', { cls: 'eihwazos-node-dot' });
        node.createEl('span', { cls: 'eihwazos-node-label', text: area.name });

        node.addEventListener('click', () => {
          if (entry) {
            openFile(entry);
          } else {
            revealFolder(app, area);
          }
        });
      }
    }

    input.focus();
  }
}

module.exports = class EihwazosPlugin extends Plugin {
  async onload() {
    this.registerView(VIEW_TYPE, (leaf) => new EihwazosView(leaf));

    this.addCommand({
      id: 'open-eihwazos',
      name: 'Abrir EihwazOS',
      callback: () => this.activateView(),
    });

    this.addRibbonIcon('sparkles', 'Abrir EihwazOS', () => this.activateView());

    this.app.workspace.onLayoutReady(() => {
      const existing = this.app.workspace.getLeavesOfType(VIEW_TYPE);
      if (existing.length === 0) {
        this.activateView();
      }
    });
  }

  async onunload() {
    this.app.workspace.getLeavesOfType(VIEW_TYPE).forEach((leaf) => leaf.detach());
  }

  async activateView() {
    const existing = this.app.workspace.getLeavesOfType(VIEW_TYPE);
    if (existing.length > 0) {
      this.app.workspace.revealLeaf(existing[0]);
      return;
    }
    const leaf = this.app.workspace.getLeaf(true);
    await leaf.setViewState({ type: VIEW_TYPE, active: true });
    this.app.workspace.revealLeaf(leaf);
  }
};
