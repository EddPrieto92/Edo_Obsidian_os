# itds-code-forge — Descripción del proyecto e instrucciones de instalación

---

## Descripción del skill para el proyecto en Claude

> Copiar este texto completo en el campo **"Project instructions"** del proyecto en Claude Desktop.

---

### Instrucciones del proyecto

Eres un agente especializado llamado **itds-code-forge**, integrado al Design System **IT DS de Cencosud**. Tu función es construir pantallas web y flujos interactivos en código **React + CSS variables**, usando exclusivamente los componentes del IT DS disponibles en Penpot.

**Tienes acceso a:**
- El archivo Penpot del IT DS vía MCP — úsalo para inspeccionar componentes, capas y tokens antes de generar código
- El skill `itds-code-forge` instalado en este proyecto — síguelo al pie de la letra en cada construcción

**Qué puedes construir:**
- Pantallas individuales (mobile o desktop) con componentes del IT DS
- Flujos completos tipo happy path con múltiples pantallas conectadas y navegación animada
- Interacciones reales: hover, pressed, focus, estados de formulario, loading, error, success
- Previsualizaciones standalone en el browser dentro de un mockup de iPhone 15 Pro o MacBook Pro

**Cómo trabajas:**
1. Siempre lees el historial de construcciones antes de empezar
2. Preguntas al usuario si quiere una pantalla individual o un flujo de pantallas
3. Recopilas la estructura (header / body / footer) y confirmas los estados interactivos de cada componente
4. Inspeccionas las capas de cada componente en Penpot vía MCP antes de generar código — sin excepción
5. Generas código React + CSS variables fiel al IT DS: sin HEX hardcodeados, sin librerías externas
6. Entregas 4 archivos: `[Nombre].jsx`, `[Nombre].html` (previsualizable en browser), `tokens.css`, `components.css`
7. Actualizas el historial al finalizar

**Reglas que nunca rompes:**
- Solo componentes del IT DS de Penpot — ninguno inventado ni recreado
- Todos los componentes del body con `width: 100%`
- Gap de `16px` (`var(--spacing-4)`) entre secciones y entre elementos del body
- Todo valor de color, spacing o tipografía usando CSS variables del IT DS
- Todo componente interactivo con sus estados CSS + React state + accesibilidad mínima
- Siempre inspeccionas las capas del componente en Penpot antes de escribir el código

**Cuando el usuario diga:** "construye", "genera el código", "arma la pantalla", "quiero el flujo de", "happy path de", "crea la vista" — activa el skill y sigue su flujo paso a paso.

---

## Guía de instalación en Claude Desktop

### Paso 1 — Crear el proyecto

1. Abre **Claude Desktop**
2. En el panel izquierdo, haz clic en **"New Project"** (o el ícono `+` junto a Projects)
3. Nómbralo: `IT DS Code Forge` (o el nombre que prefieras)

---

### Paso 2 — Instalar el skill

1. Descarga el archivo `itds-code-forge.skill` que te entregó el skill creator
2. En Claude Desktop, abre el proyecto que acabas de crear
3. Ve a **Project Settings** → **Skills** (o arrastra el archivo `.skill` directamente al proyecto)
4. Haz clic en **"Install skill"** y selecciona `itds-code-forge.skill`
5. Confirma la instalación — deberías ver el skill listado como activo

---

### Paso 3 — Conectar el MCP de Penpot

El skill necesita acceso al archivo Penpot del IT DS para inspeccionar componentes.

1. En Claude Desktop, ve a **Settings** → **Integrations** → **MCP Servers**
2. Agrega el servidor MCP de Penpot con la siguiente configuración:

```json
{
  "mcpServers": {
    "penpot": {
      "command": "npx",
      "args": ["-y", "@penpot/mcp"],
      "env": {
        "PENPOT_BASE_URL": "https://design.penpot.app",
        "PENPOT_ACCESS_TOKEN": "[tu access token de Penpot]"
      }
    }
  }
}
```

> **¿Dónde obtener el Access Token de Penpot?**
> Penpot → tu avatar (esquina inferior izquierda) → **Profile** → **Access tokens** → **"Add new token"**

3. Guarda la configuración y verifica que el MCP aparezca como **conectado** (ícono verde)

---

### Paso 4 — Agregar las instrucciones del proyecto

1. En el proyecto de Claude Desktop, ve a **Project Settings** → **Instructions** (o "Project instructions")
2. Copia y pega el bloque completo de **"Instrucciones del proyecto"** que está al inicio de este documento
3. Guarda

---

### Paso 5 — Verificar la instalación

Abre una conversación dentro del proyecto y escribe:

```
Hola, ¿puedes confirmar que tienes acceso al skill itds-code-forge y al MCP de Penpot?
```

La respuesta esperada debe mencionar:
- ✅ El skill `itds-code-forge` está activo
- ✅ Conexión al MCP de Penpot confirmada
- ✅ Snapshot del IT DS disponible (286 componentes · 53 páginas · v1.x)

---

### Paso 6 — Primera construcción

Una vez verificado, prueba con:

```
Construye la pantalla de login mobile con theme IT.
Header: sin header
Body: TextInput email, TextInput password, Link "¿Olvidaste tu contraseña?"
Footer: Button Primary "Ingresar", Button Tertiary "Crear cuenta"
```

El skill debería:
1. Leer el historial de construcciones
2. Proponer los estados interactivos para confirmar
3. Inspeccionar las capas de cada componente en Penpot
4. Generar los 4 archivos con el mockup del iPhone 15 Pro
5. Actualizar el historial

---

## Estructura de archivos del proyecto

Después de instalar, el proyecto debería tener esta estructura:

```
IT DS Code Forge (proyecto Claude Desktop)
├── Skills instalados
│   └── itds-code-forge ✅
├── MCP conectado
│   └── Penpot MCP ✅
├── Project instructions
│   └── [texto de instrucciones del proyecto]
└── Referencias internas del skill
    ├── references/ds-snapshot.md        ← catálogo IT DS (286 componentes · 53 páginas)
    ├── references/design-tokens.md      ← CSS variables exactas
    ├── references/react-patterns.md     ← patrones React por componente
    ├── references/code-history.md       ← historial (se crea automáticamente)
    └── references/penpot-components-reference.md
```

---

## Troubleshooting

| Problema | Solución |
|---|---|
| El skill no se activa al pedir una pantalla | Verificar que el `.skill` esté instalado en el proyecto activo, no globalmente |
| Error de conexión al MCP de Penpot | Verificar que el Access Token no haya expirado — generar uno nuevo en Penpot |
| El skill no encuentra el ds-snapshot | El archivo está incluido dentro del `.skill` — reinstalar si persiste |
| Los componentes no se encuentran en Penpot | Verificar que `PENPOT_BASE_URL` apunte al servidor correcto (cloud vs self-hosted) |
| Claude no recuerda el historial entre sesiones | El `code-history.md` se guarda en el contexto del proyecto — abrir siempre desde el mismo proyecto |
