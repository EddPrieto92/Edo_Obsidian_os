# IT DS — Documento de Contexto de Componentes
> Cencosud IT Design System v1.50.0 · 459 componentes · Generado para uso en Claude Desktop

Referencia rápida de casos de uso, comportamientos esperados, y guía de decisión (**do / don't**) para cada componente del IT DS. Organizado por categoría.

---

## Índice

- [⚡️ Actions](#️-actions)
- [📊 Charts](#-charts)
- [🖼️ Content](#️-content)
- [📣 Feedback](#-feedback)
- [📝 Forms](#-forms)
- [🗂️ Layout](#️-layout)
- [🧭 Navigation](#-navigation)
- [📤 Upload](#-upload)
- [🛒 Ecommerce](#-ecommerce)
- [🔧 Utilidades / Internos](#-utilidades--internos)

---

## ⚡️ Actions

---

### ActionButtons

**Descripción:** Contenedor que agrupa acciones relacionadas en una zona de decisión coherente. Estándar del IT DS para zonas de CTA agrupadas.

**Casos de uso:**
- Cierre de formularios, modales, confirmaciones y selección de opciones
- Escenarios donde el usuario debe decidir entre continuar, cancelar o realizar una acción alternativa
- Footer de pantallas con 1–3 botones (confirmar / cancelar / acción secundaria)
- Bottom Sheet o Modal que requiere CTA agrupado
- Formato vertical: refuerza la jerarquía cuando la acción principal debe ocupar toda la anchura disponible
- Formato hugged: compacto para espacios reducidos

**Comportamiento:**
- Hereda los estados del componente `Button`: hover, focus, pressed, loading y disabled
- Cada botón responde a la interacción de forma independiente — la agrupación no altera el comportamiento individual
- En formato vertical o ancho completo: la acción principal resalta de inmediato al pasar el cursor o navegar con teclado
- En formato hugged: la proximidad entre botones refuerza la relación entre las acciones
- Soporta hasta 3 botones: primary (obligatorio), secondary y tertiary (opcionales)
- Los botones no usados se ocultan con `.hidden = true`

**✅ DO:**
- Presentar acciones relacionadas dentro de un mismo módulo para facilitar la comparación
- Usar `Vertical Buttons` cuando se necesite reforzar jerarquía o cuando la acción primaria debe ocupar todo el ancho
- Mantener etiquetas breves y claras para evitar desequilibrios visuales en layouts hugged
- Ocultar secondary y tertiary si la pantalla solo requiere una acción principal
- Reemplazar siempre los textos por defecto ("Primary", "Secondary", "Tertiary") con texto contextual

**❌ DON'T:**
- No incluir más de 3 acciones — saturan al usuario
- No usar para acciones sin relación entre sí — genera confusión sobre su propósito
- No mezclar botones con intenciones contradictorias o ambiguas dentro del mismo set
- No usar para botones aislados — usar `Button` directamente
- No usar para acciones inline dentro de Card o List
- No dejar textos por defecto visibles

---

### ActionIcon

**Descripción:** Acción representada exclusivamente por un ícono, con Badge indicador opcional para comunicar cambios o conteos dinámicos.

**Casos de uso:**
- Barras de navegación, encabezados, listas y dashboards donde se accede rápidamente a funciones: notificaciones, búsqueda, ajustes, favoritos, acciones contextualizadas
- Cuando la acción puede representarse visualmente sin necesidad de texto y el símbolo es reconocido por el usuario
- Con Badge: experiencias donde se necesita comunicar cambios recientes (nuevos mensajes, alertas, conteos dinámicos)

**Comportamiento:**
- `Hover`: leve aumento de contraste o fondo sutil para reforzar proximidad y señal de acción
- `Pressed`: feedback inmediato con cambio de color o ligera presión visual dentro del contenedor
- `Disabled`: no reacciona a interacciones — estilo transmite inactividad mediante opacidad o reducción de contraste
- Cuando existe Badge: permanece visible en todos los estados, preservando siempre su legibilidad
- No incluye etiqueta de texto visible

**✅ DO:**
- Usar cuando un ícono basta para comunicar la acción sin texto
- Emplear en barras de navegación o encabezados donde la inmediatez sea clave
- Activar el Badge cuando se necesite notificar nuevos eventos, asegurando contraste adecuado
- Combinar con Tooltip si hay duda sobre la función del ícono

**❌ DON'T:**
- No usar cuando la acción no pueda interpretarse fácilmente mediante un ícono
- No combinar con textos adyacentes que compitan visualmente con su propósito minimalista
- No usar el Badge con información irrelevante o sin propósito comunicacional claro — satura la experiencia
- No reemplazar a `Button` cuando hay espacio disponible para texto

---

### Button

**Descripción:** Punto de acción esencial que guía al usuario hacia operaciones claras y directas. Disponible en múltiples variantes, tamaños y estados para cubrir toda la jerarquía de acciones de una interfaz.

**Casos de uso:**
- Acción principal del flujo: confirmar, continuar, guardar, enviar
- Acciones secundarias o alternativas con menor peso visual
- Operaciones destructivas o irreversibles que requieren alertar al usuario
- Acciones en progreso donde la interfaz debe comunicar espera
- Acciones flotantes sobre contenido superpuesto

**Propiedades:**

*Size — densidad visual y énfasis:*
- `L` → mayor presencia; acción principal en pantallas amplias o flujos donde la claridad es prioritaria
- `M` → equilibrio entre visibilidad y compacidad; tamaño por defecto en la mayoría de contextos
- `S` → espacios reducidos, barras de herramientas, acciones auxiliares que no deben competir con otros elementos

*Variant — intención visual y peso jerárquico:*
- `Primary` → acción principal; máximo peso visual; usar solo una por vista
- `Secondary` → opción alterna de relevancia media; menos intensa sin perder claridad
- `Tertiary` → acción complementaria o parte de un conjunto; integración discreta
- `Tonal` → equilibrio entre solidez y suavidad; matiz neutro sin perder enfoque
- `Danger/Text` → riesgo o advertencia; estilo sobrio basado en texto para acciones que requieren cautela
- `Danger` → señal fuerte de peligro; acciones destructivas o irreversibles
- `Overlay` → acciones flotantes sobre contenido; ligereza y claridad sin bloquear información

*State — respuesta ante interacción:*
- `Default` → estado neutral, listo para usar
- `Hover` → realza contorno o fondo para comunicar disponibilidad
- `Pressed` → retroalimentación inmediata que confirma ejecución
- `Disabled` → atenúa colores, elimina feedback táctil, evita acciones no permitidas
- `Loading` → reemplaza el contenido por un Spinner; bloquea nuevas acciones hasta que finalice la operación

*Íconos:*
- `Has Left Icon` → refuerza el significado de acciones frecuentes (editar, agregar, buscar)
- `Has Right Icon` → representa acciones que abren menús, desplegables o flujos secundarios; comunica dirección o expansión
- `Right Icon` → valor preferido: `navigation/expand_more` para acciones desplegables
- `Left Icon` → cualquier ícono del sistema según la intención; `dashboard_customize` es solo referencia visual

*Texto:*
- Debe ser breve y directo; longitud moderada para evitar desequilibrios, especialmente en tamaños S

*Has Badge:*
- Habilita Badge integrado para indicar cantidades, novedades o alertas leves; ocultar si no tiene contenido

**Comportamiento:**
- Responde a cada interacción con variaciones de color, opacidad o elevación según la variante
- En `Loading`: el contenido se reemplaza por Spinner centrado, bloqueando nuevas acciones
- En `Disabled`: atenúa colores y elimina retroalimentación táctil

**✅ DO:**
- Usar `Primary` solo para la acción más importante de la vista
- Apoyar acciones secundarias en variantes menos prominentes (`Secondary`, `Tertiary`)
- Usar íconos para reforzar la intención, no para duplicar el significado del texto
- Usar Badge para novedades o cantidades cuando aporten contexto real

**❌ DON'T:**
- No usar demasiados botones en un mismo bloque — compiten entre sí y reducen la claridad
- No usar variantes `Danger` para acciones que no implican consecuencias graves
- No colocar íconos innecesarios en ambos extremos simultáneamente — entorpece la lectura
- No dejar el Badge visible si no tiene contenido
- No usar para navegación sin consecuencia directa — usar `Link`
- No usar para agrupar múltiples CTA — usar `ActionButtons`

---

### FAB Button

**Descripción:** Botón de acción flotante persistente para la acción principal de una pantalla. Forma circular pura, siempre accesible independientemente del desplazamiento.

**Casos de uso:**
- Acción primaria recurrente: crear contenido, añadir elementos, iniciar un proceso
- Pantallas con alta densidad de información donde un botón convencional perdería protagonismo
- Contextos mobile donde el espacio es limitado y la acción requiere énfasis visual constante
- Flujos de productividad, inventario, mensajería o navegación contextual donde la acción debe estar siempre disponible

**Comportamiento:**
- `Hover`: leve realce que confirma la intención de ser presionado
- `Pressed`: la superficie se comprime con retroalimentación inmediata que refuerza la acción
- `Loading`: Spinner toma protagonismo y bloquea interacciones adicionales para evitar acciones repetidas
- `Disabled`: reduce contraste y elimina respuesta al cursor o toque
- En todos los estados: mantiene forma circular pura y comportamiento cohesivo

**✅ DO:**
- Usar como la única acción principal de la pantalla cuando el usuario necesita acceso rápido a una función recurrente
- Mantener un único FAB Button por vista — evita confusión y preserva la jerarquía
- Usar `Tonal` en contextos donde la interfaz ya es muy saturada o el énfasis debe distribuirse de forma más equilibrada

**❌ DON'T:**
- No usar para acciones secundarias o de bajo impacto — su peso visual genera contradicciones en la narrativa de la interfaz
- No colocar en zonas donde compita con elementos críticos como navegación inferior o notificaciones persistentes
- No usar múltiples FAB Buttons en la misma vista — diluye el propósito y afecta la claridad del flujo
- No usar si ya hay un CTA primario visible y suficientemente accesible en pantalla

---

### Icon Button

**Descripción:** Acción directa representada por un ícono en área mínima. Disponible en variantes rellenas, sin relleno y Danger, con soporte de Badge opcional.

**Casos de uso:**
- Barras de navegación, encabezados, barras de herramientas, tarjetas
- Funciones repetitivas: refrescar, agregar elementos, abrir paneles laterales, activar filtros, acceder a configuraciones
- Editar, eliminar, copiar, cerrar en toolbars, celdas de tabla o listas
- Variantes rellenas o `Danger` cuando se requiere enfatizar la acción o transmitir advertencia
- Tamaños pequeños con variante sin relleno para mantener jerarquía en espacios reducidos sin sobrecargar la interfaz

**Comportamiento:**
- `Hover`: contenedor o ícono ajustan suavemente su contraste para comunicar disponibilidad
- `Pressed`: retroalimentación visual inmediata que refuerza la sensación de respuesta
- `Loading`: el ícono se sustituye por un Spinner manteniendo tamaño y alineación del contenedor, sin saltos visuales
- `Disabled`: pierde interactividad y la paleta se vuelve neutra sin perder legibilidad estructural

**✅ DO:**
- Usar variantes rellenas cuando la acción requiere énfasis y debe competir visualmente con otros elementos del layout
- Preferir tamaños M y L cuando el botón es crítico en la navegación
- Usar `Danger` únicamente en acciones sensibles que requieran atención inmediata
- Activar el Badge solo cuando haya información útil que justifique su presencia
- Combinar con Tooltip si el contexto del ícono no es suficientemente claro

**❌ DON'T:**
- No usar `Danger` para acciones neutras o rutinarias — distorsiona la jerarquía de importancia
- No usar tamaños pequeños en áreas de alta demanda táctil — compromete la usabilidad
- No usar el Badge como decoración o para información poco relevante
- No reemplazar el ícono por elementos que rompan la coherencia visual del sistema
- No usar para la acción principal de una pantalla — usar `Button` con texto

---

### Toggle Button

**Descripción:** Activa o desactiva una opción mostrando siempre su estado actual de forma clara y persistente. Combina iconografía, texto y feedback visual consistente.

**Casos de uso:**
- Activar filtros persistentes, seleccionar modos o resaltar preferencias con estado distinguible entre activo e inactivo
- Dashboards, controles de herramientas o paneles de configuración donde el usuario alterna estados con frecuencia
- Filtros activos/inactivos, selección de vistas (lista/grilla), opciones de formato en toolbars
- Configuraciones rápidas donde la interacción debe sentirse inmediata y constante

**Comportamiento:**
- `Hover`: cambio sutil en opacidad, color o elevación para comunicar disponibilidad
- `Pressed`: feedback inmediato que refuerza la acción
- `Is Active = true`: tratamiento visual más prominente que deja claro que el estado está seleccionado
- `Disabled`: bloquea eventos y atenúa elementos para evitar confusión
- Su función es mantener un estado seleccionado — no ejecutar acciones puntuales

**✅ DO:**
- Usar cuando el usuario necesita activar o desactivar estados de forma directa y constante
- Usar para filtros persistentes, modos de visualización y configuraciones rápidas
- Asegurar que la función — mostrar un estado seleccionado — sea evidente en todo momento

**❌ DON'T:**
- No usar como reemplazo de un botón de acción puntual — su naturaleza es mantener estado, no ejecutar acciones irreversibles o lineales
- No combinar ícono y texto si ambos transmiten exactamente la misma idea sin aportar claridad adicional
- No usar para selección exclusiva entre 3+ opciones — usar `Tabs` o `Select`
- No usar para confirmar acciones irreversibles

---

### Toggle Button Binary

**Descripción:** Selector de dos estados mutuamente excluyentes como botones contiguos.

**Casos de uso:**
- Alternar entre dos modos: Activo/Inactivo, Día/Noche, Lista/Grid

**✅ DO:**
- Usar cuando ambas opciones deben quedar visibles simultáneamente

**❌ DON'T:**
- No usar para más de dos opciones — usar `Tabs` o `Select`
- No usar cuando el estado on/off no necesita doble etiqueta — usar `Switch`

---

## 📊 Charts

---

### AreaChart

**Descripción:** Gráfico de área para visualizar tendencias y volúmenes a lo largo del tiempo.

**Casos de uso:**
- Evolución temporal de métricas: ventas, visitas, stock en dashboards
- Cuando el volumen acumulado es tan relevante como la tendencia

**✅ DO:**
- Usar con eje temporal definido (días, semanas, meses)

**❌ DON'T:**
- No usar para valores discretos sin relación temporal — usar `BarChart`
- No usar para comparar categorías sin eje temporal

---

### BarChart

**Descripción:** Gráfico de barras para comparar valores entre categorías o periodos.

**Casos de uso:**
- Comparación de métricas entre productos, períodos, sucursales
- Barras verticales / horizontales, apiladas o agrupadas

**✅ DO:**
- Usar para dimensiones categóricas discretas

**❌ DON'T:**
- No usar con demasiadas categorías que generen ilegibilidad
- Para tendencias continuas usar `AreaChart`

---

## 🖼️ Content

---

### Avatar

**Descripción:** Identificador visual compacto para representar la identidad de un usuario. Con imagen, iniciales o ícono.

**Casos de uso:**
- Listas de participantes, tarjetas de perfil, encabezados de detalle, comentarios, menús de usuario, chats
- Como disparador interactivo: abrir menú de usuario, visualizar perfil, mostrar estados adicionales
- Tamaños: xs / s / m / l / xl

**Comportamiento:**
- En `Hover`: elevación visual sutil o refinamiento de contorno — solo cuando es accionable
- En `Pressed`: cambio perceptible breve y reversible que confirma la interacción
- Con imagen (`Image`): siempre centrada y recortada en forma circular, sin distorsiones
- Con iniciales: texto alineado visualmente con contraste adecuado según el fondo
- Cuando no hay fotografía, las iniciales mantienen el componente operativo sin pérdida de contexto

**✅ DO:**
- Usar para reforzar el reconocimiento de personas en listas densas, reduciendo la necesidad de leer nombres completos
- Emplear como disparador para acciones de identidad (abrir menú de usuario, ver perfil)
- Asegurar que las iniciales sean legibles en todos los tamaños con contraste suficiente
- Mostrar iniciales cuando no hay imagen disponible (máx. 2 caracteres)
- Usar tamaños apropiados al contexto (S/XS en listas densas, L/XL en perfiles)

**❌ DON'T:**
- No usar tamaños grandes en espacios de alta densidad — rompe la jerarquía visual
- No aplicar estados Hover o Pressed cuando el avatar no es interactivo — genera confusión
- No usar imágenes sin recorte circular — la forma circular es parte esencial de su anatomía
- No usar para mostrar múltiples usuarios en grupo — usar `AvatarGroup`
- No usar como ícono genérico sin semántica de identidad

---

### AvatarGroup

**Descripción:** Grupo de avatares superpuestos con contador de excedente.

**Casos de uso:**
- Participantes de proyecto, equipo, conversación o tarea en espacio compacto

**✅ DO:**
- Usar cuando hay 3+ usuarios y el espacio no permite listarlos individualmente

**❌ DON'T:**
- No usar con 1 o 2 usuarios — usar `Avatar` individual
- No usar cuando la identidad individual es crítica y debe verse completa

---

### Carousel

**Descripción:** Contenedor para múltiples elementos desplazables que evita extender el layout vertical.

**Casos de uso:**
- Listados destacados, productos recomendados, galerías visuales, módulos editoriales, banners
- Pantallas de inicio o dashboards donde se alterna entre piezas informativas sin saturar
- Espacios reducidos donde la rotación de contenido aporta variedad sin interrumpir la experiencia

**Comportamiento:**
- Controles de flecha con estados propios de `IconButton`: Hover, Pressed y Disabled cuando no es posible avanzar más
- Los indicadores Dot se actualizan dinámicamente reflejando la posición actual del carrusel
- En dispositivos táctiles: desplazamiento lateral suave y responsivo
- Las transiciones entre elementos deben ser discretas — sin saltos abruptos que distraigan del contenido
- `Variant = Theme` para fondos complejos — asegura legibilidad de los controles

**✅ DO:**
- Mantener las flechas visibles cuando el carrusel contiene información crítica o la navegación debe ser explícita
- Usar `Variant = Theme` en fondos complejos para asegurar la legibilidad de los controles
- Mantener sincronía entre el contenido y los indicadores Dot

**❌ DON'T:**
- No ocultar los indicadores si el usuario necesita saber cuántos elementos existen o su posición actual
- No usar transiciones llamativas que distraigan del contenido
- No deshabilitar las flechas (`Arrows = off`) en desktop cuando el carrusel es el núcleo de la navegación — genera confusión si el contenido no avanza fácilmente
- No usar si el contenido es crítico y no puede ocultarse parcialmente

---

### DataList

**Descripción:** Lista de pares "dato + etiqueta" para exponer atributos de forma ordenada y escaneable.

**Casos de uso:**
- Vistas de detalle, paneles laterales, tarjetas expandibles, secciones de información resumida
- Datos de usuario, especificaciones de producto, propiedades de un registro, metadatos de proceso, información de estados
- Su capacidad de activar/desactivar filas permite ajustar dinámicamente la información mostrada sin duplicar componentes

**Comportamiento:**
- Componente principalmente estático — no tiene interacción propia
- Cuando las filas incluyen elementos interactivos (badges removibles, tags con acción), estos mantienen su propio comportamiento sin alterar la consistencia del DataList
- La visibilidad de cada fila cambia sin afectar la alineación general ni las distancias internas — la lectura se mantiene fluida aunque algunas filas no estén presentes
- No modificar la estructura interna de las filas — está diseñada para mantener consistencia visual en combinaciones variadas de contenido

**✅ DO:**
- Ajustar la cantidad de filas visibles según la información relevante del contexto
- Usar etiquetas enriquecidas (Tag, Badge, TagBusiness) cuando el contenido requiera transmitir categorías o estados
- Mantener los valores breves y fáciles de escanear, con equilibrio entre filas

**❌ DON'T:**
- No activar todas las filas por defecto si no aportan información — genera ruido visual innecesario
- No saturar una fila con elementos complejos o extensos que rompan la relación directa "dato + etiqueta"
- No modificar la estructura interna de las filas
- No usar para comparar múltiples entidades — usar `Table`
- No usar para listas de acciones — usar `ActionList`

---

### Headline

**Descripción:** Encabezado con jerarquía tipográfica prominente. Título + subtítulo opcional.

**Casos de uso:**
- Encabezado de sección, título de pantalla, inicio de bloque de contenido

**✅ DO:**
- Usar cuando se necesita jerarquía tipográfica fuerte sin acciones integradas

**❌ DON'T:**
- No usar si el encabezado necesita acciones o navegación — usar `Page Header`
- No usar en el interior de Cards o Listas

---

### Image

**Descripción:** Contenedor uniforme para contenido visual con proporciones y bordes consistentes.

**Casos de uso:**
- Thumbnails de producto, imágenes editoriales, fotografías de perfil (solo lectura)

**✅ DO:**
- Usar cuando se necesita garantizar proporciones fijas de imagen

**❌ DON'T:**
- No usar si el usuario necesita cargar o modificar una imagen — usar `ImageUpload`

---

### Tag

**Descripción:** Etiqueta compacta y configurable para señalar estados del sistema, categorías, atributos o filtros aplicados.

**Casos de uso:**
- Estados del sistema: Activo, Pendiente, Error, En tránsito, Cancelado
- Categorías de contenido, etiquetas funcionales, filtros aplicados, atributos destacados
- Celdas de tabla, bloques de metadatos, listas, tarjetas de producto, formularios avanzados
- Con `Is Closable = true`: funciona como chip interactivo en filtros donde el usuario puede remover valores

**Variantes de color y su semántica:**
- `Blue` → información primaria o neutra
- `Yellow` → advertencias leves
- `Green` → éxito o estados positivos
- `Red` → errores o alertas
- `Purple` → estados alternativos o contextuales
- `Disabled` → atenúa la etiqueta cuando no está disponible
- `Accent` → destacar con mayor fuerza visual
- `Theme` → se adapta al color temático del sistema
- `Gray` → opción discreta y neutral

Cada variante ajusta fondo, borde y color del texto manteniendo legibilidad.

**Comportamiento:**
- Tags closables responden a Hover y Pressed sobre el ícono de cierre, reforzando su interactividad
- En estado `Disabled`: todo el componente reduce contraste y bloquea interacciones
- El contenido recorta con ellipsis si el espacio es limitado, manteniendo proporciones
- Los cambios de variante no deben alterar la legibilidad del texto o íconos
- Los Tags de estado nunca quedan en gris por defecto
- Cambiar los 4 fills del componente al instanciar: bg + text + icon/dashboard + icon/close
- Colores semánticos recomendados por estado:
  - Entregado → bg `#dcfce7` / text+icon `#16803c`
  - Pendiente → bg `#fef3c7` / text+icon `#b45309`
  - En tránsito → bg `#dbeafe` / text+icon `#1d4ed8`
  - Cancelado → bg `#fee2e2` / text+icon `#b91c1c`
  - Inactivo → bg `#f1f5f9` / text+icon `#475569`

**✅ DO:**
- Usar colores de estado coherentes con su semántica
- Activar cierre (`Is Closable`) en filtros activos o chips interactivos
- Desactivar el ícono inicial si la semántica es puramente textual
- Usar `Size = S` en tablas o layouts densos
- Siempre cambiar los 4 fills cuando se usa como etiqueta de estado

**❌ DON'T:**
- No mezclar múltiples Tags con colores semánticos contradictorios en el mismo contexto
- No activar `Is Closable` en etiquetas puramente informativas
- No abusar de íconos si no aportan significado
- No usar variantes de color intensas para estados neutros
- No dejar el Tag en gris por defecto en pantallas de estado
- No usar para cantidades numéricas — usar `Badge`

---

### TagGroup

**Descripción:** Conjunto cohesivo de múltiples Tags relacionados.

**Casos de uso:**
- Colecciones de etiquetas en fichas de producto, resultados de búsqueda con múltiples categorías

**✅ DO:**
- Usar cuando hay 2+ etiquetas que conforman un conjunto

**❌ DON'T:**
- No usar con 1 sola etiqueta — usar `Tag` directo
- No usar para navegación entre secciones — usar `Tabs`

---

### Text

**Descripción:** Componente fundamental para texto con estilos tipográficos controlados.

**Casos de uso:**
- Párrafos descriptivos, instrucciones, subtítulos de sección, cuerpo de contenido

**⚠️ Comportamiento crítico:**
- `fontSize` 96px por defecto — siempre sobreescribir al instanciar

**✅ DO:**
- Usar para cualquier cuerpo textual dentro de un layout
- Sobreescribir siempre el tamaño tipográfico al instanciar

**❌ DON'T:**
- No usar para encabezados con jerarquía fuerte — usar `Headline`
- No usar para texto de acción — usar `Link` o `Button`
- No dejar `fontSize` en 96px

---

### UserMenu

**Descripción:** Identificador del usuario activo con nombre, rol y avatar, más un menú contextual de acciones personales.

**Casos de uso:**
- Barras de navegación, dashboards, sistemas internos, plataformas administrativas
- Sesiones autenticadas, flujos de administración de perfil, contextos multiusuario
- La combinación nombre + rol + avatar permite reconocimiento inmediato sin saturar la interfaz principal

**Comportamiento:**
- Reacciona a Hover aumentando contraste y aclarando que es interactivo
- `Is Active = true`: cambia el estado y despliega el panel con opciones del menú
- Los elementos del menú siguen patrones consistentes de Hover, Pressed y Focus
- `.item/Scrollbar`: asegura navegación fluida en listas largas dentro del menú sin romper la estructura del panel
- El avatar mantiene tamaño consistente y no pierde nitidez en ningún estado
- Los íconos funcionan como guías semánticas para cada acción, reforzando accesibilidad

**✅ DO:**
- Mostrar nombre y rol en entornos administrativos o colaborativos
- Usar `Variant` según el anclaje del componente en el layout
- Asegurar que las acciones del menú reflejen los permisos reales del usuario
- Mantener coherencia entre íconos y significado de las opciones
- Colocar siempre en la zona derecha del AppBar

**❌ DON'T:**
- No mezclar demasiadas acciones sin agruparlas lógicamente
- No mostrar roles redundantes si no aportan contexto funcional
- No usar expansiones complejas dentro del menú si el flujo no lo requiere
- No usar fuera del contexto de navegación principal
- No usar en apps sin autenticación

---

## 📣 Feedback

---

### Alert

**Descripción:** Mensaje destacado que comunica estados del sistema: éxito, advertencia, error o información contextual. Permanece visible mientras la información sea necesaria.

**Casos de uso:**
- `Success` → confirmar que una acción fue completada sin problemas
- `Warning` → preparar al usuario para riesgos o escenarios que requieren cautela antes de continuar
- `Error` → guiar la recuperación con mensaje claro y acciones disponibles para corregir la situación
- `Info` → entregar contexto adicional útil para la comprensión de un proceso o instrucción
- Formularios, procesos de compra, revisiones de contenido, dashboards operativos, flujos de carga o validación

**Comportamiento:**
- Se mantiene estable y visible mientras la información sea necesaria
- Cuando incorpora acciones: deben ser accesibles y claras
- El cierre desaparece suavemente sin animaciones intrusivas
- En dispositivos táctiles: el área del botón de cierre debe ser suficiente para precisión en el toque
- En transiciones de estado (ej. aparición de Error tras intento fallido): la aparición debe ser inmediata para reforzar la respuesta del sistema

**✅ DO:**
- Usar el estado correcto según la intención del mensaje: `Error` para bloqueos reales, `Warning` para cautela, `Success` para confirmación, `Info` para contexto
- Mantener el texto conciso y con tono orientado al usuario
- Habilitar acciones relevantes y claras cuando el mensaje requiere una decisión

**❌ DON'T:**
- No usar `Success` para destacar información general — es solo para confirmar acciones completadas
- No usar `Warning` para errores críticos que bloquean el flujo — usar `Error`
- No agregar acciones innecesarias que distraigan del propósito del alert
- No prolongar textos descriptivos cuando bastan pocas líneas para comunicar el mensaje central
- No usar para mensajes transitorios — usar `Notification`
- No usar para bloquear el flujo y requerir decisión explícita — usar `Modal`

---

### Badge

**Descripción:** Indicador compacto numérico, de estado o notificación que complementa otro componente. Su comportamiento es pasivo y dependiente del componente anfitrión.

**Casos de uso:**
- Notificaciones en navegaciones o dashboards
- Conteos asociados a listas dinámicas: mensajes, solicitudes, tareas pendientes
- Estados de validación o acentos visuales que refuerzan jerarquía dentro de un componente mayor
- Contador de notificaciones no leídas sobre ActionIcon, ítems en carrito, indicadores en tabs
- Variante indeterminada: cuando el número no es relevante pero la presencia de un estado sí lo es — señal visual mínima sin depender de un valor exacto

**Comportamiento:**
- No requiere interacción directa — componente pasivo
- Se adapta al tamaño y comportamiento del componente contenedor, manteniendo legibilidad y contraste
- Cuando el valor numérico aumenta: sigue siendo legible sin deformar el contenedor
- En variante indeterminada: el punto se mantiene centrado y proporcional a su tamaño
- Valores elevados: usar formatos abreviados ("99+") para mantener densidad visual estable

**✅ DO:**
- Usar el tamaño adecuado según el contexto del componente anfitrión
- Mantener valores breves y legibles; abreviar con "99+" cuando el conteo es elevado
- Usar la variante indeterminada solo cuando no sea necesario mostrar un número específico
- Usar siempre sobre un componente anfitrión (botón, ícono, tab)

**❌ DON'T:**
- No usar para transmitir mensajes extensos ni estados complejos
- No usar colores que no correspondan a la intención del estado
- No sobrecargar un componente con múltiples badges — genera confusión y ruido visual
- No usar como elemento independiente sin componente anfitrión
- No usar si el valor necesita explicación textual — usar `Tag`

---

### CSAT

**Descripción:** Recopila la percepción del usuario mediante íconos expresivos seleccionables. Diseñado para evaluaciones rápidas y sin fricción al finalizar procesos clave.

**Casos de uso:**
- Al finalizar procesos clave: compra, flujo de soporte, resolución de ticket, interacción con asistente virtual
- Monitoreo continuo de experiencia: al finalizar tareas en un dashboard, medir percepción sobre nuevas funcionalidades, recoger señales tempranas de fricción
- Contextos con espacio limitado: las variantes de tamaño permiten ajustar el componente manteniendo legibilidad
- Título y cuerpo de texto: contextualizan la pregunta cuando se necesita mayor claridad

**Comportamiento:**
- Cada ícono funciona como opción seleccionable con retroalimentación visual inmediata al pasar el cursor o al tocarlo
- Una vez seleccionada una opción: se muestra de forma destacada sin alterar el resto del conjunto de forma brusca
- Con textos activos: el área táctil de cada ícono debe mantener tamaño adecuado para accesibilidad
- `Disabled`: los íconos se ven atenuados y no reaccionan a interacciones
- El registro de evaluación debe ser instantáneo y permitir cambiar la selección sin fricción según el flujo

**✅ DO:**
- Usar el tamaño adecuado según el contexto
- Mantener visibles solo los textos necesarios para no sobrecargar el diseño
- Asegurar que la retroalimentación visual de selección sea clara y accesible

**❌ DON'T:**
- No mezclar estilos de íconos o escalas inconsistentes entre sí
- No mostrar títulos redundantes o descripciones demasiado extensas
- No usar `Disabled` para impedir la evaluación sin explicar claramente la razón en el flujo más amplio
- No usar si se requiere feedback detallado con preguntas abiertas
- No usar en mitad de un flujo crítico donde interrumpa la tarea principal

---

### EmptyState

**Descripción:** Vista para cuando se espera contenido pero aún no hay nada que mostrar. Guía al usuario hacia una acción que permita avanzar.

**Casos de uso:**
- Listas vacías, dashboards iniciales, módulos en blanco, resultados de búsqueda sin coincidencias
- Espacios recién configurados o módulos aún sin datos
- Onboarding de usuarios nuevos: introduce acciones recomendadas con contexto visual
- Con botones: funciona como punto de inicio en el flujo, invitando a explorar, añadir o configurar

**Comportamiento:**
- El componente no es interactivo en sí mismo — las acciones incluidas sí reaccionan con sus estados propios (Hover, Pressed, Disabled, Loading)
- Con `Has Image = true`: la imagen mantiene proporción y centrado armonioso, sin desbordes ni recortes abruptos
- La transición entre versiones con/sin botón o imagen ocurre sin romper el ritmo visual ni provocar saltos en el espaciado

**✅ DO:**
- Incluir un título claro y breve que explique la situación actual
- Usar imagen cuando se quiera transmitir una sensación amable o acompañar el mensaje con metáforas visuales
- Añadir botones cuando exista una acción clara que ayude al usuario a avanzar ("Crear nuevo", "Limpiar filtros")
- Usar cuando el estado vacío es esperado y no es un error del sistema

**❌ DON'T:**
- No recargar el mensaje con explicaciones extensas — el usuario debe entender el contexto de inmediato
- No usar ilustraciones que no representen el tono o propósito de la vista
- No incluir botones si no existe una acción útil o relevante — genera confusión o expectativa incorrecta
- No usar mientras el contenido se está cargando — usar `Skeleton` o `Loader`
- No usar si puede confundirse con un error del sistema

---

### Loader

**Descripción:** Comunica que el sistema está procesando una operación y el usuario debe esperar. Disponible en variantes con spinner, barra de progreso y logo para diferentes contextos y duraciones.

**Casos de uso:**
- Carga inicial de aplicaciones, procesos de autenticación, cálculos pesados, carga de contenido remoto, envío de información
- Pantallas de arranque o transiciones completas: variante con logo refuerza identidad y hace más agradable la espera
- Procesos breves: spinner como indicador discreto sin información adicional
- Cuando el progreso puede medirse (cargar archivos, sincronizar datos, renderizar contenido): barra de progreso para mostrar avance real
- Cuando la espera es mayor a ~1 segundo

**Comportamiento:**
- Aparece de forma fluida al iniciar la operación y desaparece tan pronto como se completa — sin retrasos artificiales
- Las animaciones son suaves y continuas para transmitir estabilidad
- Con barra de progreso: el avance debe reflejar el estado real del proceso
- Con spinner: el movimiento constante indica que el sistema sigue trabajando aunque la duración exacta no pueda determinarse
- El texto opcional se actualiza cuando la operación cambia de etapa — mantenerlo breve para no desviar la atención

**✅ DO:**
- Seleccionar la variante adecuada según el contexto visual y la duración de la operación
- Usar la barra de progreso cuando sea posible mostrar avance real
- Mantener el texto claro y breve
- Usar la variante con logo en cargas iniciales para reforzar identidad de marca

**❌ DON'T:**
- No usar para procesos instantáneos
- No usar animaciones demasiado rápidas o llamativas que generen distracción
- No mantener visible el loader más tiempo del necesario una vez completado el proceso
- No usar spinners oscuros en pantallas oscuras — perderán contraste
- No usar para indicadores inline pequeños — usar `Spinner`

---

### Notification

**Descripción:** Mensajes transitorios que aparecen sobre la interfaz sin interrumpir el flujo principal. Soporta modo oscuro y timer de auto-cierre.

**Casos de uso:**
- Confirmar cambios rápidos: guardado automático, envío exitoso, ajustes aplicados
- Avisar sobre errores recuperables sin requerir modal o interrupción mayor
- Advertencias o fallos que requieren acción: pueden incluir botones primarios o secundarios para respuesta rápida
- Avisos temporales que desaparecen automáticamente cuando se activa el timer

**Comportamiento:**
- Aparecen suavemente y se posicionan en un área consistente sin tapar elementos críticos
- Con timer activo: desaparecen automáticamente sin requerir interacción del usuario
- Al interactuar (cerrar o usar una acción): la respuesta debe sentirse inmediata
- Múltiples notificaciones: se organizan verticalmente sin superponerse, permitiendo descartar cada una individualmente
- En modo oscuro: adapta colores y contraste para mantener claridad y legibilidad

**✅ DO:**
- Elegir el estado correcto para mantener coherencia comunicacional (success, warning, error, info)
- Usar el timer para mensajes no críticos que no requieren acción del usuario
- Reservar las acciones (botones) para situaciones que realmente lo ameriten
- Asegurar contraste suficiente, especialmente en modo oscuro
- Acompañar el color con iconografía clara — no depender solo del color para comunicar el estado

**❌ DON'T:**
- No usar para mensajes demasiado extensos o complejos
- No saturar la pantalla con múltiples avisos seguidos
- No usar si el mensaje requiere acción antes de continuar — usar `Modal` o `Alert`
- No usar para errores de validación de formulario

---

### NumberIndicator

**Descripción:** Indicador numérico compacto para pasos o posiciones.

**Casos de uso:**
- Numerar pasos de un proceso, posiciones en rankings, contadores de selección prominentes

**✅ DO:**
- Usar cuando el número debe ser visualmente prominente y explícito

**❌ DON'T:**
- No usar para contadores de notificaciones — usar `Badge`
- No usar para mostrar progreso — usar `ProgressBar` o `ProgressCircle`

---

### ProgressBar

**Descripción:** Muestra el avance de un proceso como barra visual con texto descriptivo y valores numéricos opcionales. Ideal para procesos con etapas claras o tiempos relativamente predecibles.

**Casos de uso:**
- Cargas de datos, sincronizaciones, subidas de archivos, instalación de contenido
- Pasos secuenciales dentro de un flujo operacional
- Completitud de perfil, avance en proceso multi-paso
- Variantes compactas para interfaces con espacio limitado o donde se requiere menor peso visual

**Comportamiento:**
- La barra se actualiza de forma fluida conforme avanza el proceso — el movimiento debe sentirse natural, evitando saltos bruscos salvo que el sistema disponga de datos exactos
- En procesos rápidos: preferir un estado más simple para evitar valores cambiantes continuamente que resulten distractivos
- Con porcentaje habilitado: se alinea correctamente con su extremo correspondiente (inicio o final), manteniendo legibilidad en todos los tamaños
- No usar el placeholder en etapas donde ya existe progreso — confunde la percepción del estado real

**✅ DO:**
- Usar tamaños adecuados para el contexto
- Mostrar texto descriptivo cuando sea importante explicar la operación en curso
- Habilitar el porcentaje cuando se necesita comunicar precisión
- Asegurar contraste suficiente entre la barra base y la barra activa

**❌ DON'T:**
- No usar para procesos instantáneos
- No saturar la vista con demasiados elementos de texto si el proceso ya es evidente visualmente
- No usar el placeholder en etapas donde ya existe progreso real
- No usar si el progreso no es cuantificable — usar `Spinner` o `Loader`
- Para pasos discretos con nombres definidos usar `Stepper`

---

### ProgressCheckpoint

**Descripción:** Combina barra de progreso con punto de estado por ítem. Permite escanear rápidamente múltiples procesos independientes con su propio nivel de avance y condición.

**Casos de uso:**
- Flujos donde cada paso tiene un estado independiente: validaciones de datos, sincronización de múltiples fuentes, cargas por lotes
- Procesos de salud del sistema o dashboards donde cada módulo reporta su propio avance
- Vistas densas donde la estructura lineal + punto de estado permite identificar patrones o problemas rápidamente
- Con `Mode`: se adapta a modo claro u oscuro garantizando contraste y coherencia sin duplicar componentes

**Comportamiento:**
- Cada checkpoint actualiza su estado y barra de forma fluida, reflejando cambios en tiempo real
- Transiciones de estado (ej. Warning → Success): deben ser suaves para no generar distracción
- En entornos con múltiples elementos: mantener consistencia en tamaño, espaciado y contraste para asegurar lectura rápida
- En modo oscuro: los colores conservan suficiente diferenciación para que el estado sea reconocible con poca luminosidad

**✅ DO:**
- Seleccionar el tamaño adecuado según la densidad del layout
- Usar `Success`, `Warning` y `Error` solo cuando el proceso tiene significado semántico real
- Mantener contraste claro en ambos modos para que los checkpoints sean reconocibles en cualquier contexto

**❌ DON'T:**
- No usar estados semánticos sin un propósito real
- No mezclar modos claro y oscuro en una misma vista
- No usar tamaños grandes en tablas densas — afecta la legibilidad general
- No usar solo para progreso sin estado — usar `ProgressBar`
- No usar para flujos secuenciales con pasos nombrados — usar `Stepper`

---

### ProgressCircle

**Descripción:** Avance de proceso en formato circular. Compacto y visualmente equilibrado para cards, dashboards y espacios donde una barra horizontal sería menos apropiada.

**Casos de uso:**
- Sincronizaciones, validaciones, cargas de recursos modulares, estados de cálculo
- Contextos con espacio limitado o diseños que requieren cohesión con elementos circulares (íconos, avatares, métricas)
- Cards de resumen con métricas de completitud, widgets de dashboard, indicadores de objetivo
- El texto opcional aporta claridad en contextos guiados o cuando el usuario necesita información adicional sobre la acción

**Comportamiento:**
- El progreso se actualiza de forma continua sin saltos visuales, acompañando el ritmo del proceso real
- La transición del trazo debe sentirse natural y proporcional cuando el valor cambia
- El texto interno se mantiene perfectamente centrado independientemente del tamaño del círculo
- Con placeholder activo en estado inicial: comunica que el proceso aún no ha comenzado sin inducir a creer que existe progreso real

**Comportamiento crítico (Penpot):**
- `switchVariant` NO funciona en librería conectada — el swap del atom interior es SIEMPRE manual en Penpot UI
- `layoutChild`: usar `horizontalSizing="fix"` y `verticalSizing="fix"` — nunca `"fill"`
- Colores semánticos IT DS:
  - Theme `#2563eb` · Success `#16a34a` · Warning `#d97706` · Error `#dc2626` · Neutral `#64748b`

**✅ DO:**
- Usar el tamaño adecuado según la jerarquía de la vista
- Mostrar el porcentaje cuando se necesite claridad o precisión
- Asegurar contraste suficiente entre el trazo base y el trazo activo para que el avance sea evidente
- Mantener animaciones suaves y consistentes
- Informar al usuario que el swap de estado es manual en Penpot UI
- Usar colores semánticos del IT DS para el arco de progreso

**❌ DON'T:**
- No usar para procesos extremadamente rápidos
- No saturar el espacio interno con texto redundante
- No depender únicamente del color cuando el círculo es pequeño — dificulta la lectura del estado
- No intentar aplicar `switchVariant` esperando resultado — no funciona en librería conectada
- No usar con `horizontalSizing="fill"` — genera deformación
- No usar cuando el progreso es indeterminado — usar `Spinner`

---

### Rating

**Descripción:** Evaluaciones visuales mediante ítems seleccionables (estrellas u otros). Disponible en modo editable y solo-lectura, con variantes de color para codificación semántica o de marca.

**Casos de uso:**
- Evaluar productos, servicios, experiencias en línea o desempeños específicos
- Al cerrar interacciones relevantes: compras, reservas, soporte técnico
- Listados o tarjetas donde el puntaje forma parte de la información principal
- Estudios internos, dashboards de satisfacción o flujos de retroalimentación continua
- Escalas de 1 a 5 o 1 a 10

**Comportamiento:**
- Cada ítem reacciona al cursor o al toque con retroalimentación visual clara
- En Hover: puede convenir destacar temporalmente los valores previos para reflejar la puntuación potencial
- En estado activo: el puntaje elegido se representa inmediatamente con ítems llenos; el resto permanece vacío
- En modo editable: el usuario puede modificar su elección sin fricción
- En `Disabled`: permanece visible pero sin permitir interacción — indica que la evaluación está registrada o es solo informativa

**✅ DO:**
- Ajustar la cantidad de ítems según el propósito de la evaluación
- Usar colores semánticos o de marca para reforzar identidad
- Mantener los textos concisos y complementarios
- Asegurar tamaño adecuado para accesibilidad táctil en dispositivos móviles

**❌ DON'T:**
- No mezclar ítems activos e inactivos sin un patrón claro
- No usar escalas excesivamente largas cuando no aporten valor real
- No depender exclusivamente del color para indicar el puntaje — el contraste entre ítem lleno y vacío debe ser evidente por sí mismo
- No usar para feedback cualitativo — usar `CSAT` o campo de texto
- No usar para escalas de más de 10 puntos

---

### Skeleton

**Descripción:** Representación visual mínima y abstracta del contenido mientras se carga. Prefigura la estructura de los componentes reales sin asumir estilos finales específicos.

**Casos de uso:**
- Vistas con contenido dinámico: perfiles, tarjetas, formularios, listados, feeds, secciones completas
- Situaciones de red lenta o generación progresiva de contenido
- Diseños con múltiples tipos de elementos (texto, imágenes, acciones): los skeletons se adaptan para prefigurar cada tipo de componente

**Comportamiento:**
- Se muestran inmediatamente cuando el contenido inicia su carga
- Desaparecen tan pronto como los datos reales estén disponibles, reemplazándose de forma suave sin saltos
- Mantienen proporciones coherentes con los componentes reales que imitan — evitan generar expectativas incorrectas sobre la estructura final
- Sin interacción — funcionan exclusivamente como indicadores visuales de espera
- Diseño sutil para no parecer interactivos ni distraer del contenido final

**✅ DO:**
- Usar cuando la carga tarde más de un instante perceptible
- Mantener consistencia entre la forma del skeleton y el componente real
- Aplicar un diseño sutil y limpio — son una abstracción visual, no una simulación detallada

**❌ DON'T:**
- No usar para procesos extremadamente breves
- No usar en conjunto con loaders en el mismo espacio — crea ruido innecesario
- No simular contenido con demasiados detalles — deben ser solo una abstracción visual limpia
- No usar si la carga es instantánea (<200ms)
- No usar para procesos con progreso medible — usar `ProgressBar`

---

### Spinner

**Descripción:** Señal visual continua de procesamiento en curso.

**Casos de uso:**
- Carga inline dentro de botones, campos o secciones pequeñas
- Procesos cortos sin avance cuantitativo

**✅ DO:**
- Usar para indicadores inline de duración corta

**❌ DON'T:**
- No usar para procesos de más de ~3 segundos — usar `Loader` con texto
- No usar a nivel de pantalla completa

---

### Stepper

**Descripción:** Visualiza el avance dentro de un flujo de pasos discretos con orden definido. Puede actuar como resumen visual del progreso o como contenedor interactivo para navegar entre etapas.

**Casos de uso:**
- Flujos secuenciales donde el orden importa: registros, procesos de verificación, formularios extensos, onboarding, encuestas multinivel, procesos operativos donde cada paso depende del anterior
- Checkout, wizards de configuración, flujos de 3–8 pasos
- Con metadatos (fecha, usuario): contextualiza cada paso cuando se requiere claridad adicional
- Variante compacta: para vistas densas o cuando se necesita ahorrar espacio

**Comportamiento:**
- Cada paso actualiza su estado visual en función del progreso real del usuario
- Al avanzar: `In Progress` se mueve al siguiente paso; los anteriores pasan a `Success`
- Con error: el estado debe ser claramente distinguible y permitir que el usuario vuelva a corregir
- En configuración interactiva: los pasos pueden ser clicables para navegar directamente a una etapa (si el flujo lo permite)
- La línea de conexión se extiende fluidamente entre pasos y actualiza su estilo según el estado (completado, pendiente, error)
- Variante `Compact/Horizontal` — acceder a texto por índices §5f del skill

**✅ DO:**
- Mantener títulos breves y consistentes
- Usar la descripción solo cuando aporte claridad real
- Activar metadatos únicamente cuando el contexto los necesite
- Seleccionar `Full` o `Compact` según la densidad del layout
- Usar al inicio del body en flujos secuenciales de múltiples pasos
- Cambiar títulos, descripciones y contador ("1/3") a contenido contextual

**❌ DON'T:**
- No mezclar estados contradictorios (ej. un paso en `Success` sin que los anteriores se hayan completado)
- No saturar el componente con textos innecesarios
- No usar orientación horizontal en flujos demasiado largos — afecta la legibilidad
- No usar para progreso lineal sin etapas — usar `ProgressBar`
- No usar para mostrar historial — usar `Timeline`

---

### Tooltip

**Descripción:** Información contextual ligera que aparece al hover o focus sobre un elemento activador. No requiere clic para mostrarse y desaparece al retirar la interacción.

**Casos de uso:**
- Describir íconos no textuales, abreviaciones, estados o acciones discretas
- Interfaces densas con espacio limitado o componentes que priorizan minimalismo
- Proporcionar definiciones, aclarar funciones ambiguas o complementar accesos rápidos
- Alternativa ligera a modales o popovers para información no crítica

**Comportamiento:**
- Aparece de forma suave al hacer hover o focus sobre el elemento activador — desaparece al retirar la interacción
- No permanece fijo ni requiere clic para mostrarse
- La posición se ajusta dinámicamente para evitar colisiones con los bordes de la pantalla
- La flecha se mantiene alineada con el elemento que lo activa, reforzando la relación entre ambos
- Retardo mínimo al aparecer para evitar activaciones accidentales, pero con respuesta rápida cuando es realmente requerido
- Ajustar la dirección de la flecha según el layout y el espacio disponible

**✅ DO:**
- Usar para aclarar elementos ambiguos, íconos aislados o funciones avanzadas
- Mantener el texto breve, claro y conciso
- Ajustar la dirección de la flecha según el layout y espacio disponible
- Usar en desktop para enriquecer ActionIcon o Icon Button sin etiqueta

**❌ DON'T:**
- No usar para contenido esencial que el usuario deba ver siempre — usar texto auxiliar o `Alert`
- No usar textos excesivamente largos o complejos
- No usar en interfaces táctiles donde el hover no existe, a menos que haya un patrón alternativo claramente definido
- No usar en mobile donde no hay cursor

---

## 📝 Forms

---

### Checkbox

**Descripción:** Permite seleccionar una o varias opciones de forma independiente. Soporta estados no seleccionado, seleccionado e indeterminado.

**Casos de uso:**
- Formularios donde múltiples respuestas son válidas simultáneamente: filtros, configuraciones, listas de verificación
- Selección múltiple en listas, aceptar términos, activar opciones independientes
- Selección de filas en tabla
- Estado indeterminado: cuando en un grupo solo algunos ítems están seleccionados (ej. "seleccionar todos" parcial)

**Comportamiento:**
- Al hacer clic: alterna entre seleccionado y no seleccionado
- Estado indeterminado: indica selección parcial dentro de un grupo — no alterna directamente
- `Disabled`: la opción no está disponible temporalmente; no reacciona a interacción

**✅ DO:**
- Usar para opciones independientes que no se excluyen entre sí
- Agrupar opciones relacionadas visualmente
- Usar el estado indeterminado para representar selecciones parciales en grupos
- Reemplazar el texto por defecto con texto contextual al instanciar

**❌ DON'T:**
- No usar cuando solo una opción puede seleccionarse — usar `Radiobutton`
- No usar como botón de acción
- No omitir etiquetas descriptivas

---

### Date Input

**Descripción:** Campo de entrada de fecha con calendario desplegable y validación en tiempo real. Soporta formato manual y date picker visual.

**Casos de uso:**
- Cuando la fecha influye directamente en la acción principal: fechas de entrega, citas, filtros por día, vigencias
- Fecha de nacimiento, fecha de entrega, rango de fechas en filtros
- Cuando se requiere retroalimentación inmediata ante errores de formato o rango

**Comportamiento:**
- Admite ingreso manual (formato DD/MM/AAAA o similar) o a través del date picker desplegable
- Valida formato y coherencia de la fecha en tiempo real
- Soporta fechas mínimas y máximas habilitadas
- Muestra mensajes de error si la fecha es inválida o está fuera del rango permitido

**✅ DO:**
- Indicar claramente el formato esperado con placeholder o label secundario
- Restringir fechas disponibles cuando el contexto lo requiera
- Usar el date picker para facilitar la selección visual
- Validar en tiempo real, no solo al enviar

**❌ DON'T:**
- No usar texto libre sin formato definido para fechas
- No ocultar el formato esperado al usuario
- No usar para rangos de fechas — adaptar variante o usar componente de rango
- Para mobile táctil exclusivo usar `MobileDatePicker`

---

### Dropdown

**Descripción:** Lista desplegable para selección de una o múltiples opciones con feedback visual.

**Casos de uso:**
- Menús de opciones en formularios, filtros, configuraciones con lista extensa

**✅ DO:**
- Usar cuando la lista es demasiado larga para mostrar todos los ítems visiblemente

**❌ DON'T:**
- No usar para pocas opciones (≤3) — usar `Radiobutton` o `Toggle Button`
- No confundir con `Select` (que es el campo trigger del dropdown)

---

### File Input

**Descripción:** Campo para subir un único archivo con retroalimentación de estado (progreso, éxito, error) y visualización inmediata del archivo seleccionado.

**Casos de uso:**
- Formularios con subida de documentos, imágenes o comprobantes: registros de usuario, procesos administrativos, solicitudes internas, validaciones
- Cuando el usuario necesita ver inmediatamente qué archivo seleccionó, cancelar la carga o reemplazarlo
- Cuando existen reglas específicas: tamaños máximos, formatos permitidos o límites de peso

**Comportamiento:**
- Al hacer clic: abre el explorador de archivos del sistema operativo
- Muestra el nombre del archivo seleccionado una vez adjuntado
- Puede restringir tipos de archivo aceptados
- Muestra mensajes de error si el archivo no cumple requisitos (tipo, tamaño)
- Puede permitir selección múltiple de archivos

**✅ DO:**
- Especificar los tipos de archivo aceptados y el tamaño máximo permitido
- Mostrar el nombre del archivo seleccionado
- Proporcionar mensajes de error claros si el archivo no es válido

**❌ DON'T:**
- No usar si el usuario solo necesita tomar una foto desde móvil — usar `ImageUpload`
- No ocultar las restricciones de tipo y tamaño
- No permitir silenciosamente archivos inválidos
- No usar para gestión de múltiples archivos con vista avanzada — usar `File Uploader`

---

### Multiselect

**Descripción:** Selección de múltiples opciones desde una lista desplegable. Las selecciones activas se muestran como chips, etiquetas o texto resumido.

**Casos de uso:**
- Filtros avanzados con múltiples valores activos, asignación de etiquetas/categorías, selección de permisos o roles
- Interfaces con listas largas donde el espacio es limitado — alterna entre estados colapsados y expandidos
- Formularios con múltiples selecciones dependientes

**Comportamiento:**
- La lista permanece abierta hasta que el usuario la cierra explícitamente
- Las selecciones se muestran como chips con opción de eliminar individualmente (×)
- Variante `Chips`: cuando el desglose individual de selecciones es relevante (paneles de filtros)
- Variante `Filled Text`: resumen cuando hay muchas selecciones activas — evita saturación visual
- `Has More Selected`: simplifica el estado cuando el espacio es reducido
- En `Hover` y `Pressed`: el componente colapsado refuerza respuesta táctil o por cursor
- `Error`: borde y Helper text cambian para advertir validación
- `Disabled`: atenúa apariencia y bloquea interacción tanto en componente como en dropdown

**✅ DO:**
- Usar cuando el usuario debe elegir más de un elemento dentro de una categoría o filtro
- Usar variante `Chips` cuando el desglose individual de selecciones es relevante
- Usar `Filled Text` como resumen cuando la cantidad de selecciones es alta

**❌ DON'T:**
- No usar para selección única — usar `Select`
- No usar cuando hay ≤4 opciones que caben como checkboxes visibles
- No mostrar más chips de los necesarios en espacio reducido — usar `Has More Selected`
- No desactivar el ícono de despliegue cuando el dropdown está activo

---

### OTP Input

**Descripción:** Entrada de código de verificación de uso único distribuido en celdas independientes. El foco avanza automáticamente entre celdas al escribir.

**Casos de uso:**
- Verificación en dos pasos (2FA), recuperación de contraseña, confirmación de transacciones bancarias
- Validación de acceso temporal — códigos de 4–8 dígitos según estándar del backend

**Comportamiento:**
- `Pressed`: activa el foco indicando dónde se escribirá el siguiente carácter
- El foco avanza automáticamente a la celda siguiente al ingresar un número
- `Error`: todas las celdas adoptan borde de error sin perder su contenido
- `Success`: refuerza visualmente la validación del código completo
- `Hidden`: muestra solo puntos sin revelar valores — para datos bancarios o transacciones de alto riesgo
- Backspace en celda vacía: retrocede automáticamente a la celda anterior
- `Disabled`: ninguna celda acepta interacción aunque su estructura permanece visible
- Validar el código completo antes de mostrar estados Error o Success

**✅ DO:**
- Usar `Hidden` para OTP que protegen datos bancarios o transacciones de alto riesgo
- Mantener tamaño `L` en dispositivos móviles para mejorar precisión al escribir
- Validar el código completo antes de mostrar estados de Error o Success

**❌ DON'T:**
- No usar longitudes arbitrarias que no sigan estándares del backend (7 u 8 caracteres sin justificación)
- No reemplazar el avance automático entre celdas — aumenta errores y reduce velocidad de ingreso
- No mezclar celdas de distintos tamaños en un mismo OTP — compromete la percepción de secuencia
- No usar si el código no es numérico o su longitud es variable — usar `Text Input`

---

### Password Input

**Descripción:** Campo de contraseña con alternancia show/hide y validación visual de requisitos. Responde a todos los estados de interacción y validación.

**Casos de uso:**
- Login, registro, cambio de contraseña
- Contextos donde se requiere verificación visual temporal del contenido (dispositivos móviles, confirmación de escritura)
- Cuando el sistema define requisitos de seguridad que deben comunicarse al usuario

**Comportamiento:**
- El usuario puede alternar visibilidad de la contraseña mediante el ícono Show/Hide (cuando está habilitado)
- `Pressed`: el campo obtiene foco y permite escribir inmediatamente
- `Error`: cuando la contraseña no cumple requisitos — ajusta bordes, colores y mensajes
- `Success`: el borde adquiere tono positivo y el Helper text confirma la validez
- `Disabled`: no permite escritura ni visualización alternada; íconos se atenúan para evitar confusión

**✅ DO:**
- Permitir al usuario mostrar temporalmente la contraseña para evitar errores de tipeo
- Usar Helper text para explicar requisitos mínimos (longitud, caracteres permitidos, políticas de seguridad)

**❌ DON'T:**
- No desactivar el botón Show/Hide cuando el flujo se beneficia de revisiones visuales — limita accesibilidad y aumenta errores
- No usar el estado Error sin un mensaje claro que explique qué está fallando
- No usar para información no sensible — usar `Text Input`

---

### Phone Input

**Descripción:** Campo de número telefónico con selector de código de país (bandera + indicativo internacional) y validación contextual según el formato local.

**Casos de uso:**
- Registro de usuario, recuperación mediante SMS, contacto de soporte, formularios de registro
- Cuando es necesario capturar número completo con prefijo — reduce errores de prefijo incorrecto
- Flujos críticos de autenticación o contacto internacional

**Comportamiento:**
- Incluye selector de código de país con bandera e indicativo internacional seguido del campo de número
- `Default`: borde neutro, listo para interacción
- `Hover`: aclara la zona interactiva en escritorio
- `Pressed`: activa el foco y prepara el cursor para editar
- `Disabled`: bloquea entradas y atenúa todos los elementos, incluidas banderas e íconos
- `Error`: borde crítico y mensajes auxiliares para fallas de validación del código o número
- `Success`: confirma visualmente que el número cumple con los requisitos
- Ajusta automáticamente el formato al cambiar de país
- Valida el número según el formato del país seleccionado

**✅ DO:**
- Incluir selector de código de país con indicativo internacional
- Ajustar automáticamente el formato al cambiar de país
- Validar el número según el formato del país seleccionado
- Validar en tiempo real, no solo al enviar

**❌ DON'T:**
- No omitir el selector de país en contextos internacionales
- No aplicar un formato fijo único para todos los países
- No usar si el número es siempre local sin prefijo — usar `Text Input` con máscara

---

### Radiobutton

**Descripción:** Selección única dentro de un grupo de opciones mutuamente excluyentes. Al seleccionar una opción se deselecciona automáticamente la anterior.

**Casos de uso:**
- Selección de método de pago, preferencia, tipo de documento, opción de filtrado, modo de configuración
- Cualquier pregunta de opción única en formularios y encuestas
- Orientación vertical u horizontal según el espacio disponible

**Comportamiento:**
- Los Radiobuttons se presentan en grupo y permiten seleccionar una única opción
- Al seleccionar: se deselecciona automáticamente la anteriormente activa
- `Disabled`: opción no disponible — no responde a interacción

**✅ DO:**
- Usar cuando solo una opción puede seleccionarse de una lista mutuamente excluyente
- Preseleccionar la opción más común o recomendada cuando sea posible
- Agrupar visualmente los Radiobuttons relacionados con un label de grupo

**❌ DON'T:**
- No usar para más de 5–6 opciones — usar `Select`
- No usar cuando múltiples opciones pueden seleccionarse simultáneamente — usar `Checkbox`
- No presentar sin label descriptivo para cada opción

---

### Search Input

**Descripción:** Campo de búsqueda con ícono de lupa, botón de limpiar, sugerencias predictivas y búsqueda dinámica en tiempo real.

**Casos de uso:**
- Filtrar información, encontrar elementos dentro de una colección, navegar contenidos progresivamente
- Paneles complejos con dropdowns dinámicos de resultados sugeridos
- Filtros avanzados, listas jerárquicas, sistemas con grandes volúmenes de datos
- Barra de búsqueda en listados, filtros de tabla, búsqueda de productos

**Comportamiento:**
- Muestra resultados o filtra contenido en tiempo real mientras el usuario escribe (búsqueda dinámica con debounce)
- Ícono de lupa al inicio del campo
- Una vez con texto ingresado: muestra botón de limpiar (×) para borrar la búsqueda rápidamente
- Puede mostrar sugerencias o resultados en dropdown bajo el campo
- Soporta búsqueda al presionar Enter o automáticamente con debounce
- Mostrar estado "sin resultados" claro cuando la búsqueda no arroja coincidencias

**✅ DO:**
- Incluir el botón de limpiar una vez que hay texto ingresado
- Usar debounce para no saturar solicitudes al servidor
- Mostrar estado "sin resultados" claro cuando no hay coincidencias
- Reemplazar placeholder por texto contextual ("Buscar pedido...")

**❌ DON'T:**
- No usar como campo de texto genérico — usar `Text Input`
- No omitir el botón de limpiar
- No mostrar resultados sin ningún feedback de carga cuando la búsqueda tarda

---

### Select

**Descripción:** Selección única de un valor entre múltiples alternativas. Desktop: dropdown. Mobile: BottomSheet con RadioButton. La propiedad `Filled` refuerza la visibilidad de valores ya seleccionados.

**Casos de uso:**
- Formularios, filtros, configuraciones, paneles de acción donde el usuario elige exactamente una opción
- País, categoría, tipo, cualquier campo de elección con lista > 4 opciones
- Tamaños L / M / S para adaptarse a contextos de mayor o menor protagonismo

**Comportamiento:**
- Al hacer clic o foco: se despliega la lista de opciones
- El usuario selecciona una opción y la lista se cierra mostrando la selección en el campo
- Puede incluir búsqueda interna si la lista es extensa
- `Filled`: refuerza la visibilidad cuando hay un valor previamente seleccionado
- Soporta estado deshabilitado y de error

**✅ DO:**
- Usar cuando el usuario deba elegir exactamente una opción de una lista
- Incluir búsqueda interna si la lista supera 7–10 opciones
- Usar un placeholder cuando no haya valor por defecto
- Reemplazar el label por el campo contextual real al instanciar

**❌ DON'T:**
- No usar para listas de 2–3 opciones — usar `Radiobutton`
- No ocultar opciones críticas al final de listas largas sin búsqueda
- No usar para selección múltiple — usar `Multiselect`

---

### Switch

**Descripción:** Alterna entre dos estados (on/off) con efecto inmediato sobre el sistema. El "thumb" se desliza visualmente y el color del track cambia para indicar el estado.

**Casos de uso:**
- Activar/desactivar funcionalidades continuas: notificaciones, modo oscuro, privacidad, preferencias
- Ajustes que tienen efecto inmediato sin confirmación adicional
- A diferencia del Checkbox, comunica una acción "en curso" o estado con efecto inmediato, no una selección de lista
- Con `Variant = Box`: contextualiza mejor qué se está activando en entornos ricos en contenido

**Comportamiento:**
- El cambio de estado es inmediato al hacer clic o tap — sin confirmación
- El thumb se desliza de un lado al otro y el color del track cambia
- `Hover`: énfasis suave sobre el contenedor al pasar el cursor (especialmente útil en desktop)
- `Disabled`: desactiva totalmente la interacción, atenúa colores y reduce contraste del fondo y del deslizador
- Siempre acompañar de un label claro que describa el efecto del toggle

**✅ DO:**
- Usar para activar/desactivar funciones o configuraciones con efecto inmediato
- Acompañar siempre de un label claro que describa el efecto
- Reflejar el cambio de estado de inmediato en la interfaz

**❌ DON'T:**
- No usar cuando la acción requiere confirmación adicional — usar `Modal` de confirmación
- No usar para seleccionar entre dos opciones con nombres distintos — usar `Radiobutton` o `Toggle Button Binary`
- No omitir el label descriptivo
- No usar si la activación requiere guardar explícitamente — usar `Checkbox` + botón guardar

---

### Text Area

**Descripción:** Entrada de texto multilínea para volúmenes extensos. Soporta altura fija o auto-expandible, contador de caracteres y modo solo lectura (Static).

**Casos de uso:**
- Comentarios de formulario, descripciones de producto, mensajes para soporte, textos de observación
- Cualquier campo donde el usuario entrega información detallada de más de una línea

**Comportamiento:**
- Puede tener altura fija o ser auto-expandible conforme el usuario escribe
- Incluye contador de caracteres si hay un límite definido
- `Default`: contorno base listo para interacción
- `Hover`: refuerza que la zona es editable
- `Pressed`: activa el foco, marca el borde y muestra el cursor
- `Error`: comunica validación con borde y mensajes auxiliares en estilo crítico
- `Disabled`: atenúa el campo e impide escribir
- `Static`: muestra contenido en modo solo lectura — útil en vistas de detalle o revisión

**✅ DO:**
- Usar para entradas de texto extensas como comentarios, descripciones o notas
- Mostrar el contador de caracteres cuando exista un límite
- Considerar el auto-resize para mejorar la experiencia en entradas largas

**❌ DON'T:**
- No usar para entradas de una sola línea — usar `Text Input`
- No omitir el contador de caracteres si hay límite
- No usar un tamaño inicial tan pequeño que no refleje la cantidad de texto esperada
- No usar para edición enriquecida con formato — usar `Wysiwyg`

---

### Text Input

**Descripción:** Campo de entrada de texto de una sola línea. Versátil y estándar para datos cortos o mediana extensión. Soporta íconos prefijos/sufijos y todos los estados de interacción y validación.

**Casos de uso:**
- Nombres, correos, direcciones parciales, identificadores, cualquier texto breve y preciso en formulario
- Formularios grandes, paneles de ajustes, pasos de onboarding

**Comportamiento:**
- `Default`: campo listo para uso con borde neutro
- `Hover`: refuerza la interacción potencial
- `Pressed`: activa el foco, marca el borde y permite iniciar la escritura
- `Disabled`: bloquea interacción y atenúa todos los elementos
- `Error`: borde crítico y mensajes auxiliares para validación
- `Success`: confirma visualmente que el valor cumple los criterios
- `ReadOnly`: muestra valor fijo sin permitir edición
- Puede incluir íconos o acciones al inicio o al final del campo (prefijos, sufijos)
- Validar en tiempo real, no solo al enviar

**Comportamiento — índices de acceso (§5f):**
- `children[0]` → HelpText board → siempre ocultar con `.hidden = true`
- `children[1].children[1]` → Label → cambiar a texto contextual
- `children[1].children[0]` → "(Optional)" → ocultar si el campo es obligatorio
- `children[0].children[1].children[1]` → Placeholder → cambiar a texto contextual

**✅ DO:**
- Usar para campos de texto cortos de una sola línea (nombre, email, dirección)
- Combinar con Helper Text para dar instrucciones adicionales
- Definir validaciones claramente y mostrarlas en tiempo real
- Ocultar siempre el HelpText board al instanciar
- Cambiar Label y Placeholder a contenido real

**❌ DON'T:**
- No usar para texto multilínea — usar `Text Area`
- No omitir el label descriptivo
- No aplicar validaciones solo al enviar sin retroalimentación previa
- No usar para contraseñas — usar `Password Input`
- No usar para búsqueda — usar `Search Input`
- No dejar "Label" o "Placeholder" como texto visible

---

### Wysiwyg

**Descripción:** Superficie de edición de texto enriquecido (bold, listas, enlaces).

**Casos de uso:**
- Descripción de productos, mensajes con formato, publicaciones, formularios avanzados

**✅ DO:**
- Usar cuando el usuario necesita formato visual en el texto

**❌ DON'T:**
- No usar para texto plano sin formato — usar `Text Area`
- No usar en formularios simples de captura de datos

---

## 🗂️ Layout

---

### Accordion

**Descripción:** Bloques de información colapsables/expandibles con transiciones suaves entre estados cerrado y abierto.

**Casos de uso:**
- Paneles laterales, configuraciones, preguntas frecuentes
- Estructuras donde el usuario navega entre bloques sin perder el contexto general
- Con texto descriptivo: facilita la lectura progresiva
- Con componentes interactivos (Checkbox, Tag, Trailing Item): funciona como contenedor flexible para acciones puntuales

**Comportamiento:**
- El encabezado es la zona activa: al hacer clic cambia al estado expandido y actualiza el ícono indicador
- Puede reaccionar a elementos como Checkbox o Trailing Item sin interferir con el despliegue del contenido
- Cuando está abierto, mantiene la lectura estable aunque el contenido sea extenso o contenga otros componentes interactivos
- Preferir `Style = Box` en contextos densos o cuando cada sección debe percibirse como contenedor autónomo

**✅ DO:**
- Usar para agrupar información relacionada cuando se quiere reducir el ruido visual y facilitar la exploración
- Incorporar Subtitle, Badge o Tag solo cuando enriquecen la comprensión del encabezado
- Preferir `Style = Box` en contextos densos o donde cada sección debe percibirse como contenedor autónomo

**❌ DON'T:**
- No saturar el encabezado con demasiados elementos — afecta la claridad de la interacción
- No usar para contenido crítico que debe estar siempre visible
- No combinar Checkbox, Tag, Badge y Trailing Item simultáneamente sin un propósito claro que justifique el uso conjunto

---

### AppBar

**Descripción:** Barra de navegación principal persistente y responsiva. Mantiene acciones clave siempre disponibles: navegación primaria, accesos, buscadores, indicadores y acciones de cuenta.

**Casos de uso:**
- Aplicaciones complejas o multisección donde se necesita guía estructural constante
- Navegación principal: logo, menú, acciones globales, UserMenu
- Mobile: acceso rápido a lo esencial sin consumir espacio vertical excesivo — el menú hamburguesa escala el contenido sin comprometer ergonomía

**Variantes relevantes:**
- `AppBar / Desktop / Shadow` → cabecera de aplicaciones desktop
- `AppBar / Mobile / Open` → cabecera de pantallas mobile con título de página

**Comportamiento:**
- Hover y Pressed se aplican a íconos y botones mediante los estados propios de cada componente consumido
- Menú expandible en mobile: animaciones suaves al abrir/cerrar, manteniendo foco y accesibilidad
- Adaptive: reorganiza automáticamente los bloques al pasar entre desktop y mobile
- Modularidad: activar solo los bloques necesarios — permite simplificar o enriquecer según el flujo

**✅ DO:**
- Usar como punto de referencia constante para navegación y acciones clave
- Mantener consistencia entre desktop y mobile, preservando jerarquía y bloques estructurales
- Activar solo los bloques necesarios según el flujo
- Incluir en todas las pantallas de la aplicación que tengan navegación
- Cambiar el título de página en la variante Mobile

**❌ DON'T:**
- No sobrecargar con demasiados elementos — la barra debe ser ligera y enfocada
- No mezclar contenidos del menú mobile dentro de la estructura desktop
- No activar todos los bloques simultáneamente si no cumplen un propósito claro
- No usar en pantallas de onboarding o login sin navegación
- No combinar con `Navbar` simultáneamente

---

### AppShell

**Descripción:** Scaffold base completo: AppBar + Sidebar + área de contenido.

**Casos de uso:**
- Base estructural de toda pantalla de la aplicación con navegación completa

**✅ DO:**
- Usar como punto de partida para pantallas con AppBar + Sidebar integrados

**❌ DON'T:**
- No usar para pantallas standalone sin navegación lateral (login, onboarding)

---

### Bottom Sheet

**Descripción:** Panel deslizante desde la parte inferior de la pantalla para contenido complementario que no justifica navegar a otra vista. Adaptable desde superficies de texto hasta módulos estructurados.

**Casos de uso:**
- Decisiones rápidas, información breve, interacciones simples, acciones agrupadas
- Acciones contextuales en mobile, configuraciones rápidas, detalles de elemento
- Confirmación de acción sin modal completo — alternativa a `Modal` en mobile
- Con scroll: contenidos extensos manteniendo la experiencia acotada y clara
- Con `Sticky Header`: flujos con contenido largo donde el encabezado debe permanecer visible al desplazarse

**Comportamiento:**
- Se desliza desde la parte inferior con animación fluida, manteniendo continuidad visual
- Con scroll: el área central se vuelve scrollable mientras los botones permanecen fijos para mantener accesibilidad
- Con `Sticky Header`: el encabezado permanece visible al hacer scroll, evitando pérdida de orientación
- El botón de cierre responde a estados Hover, Pressed y Disabled según el contexto
- En mobile: puede incluir handle para comunicar que la hoja se puede expandir o contraer mediante gestos

**✅ DO:**
- Usar para contenido complementario sin abandonar la vista principal
- Mantener encabezados claros cuando la información es compleja
- Usar `Sticky Header` en textos extensos para evitar pérdida de orientación
- Incluir botones precisos y concisos para facilitar acciones rápidas

**❌ DON'T:**
- No sobrecargar con contenido demasiado complejo o jerarquías profundas
- No usar como sustituto de pantalla completa cuando la tarea requiere foco prolongado
- No desactivar el cierre cuando no existe otra forma evidente de salir
- No usar si el contenido requiere toda la pantalla — usar `Modal`
- No usar en desktop como sustituto de panel lateral

---

### Card

**Descripción:** Contenedor versátil para organizar información relacionada en superficie delimitada.

**Casos de uso:**
- Grillas de productos, usuarios o artículos, resúmenes de datos, ítems de lista con más densidad visual

**✅ DO:**
- Usar como unidad de contenido en grillas o listas con mayor riqueza visual

**❌ DON'T:**
- No usar para contenido puramente tabular — usar `Table`
- No usar Cards anidadas

---

### Card Image

**Descripción:** Card con imagen integrada para mostrar contenido enriquecido en layouts verticales u horizontales.

**Casos de uso:**
- Catálogos de productos, listados editoriales, tarjetas de noticias, módulos de recomendación
- Secciones destacadas en dashboards donde se combina imagen con información esencial
- Flujos que requieren comparación visual o exploración secuencial de tarjetas
- Estructura flexible: permite incluir título, subtítulo, descripción, Tags y acciones sin perder claridad

**Comportamiento:**
- Cuando la tarjeta es clicable: cambio leve de elevación, tonalidad o borde en Hover — refuerza la navegabilidad
- `Style = Shadow`: la elevación aumenta de forma discreta en Hover
- `Style = Outline`: refuerzo sutil del borde en Hover
- Los botones internos mantienen sus propios estados de interacción sin interferir con la interacción general de la tarjeta
- El contenido visual se adapta al espacio disponible preservando proporciones y evitando recortes abruptos
- `Orientation = Horizontal` → vista amplia / `Orientation = Vertical` → rejillas y tarjetas compactas

**✅ DO:**
- Elegir `Orientation` según la estructura del layout: horizontal para vista amplia, vertical para grillas
- Incluir Tags solo cuando aporten claridad contextual (categorías, estados, atributos clave)
- Mantener el Body Text breve — debe complementar, no competir con la imagen o el título

**❌ DON'T:**
- No saturar con demasiados elementos cuando la tarjeta es compacta — afecta la jerarquía visual
- No usar `Style = Shadow` en entornos ya muy cargados visualmente — incrementa el ruido
- No reemplazar la imagen por elementos que rompan la proporción o la coherencia del componente

---

### CardFeature

**Descripción:** Card de contenido destacado para piezas que requieren protagonismo visual. Disponible en variantes `SideImage` y `BGImage`, y tamaños `M` y `L`.

**Casos de uso:**
- Páginas de inicio, landings, dashboards o listados donde ciertas piezas necesitan mayor visibilidad
- Banners de características, secciones promocionales, destacados de producto
- `SideImage` → layouts donde la imagen acompaña al texto sin dominarlo; contenido informativo o listados
- `BGImage` → imagen de fondo protagonista con mayor dramatismo y presencia; contenidos visuales o promocionales

**Tamaños:**
- `L` → secciones principales o contextos con más espacio disponible
- `M` → listados, grillas densas o superficies más compactas

**Comportamiento:**
- `Hover`: puede elevar ligeramente el card, incrementar sombra o aumentar contraste según el estilo global
- `Pressed`: contracción suave o atenuación que comunica compromiso
- `Focus`: resalta borde o contorno para accesibilidad
- En variante `BGImage`: mantener degradado sobre la imagen para asegurar legibilidad del texto superpuesto

**✅ DO:**
- Usar `SideImage` para contenido informativo o en listados
- Preferir `BGImage` cuando la imagen es protagonista y define el mensaje
- Mantener títulos breves y descriptivos
- Asegurar suficiente contraste entre texto e imagen en `BGImage`

**❌ DON'T:**
- No usar imágenes con bajo contraste sin agregar overlays o degradados
- No usar texto demasiado extenso — debe ser una vista previa, no el contenido completo
- No recargar el card con demasiados badges o elementos secundarios
- No usar `L` en contextos muy densos donde pueda romper la estructura visual
- No usar para contenido operativo o datos tabulares — usar `Card` o `ActionList`

---

### Counter

**Descripción:** Ajustador de cantidades enteras con controles explícitos de suma y resta. Comunica visualmente los límites permitidos y estados especiales.

**Casos de uso:**
- Seleccionar unidades de un producto, configurar parámetros mínimos y máximos, indicar estados especiales como "eliminado"
- Cuando el usuario necesita percibir con claridad los límites permitidos y recibir señal visual inmediata ante errores
- Listas de ítems donde se requiere cohesión visual y semántica con rótulos y subtítulos contextuales

**Comportamiento:**
- `Default`: incremento/decremento con plena disponibilidad visual
- `Hover`: los controles se realzan para comunicar interactividad
- `Pressed`: retroalimentación inmediata que confirma la acción
- `Disabled`: botones pasivos, valor visible sin permitir ediciones
- `Error`: resalta controles relevantes en tono crítico, guiando la corrección inmediata
- `Determined Min`: al alcanzar el mínimo, el control de restar se desactiva
- `Determined Max`: al alcanzar el máximo, el botón de sumar queda inhabilitado
- `Deleted`: reduce densidad visual y prioriza elementos necesarios para la gestión del ítem

**✅ DO:**
- Usar cuando el usuario necesite ajustar cantidades de forma rápida y precisa
- Usar orientación vertical en listas ricas en contenido donde la identificación del ítem es crucial
- Usar el estado `Error` para señalar límites excedidos o valores inválidos

**❌ DON'T:**
- No usar para entrada numérica compleja — usar campo numérico de texto
- No mostrar subtítulo cuando no aporte información relevante
- No habilitar el botón de eliminar en flujos donde esa acción no forma parte del objetivo principal
- No usar para valores no numéricos o no secuenciales — usar `Select`
- No usar para rangos muy amplios — usar `Text Input` numérico

---

### Drawer

**Descripción:** Panel deslizante lateral para profundizar en un ítem o completar una tarea relacionada con el contexto actual sin abandonar la vista principal. Combina encabezado opcional, zona de contenido intercambiable y área de acciones inferior.

**Casos de uso:**
- Revisar detalles, editar información de un registro, ver historiales, gestionar configuraciones avanzadas
- Filtros en desktop, configuración de columnas de tabla, detalles de elemento en panel lateral
- Extensión lateral del contexto — no un contenedor de procesos extensos con muchas etapas

**Propiedades:**

- `Swap` → controla si la zona de contenido usa un bloque intercambiable (`.item/Swap`): permite inyectar distintos layouts o módulos sin alterar la estructura general
- `Header` → cuando activo: usa Headline, Tag y botón de cierre para comunicar contexto; cuando inactivo: versión minimalista donde el contenido explica el propósito
- `Action Buttons` → cuando activo: franja de botones (ActionButtons o Button) para confirmar, cancelar o ejecutar acciones; cuando inactivo: las acciones se delegan al contenido interno
- `Close Section` → cuando activa: salida directa visible desde la parte superior; cuando inactiva: el cierre debe ocurrir por otras vías — usar con cuidado para no generar encierro
- `Scroll` → cuando activo: integra `.item/Scrollbar` para que el área de contenido sea scrollable mientras header y acciones permanecen fijos; cuando inactivo: se asume contenido breve que cabe en el alto disponible
- `Tag` → cuando activo: aporta información compacta en el header (estado, categoría, tipo)

**Comportamiento:**
- Se anima al aparecer desde un lateral, manteniendo el fondo visible para reforzar el contexto
- Con `Header` activo: permanece fijo mientras el contenido interno se desplaza (con `Scroll = true`)
- Botón de cierre: responde a Hover y Pressed mediante comportamientos propios de `ActionIcon`
- Botones de acciones: heredan estados de `Button` y `ActionButtons` (Hover, Pressed, Disabled, Loading)
- Accesibilidad: debe orientar el foco al abrirse al primer elemento interactivo relevante (botón primario o primer campo), y permitir navegación por teclado

**✅ DO:**
- Usar cuando se necesita profundizar en información relacionada sin abandonar el contexto actual
- Mantener el header activo para tareas con impacto alto donde el usuario deba recordar qué está editando
- Aprovechar `Scroll` para contenidos largos, manteniendo visibles título y botones de acción
- Incluir la `Close Section` en la mayoría de los casos para asegurar una salida clara

**❌ DON'T:**
- No usar como reemplazo de un flujo completo con múltiples pasos y navegación compleja — usar pantalla dedicada
- No desactivar todas las vías de cierre visibles si el usuario no tiene otra forma evidente de volver
- No saturar el contenido con demasiados componentes interactivos que hagan el Drawer más denso que la pantalla principal
- No usar para contenido urgente que requiere atención inmediata — usar `Modal`
- En mobile preferir `Bottom Sheet`

---

### Filter Panel

**Descripción:** Panel lateral dedicado a organizar filtros complejos o numerosos, ofreciendo un espacio estructurado para combinar criterios sin perder el contexto de los resultados.

**Casos de uso:**
- Catálogos de productos, listados con alto volumen de ítems, dashboards con filtros dinámicos
- Cualquier entorno donde el usuario combine múltiples atributos para acotar resultados: categoría, precio, estado, fecha
- Escenarios con cantidad variable de filtros — el panel se adapta sin perder orden gracias al scrollbar opcional
- Colocado en el costado de la interfaz para no interrumpir la vista de resultados

**Comportamiento:**
- Se abre y cierra suavemente, manteniendo estabilidad en el layout
- La búsqueda interna responde en tiempo real filtrando la lista visible de controles
- Con scrollbar activo: el bloque superior (título y acciones) permanece fijo para mantener accesibilidad constante
- Las acciones finales (aplicar / limpiar) deben mantenerse visibles en la base del panel aunque el usuario se desplace
- El activador del panel puede mostrar un Badge para comunicar filtros aplicados sin necesidad de expandirlo

**✅ DO:**
- Usar para organizar filtros complejos o numerosos, manteniendo consistencia visual en sus controles
- Activar el scrollbar siempre que exista riesgo de desbordar contenido
- Añadir búsqueda interna cuando el listado de filtros supera la inmediatez visual
- Colocar siempre fuera del flujo principal como panel lateral o drawer

**❌ DON'T:**
- No incluir acciones que no estén directamente relacionadas con el filtrado
- No duplicar controles ni añadir componentes ajenos al propósito del panel
- No desactivar el scrollbar en paneles extensos — compromete el uso y rompe la composición del layout
- No usar si los filtros son pocos (≤3) y caben como chips o toggles inline
- No usar dentro de un Modal

---

### List (ActionList / NavigationList / ToggleList)

**Descripción:**
- **ActionList:** Fila accionable que combina contenido visual con texto, indicadores y acciones directas sobre un ítem
- **NavigationList:** Fila orientada a navegación con chevron o trailing item como affordance explícito de "ir a otra vista"
- **ToggleList:** Fila con control binario (toggle) para activar o desactivar un estado directamente desde la lista

---

#### ActionList

**Casos de uso:**
- Catálogos de productos, accesos rápidos, módulos de acciones frecuentes, configuraciones, item cards en flows
- Cualquier situación donde el usuario necesita comprender un ítem y actuar inmediatamente sobre él
- Interfaces informativas, experiencias de compra, gestión o navegación que mezclan contenido visual con accionabilidad explícita

**Comportamiento:**
- Responde a Hover, Pressed y Focus cuando corresponde
- `Variant = Box`: elevación aumenta sutilmente en Hover para reforzar accionabilidad
- `Variant = Outline`: el borde se intensifica como feedback visual sin recargar
- `Is Disabled = true`: ningún elemento reacciona a la interacción
- Leading y trailing items mantienen su propia lógica visual sin alterar la jerarquía del componente

**✅ DO:**
- Elegir cuidadosamente el Leading Item para reforzar la identidad del contenido
- Usar Description cuando el usuario necesita contexto adicional para decidir la acción
- Adaptar la variante: `Default` para listas neutras, `Outline` para separar elementos, `Box` para destacar acciones clave

**❌ DON'T:**
- No mezclar demasiados elementos visuales que compitan entre sí — priorizar siempre la claridad
- No usar si no existe una acción relevante — genera ruido
- No activar `Is Selectable` si el flujo no requiere selección persistente — confunde la intención del componente

---

#### NavigationList

**Casos de uso:**
- Menús de navegación, accesos a vistas de detalle, listados configurables, opciones en paneles laterales
- Menús de cuenta, secciones de apps mobile donde cada fila representa un destino distinto
- Catálogos y configuraciones donde el ítem funciona como puerta de entrada a más información

**Comportamiento:**
- Responde a Hover, Pressed y Focus según la plataforma
- El chevron se mantiene estable como indicador visual de navegabilidad
- `Variant = Box`: el hover puede aumentar la elevación sutilmente
- `Variant = Outline`: el borde se intensifica para señalizar interacción
- `Is Disabled = true`: ninguna parte del componente reacciona a interacción
- Leading Item y Trailing Item mantienen su propia lógica pero no compiten con el affordance principal de navegación

**✅ DO:**
- Usar el chevron cuando la fila representa claramente un destino
- Incluir Leading Item que refuerce la identidad del contenido
- Usar Description para comunicar contexto relevante sin recargar la vista
- Elegir la variante visual adecuada al patrón del layout

**❌ DON'T:**
- No deshabilitar `Has Chevron` cuando el ítem representa navegación — genera ambigüedad
- No combinar demasiados elementos visuales que distraigan del propósito principal
- No usar `Variant = Box` si la jerarquía del contenido no lo amerita — puede romper el ritmo visual

---

#### ToggleList

**Casos de uso:**
- Paneles de preferencias, configuraciones de usuario, ajustes de contenido
- Listas de elementos activables, catálogos donde funciones pueden encenderse o apagarse
- Módulos donde la acción principal es alternar un estado — especialmente útil en mobile o listas extensas donde se evita navegar a pantallas adicionales

**Comportamiento:**
- Responde a Hover, Pressed y Focus cuando el ítem está habilitado
- El toggle mantiene su propio set de interacciones: Default, Hover, Pressed, Disabled, Active
- `Variant = Box`: puede elevar ligeramente en Hover para reforzar la acción
- `Variant = Outline`: el borde se intensifica levemente al interactuar
- `Is Disabled = true`: ni la fila ni el toggle reaccionan a interacción

**✅ DO:**
- Incluir Description cuando el usuario necesite comprender el efecto del cambio antes de activarlo
- Elegir toggle binary o toggle regular según la naturaleza del ajuste
- Incluir Leading Items para facilitar el reconocimiento rápido de la opción
- Usar `Variant = Box` para módulos destacados o secciones importantes

**❌ DON'T:**
- No mezclar demasiados elementos visuales que compitan con el toggle — la acción debe mantenerse clara
- No activar `Is Selectable` si el flujo no requiere selección múltiple
- No reemplazar el toggle por íconos que no representen interacción — puede confundir al usuario

---

**Comportamiento — índices (§5f para NavigationList):**
- `children[0].children[1].children[1]` → Title → texto contextual
- `children[0].children[1].children[0]` → Subtitle → texto contextual
- `children[0].children[2].children[0].children[0]` → Badge → `.hidden = true` si no aplica

**Regla general:**
- No usar para ítems solo informativos sin interacción — usar `DataList`
- No mezclar tipos de List (ActionList / NavigationList / ToggleList) en el mismo contexto

---

### Menu

**Descripción:** Menú contextual desplegable con opciones o acciones sobre un elemento específico.

**Casos de uso:**
- Menú de "tres puntos" en cards o filas de tabla, acciones contextuales sobre un ítem

**✅ DO:**
- Usar para acciones contextales de un elemento específico (editar, duplicar, eliminar)

**❌ DON'T:**
- No usar para acciones globales de pantalla — usar botones en header
- No usar como navegación principal

---

### Modal

**Descripción:** Ventana superpuesta centrada sobre un fondo atenuado que bloquea la interacción con el resto de la interfaz. Estructura con encabezado, cuerpo intercambiable y área de acciones inferior.

**Casos de uso:**
- Situaciones donde el usuario debe atender algo en el momento: revisiones urgentes, confirmaciones destructivas, pasos críticos
- Información que modifica la decisión inmediata dentro del flujo
- Con variante `Content`: contenido más largo pero acotado, organizado mediante el área intercambiable

**Propiedades:**

- `Variant = Text` → mensajes narrativos, descripciones detalladas o contenido explicativo directo sin estructura adicional
- `Variant = Content` → incorpora bloque intercambiable (`.item/Swap`) para tarjetas, secciones visuales o contenido estructurado; útil cuando el mensaje excede un simple texto
- `Has Body Content` → cuando activo: muestra el mensaje completo; cuando inactivo: solo título y botones — adecuado para confirmaciones muy concisas
- `Body Content` → texto narrativo principal en variante `Text`; bloque central de lectura
- `Has Icon` → cuando activo: ícono junto al título (valor por defecto `info`) para reforzar el propósito comunicacional (información, alerta, contexto)
- `Icon` → permite sustituir el ícono según el tipo de mensaje manteniendo la estructura
- `Has Title` → Headline esencial cuando el modal comunica decisiones relevantes; puede omitirse en casos muy simples
- `Has Action Buttons` → cuando activo: `ActionButtons` o `Button` para guiar la respuesta del usuario; cuando inactivo: mensaje informativo sin respuesta obligatoria
- `Has Scrollbar` → cuando activo: integra `.item/Scrollbar` para contenido más extenso sin alterar header ni botones; cuando inactivo: se asume contenido breve

**Comportamiento:**
- Aparece centrado sobre fondo atenuado que bloquea la interacción con el resto de la interfaz
- Header y acciones permanecen fijos; el contenido puede desplazarse cuando `Has Scrollbar = true`
- Botón de cierre: estados Hover y Pressed con retroalimentación clara
- Botones de acción: heredan estados de `Button` y `ActionButtons` (Hover, Pressed, Disabled, Loading)
- Al abrirse: el foco debe dirigirse al título o al primer elemento interactivo para favorecer accesibilidad
- Permite navegación por teclado y cierre por interacción explícita — no debe encerrar al usuario

**✅ DO:**
- Usar cuando la información requiere atención inmediata
- Mantener título e ícono para reforzar el propósito cuando el mensaje es relevante
- Ajustar el contenido según las variantes para no sobrecargar la interfaz
- Activar el scrollbar cuando el contenido sea más extenso de lo habitual
- Incluir botones de acción con texto contextual ("Confirmar", "Cancelar")

**❌ DON'T:**
- No usar modales repetidamente en un mismo flujo — incrementan la carga cognitiva
- No usar para procesos largos o configuraciones complejas — usar pantalla dedicada
- No saturar el contenido con demasiada información visual que distraiga del mensaje principal
- No usar para mensajes informativos sin acción — usar `Notification` o `Alert`
- En mobile para acciones rápidas preferir `Bottom Sheet`

---

### Page Header

**Descripción:** Encabezado de página con título, breadcrumb opcional y acciones de nivel de página.

**Casos de uso:**
- Inicio de cualquier pantalla de contenido con título y acciones (filtrar, exportar, crear)

**Comportamiento — índices (§5f):**
- `children[0].children[1]` → Title
- `children[0].children[0]` → Subtitle

**✅ DO:**
- Usar en el header de toda pantalla de contenido operativo
- Cambiar Title y Subtitle a nombres contextuales de la pantalla

**❌ DON'T:**
- No usar en overlays (Modal, Drawer)
- No usar en pantallas de onboarding o login

---

### Product File

**Descripción:** Ficha de producto que centraliza atributos clave, valores editables, acciones directas y estados en un único bloque para contextos de backoffice.

**Casos de uso:**
- Paneles de administración, ediciones por lote, pasos intermedios de registro, vistas de comparación
- Formularios avanzados y módulos donde el usuario alterna entre lectura y edición
- Flujos internos donde la manipulación de información del producto debe ser ágil

**Estructura interna:**
El componente se compone de tres capas:
1. **Cabecera (Product Information):** imagen del producto e inputs informativos principales
2. **Contenido editable (Items):** uno o varios valores configurables mediante texto, contador o swap
3. **Acciones y complemento (Action / Tags / Divider):** acciones rápidas, navegación o separación visual según el tipo seleccionado

**Comportamiento:**
- Respeta los estados de los subcomponentes: focus, hover, error, activo e inactivo
- Las variantes con selección permiten marcar elementos sin afectar la edición interna
- `Type = Action`: el contenido debe seguir siendo plenamente legible y la acción claramente diferenciada
- El Divider, cuando está presente, establece jerarquía sin romper la continuidad visual
- Las etiquetas deben colocarse de forma que no saturen el área principal

**✅ DO:**
- Usar Header Tags para destacar estados del producto desde el primer vistazo
- Activar Bottom Component cuando sea necesario editar múltiples atributos
- Usar Select cuando el flujo opere en modo lote
- Preservar la jerarquía entre título, inputs y valores para facilitar la lectura

**❌ DON'T:**
- No sobrecargar la cabecera con inputs innecesarios
- No combinar demasiados tipos de Items sin justificación
- No mezclar edición y navegación si el flujo no requiere ambas
- No usar solo para visualización — usar `DataList` o `Card`
- No usar en contextos ecommerce de vitrina — usar `ProductEcommerce`

---

### Sidebar

**Descripción:** Panel de navegación lateral fijo o colapsable para aplicaciones con múltiples categorías. Mantiene navegación siempre visible sin sacrificar espacio central.

**Casos de uso:**
- Aplicaciones internas, paneles administrativos, dashboards, sistemas con múltiples categorías
- Flujos donde el usuario alterna continuamente entre vistas
- `Collapsed` → libera superficie para el contenido; navegación compacta mediante íconos
- `Expand` → pone énfasis en la lectura; muestra títulos, subniveles, badges e información adicional

**Variante recomendada:** `Sidebar / Expand / Shadow` → "Click Expand"

**Comportamiento:**
- `Hover`: destaca ítems para reforzar intención y mantener claridad
- `Active`: permanece visible para orientar al usuario dentro del flujo
- `Expand`: despliega submenús con transiciones suaves, conservando jerarquía
- `Collapsed → Expand`: alterna entre navegación compacta y extendida — disparado por hover o clic según el caso de uso
- `Disabled`: bloquea y atenúa el ítem sin reaccionar a interacciones
- `Shadow` y `Outline`: separan visualmente el sidebar del contenido según el estilo elegido
- La interacción con subniveles usa íconos de expansión

**Comportamiento crítico (Penpot):**
- En layout dashboard: `dir="row"` → Sidebar (fix width, fill height) + main (fill width, fill height)
- Ajustar orden de capas en Penpot UI: Sidebar debe estar por encima de "main" en panel Capas

**✅ DO:**
- Usar para estructurar navegación profunda y persistente
- Mantener el número de ítems visible acorde al contexto; ocultar los innecesarios
- Aprovechar el modo `Collapsed` para maximizar el espacio de trabajo
- Usar `Expand Action` cuando el usuario necesite alternar entre modos
- Cambiar los nombres de los ítems a secciones reales de la app

**❌ DON'T:**
- No sobrecargar la navegación con demasiados subniveles
- No mezclar ítems principales y secundarios sin jerarquía clara
- No usar Badge en exceso — solo cuando aporta valor real
- No forzar el modo expandido si el flujo requiere enfoque total en el contenido
- No usar en mobile — usar `Navbar` o navegación inferior

---

### Table

**Descripción:** Formato filas/columnas para leer, comparar, ordenar, filtrar y actuar sobre grandes volúmenes de datos estructurados. Componente central para herramientas de trabajo.

**Casos de uso:**
- Paneles administrativos, dashboards, catálogos internos, reportes, listados de inventario
- Flujos de aprobación, exploración de elementos, órdenes de compra, usuarios, productos
- Cualquier vista que requiera lectura comparativa con búsqueda, filtros, selección y acciones integradas

**Comportamiento técnico (Penpot):**
- Tags de estado en celdas: cambiar los 4 fills por color semántico
- Textos de columnas y celdas accesibles por índices §5f

**✅ DO:**
- Usar para listados operativos donde se comparan múltiples atributos
- Cambiar el nombre de la tabla y los encabezados de columna a contenido contextual

**❌ DON'T:**
- No usar para ≤5 ítems sin necesidad de comparación — usar `DataList`
- No usar en mobile sin scroll horizontal controlado

---

#### Table Header

**Descripción:** Sección superior de la tabla con controles principales: título, búsqueda, acciones, filtros y botones.

**Comportamiento:**
- Organiza dinámicamente los elementos según disponibilidad: si solo hay búsqueda, ocupa el área principal; con múltiples botones, ajusta el espaciado manteniendo jerarquía visual
- IconButtons mantienen sus estados de Hover/Pressed
- El buscador sigue sus patrones de focus y validación

**✅ DO:**
- Mantener el buscador visible si la tabla tiene más de 20 registros
- Colocar el título cuando la tabla forma parte de un conjunto de secciones
- Usar botones apropiados según la importancia de cada acción

**❌ DON'T:**
- No sobrecargar la cabecera con demasiadas acciones
- No mezclar filtros y botones sin orden lógico

---

#### Table Cells

**Descripción:** Elemento atómico de contenido dentro de la tabla. Puede presentar texto, acciones, etiquetas, menús, loaders, controles de selección y contenido expandible.

**Casos de uso:**
- Celdas de texto simple, acciones por fila, estados con Tag, descargas, edición, eliminación
- Menús contextuales, indicadores múltiples, filas expandibles, skeletons para datos cargando
- Tablas de inventarios, configuraciones, órdenes de compra, productos, usuarios

**Comportamiento:**
- Las celdas responden a Hover cuando son interactivas
- Celdas de tipo `Head` muestran affordances de ordenamiento cuando `Is Sortable = true`
- Con `Is Expandable = true`: el ícono rota o cambia suavemente para indicar el estado
- Variante `Loading`: Skeleton reemplaza el contenido hasta que los datos estén disponibles
- Action Menus y Action Icons siguen sus propios patrones de interacción, incluyendo menús emergentes

**✅ DO:**
- Usar subtítulos cuando los datos necesiten contexto adicional
- Activar selección en flujos de acciones masivas
- Usar más de un Tag solo si aporta información real

**❌ DON'T:**
- No mezclar demasiadas acciones en una sola celda — priorizar las principales
- No usar `Expandable` en filas que no requieran realmente contenido adicional
- No usar Skeleton si los datos ya están disponibles

---

#### Paginator

**Descripción:** Control de paginación para navegar entre páginas de resultados de la tabla.

**Comportamiento:**
- **Selección de resultados por página:**
  - Desktop: el usuario puede elegir entre 10, 20, 30, 40 o 50 resultados por página
  - Mobile: siempre 10 resultados por página — no es editable
  - La cantidad seleccionada se mantiene al navegar entre páginas
- **Navegación:**
  - El número de página es editable — al hacer clic, el usuario puede escribir la página deseada
  - Las flechas permiten avanzar o retroceder una página a la vez
- **Validaciones:**
  - Si el número ingresado excede el total de páginas, se restablece el valor anterior
  - Botón "Atrás" se desactiva en la página 1
  - Botón "Adelante" se desactiva en la última página
  - Si hay menos de 10 resultados totales, el dropdown de selección no se muestra

**✅ DO:**
- Centrar el componente en el contenedor, tanto en desktop como en mobile
- Permitir edición directa del número de página
- Validar entradas para evitar navegación a páginas inexistentes

**❌ DON'T:**
- No mostrar el selector de resultados si hay menos de 10 resultados totales
- No permitir valores fuera del rango válido en el campo editable

---

### ViewMoreLess

**Descripción:** Alterna entre un estado contraído y expandido para revelar contenido extenso de forma progresiva, evitando saturación visual.

**Casos de uso:**
- Textos largos: descripciones, políticas, especificaciones técnicas
- Tarjetas, fichas de producto, secciones de ayuda, módulos informativos
- Contenidos modulares que pueden mostrarse en capas
- `Instance Swap` en Section 1 y Section 2: permite mostrar contenido variado según contexto

**Comportamiento:**
- El botón alterna entre "View More" y "View Less" según el estado del componente
- Los íconos cambian suavemente entre `expand_more` y `expand_less`, reforzando la acción visual
- El contenido expandido aparece de forma fluida sin desplazar abruptamente el layout
- `Style = Content`: las secciones intercambiables mantienen espaciado y alineación independientemente de su complejidad
- `Style = Text`: el componente respeta saltos de línea y longitudes de párrafo sin afectar la legibilidad

**✅ DO:**
- Usar `Style = Text` para contenido largo que el usuario no necesita ver completo de inmediato
- Aprovechar Section 2 para bloques que aportan contexto adicional pero no son esenciales en el estado inicial
- Mantener títulos o encabezados dentro de las secciones si el contenido es modular
- Usar variantes coherentes con el tono del resto de la interfaz

**❌ DON'T:**
- No ocultar contenido crítico bajo el estado expandible
- No usar contenido muy dispar entre Section 1 y Section 2 — genera saltos visuales bruscos
- No usar en flujos que requieren acceso inmediato a toda la información
- No usar cuando hay menos de 3 líneas adicionales ocultas

---

## 🧭 Navigation

---

### Breadcrumb

**Descripción:** Secuencia lineal de enlaces separados por ícono direccional que representa niveles ascendentes de navegación. Reduce la carga cognitiva en aplicaciones con profundidad jerárquica real.

**Casos de uso:**
- Aplicaciones con profundidad jerárquica real: carpetas, subpáginas, rutas largas, estructuras en árbol
- Administración, catálogos, proyectos, documentación — contextos donde se refuerza la ubicación actual
- Páginas de detalle en jerarquías de 3+ niveles, backoffice con estructura de carpetas

**Estructura:**
- Ícono `home` inicial como punto de referencia del nivel raíz
- Ítems encadenados que organizan la ruta completa, cada uno con ícono opcional + texto
- Separador `chevron_right` acompaña a cada nivel para reforzar la direccionalidad
- El último ítem corresponde a la vista actual (estado activo)

**Comportamiento:**
- Cada enlace responde a interacciones con cambios sutiles en color, subrayado o peso tipográfico
- El estado activo se mantiene constante para reforzar la ubicación actual
- Si el enlace está deshabilitado: no responde a clics ni al foco de teclado
- Los íconos opcionales acompañan, no compiten con el texto
- El separador derecho se muestra solo cuando existe un siguiente nivel
- Orden en índices (Penpot): `children[0]` → página actual / `children[N]` → niveles superiores

**✅ DO:**
- Usar nombres breves y directos para los niveles
- Mantener el ícono de home en el primer ítem
- Aprovechar el ícono izquierdo para categorías cuando sea útil
- Usar en pantallas de detalle dentro de jerarquías profundas

**❌ DON'T:**
- No saturar cada ítem con demasiados íconos
- No usar como menú lateral ni como navegación principal
- No usar textos demasiado largos que generen recortes o truncamientos
- No usar en interfaces planas o con navegación horizontal simple
- No usar en pantallas de inicio
- No usar en apps de un solo nivel o jerarquía plana

---

### Divider

**Descripción:** Separador visual estático para dividir conceptos relacionados, marcar transiciones temáticas y ofrecer puntos de referencia en flujos de información continuos.

**Casos de uso:**
- Paneles extensos, formularios largos, configuraciones con múltiples apartados
- Listados segmentados o secciones de navegación interna
- Con texto: funciona como separador descriptivo que contextualiza el contenido siguiente (sub-secciones claramente diferenciadas)

**Comportamiento:**
- Elemento estático — sin interacción directa
- En versiones con texto: el espaciado se ajusta para que el contenido no invada áreas cercanas ni genere interrupciones abruptas en la lectura
- La línea conserva grosor uniforme — evitar saltos visuales al combinar divisores verticales y horizontales en el mismo layout
- Combinar `Horizontal` y `Vertical` según el patrón de composición del contenido

**✅ DO:**
- Usar texto cuando sea necesario introducir sub-secciones claramente diferenciadas
- Asegurar suficiente espacio alrededor del divisor para que respire dentro del layout
- Combinar orientaciones Horizontal y Vertical según el patrón de composición

**❌ DON'T:**
- No usar si el contenido ya está suficientemente agrupado — genera fragmentación innecesaria
- No usar textos demasiado largos dentro del separador — debe funcionar como descriptor breve
- No alterar el grosor o estilo del divisor para propósitos decorativos — su función es estructural
- No usar si el espacio en blanco ya separa suficientemente el contenido

---

### Link

**Descripción:** Acceso a acciones de menor jerarquía o rutas complementarias, claramente identificable como interactivo sin competir con elementos primarios.

**Casos de uso:**
- Acciones complementarias: "Ver más detalles", "Editar", "Aprender más", "Olvidé mi contraseña", "Términos y condiciones"
- Rutas internas donde se busca mantener experiencia fluida sin sobrecargar visualmente
- Formularios o paneles de información donde se necesita vincular contenido sin competir con elementos primarios
- Con ícono: cuando se necesita reforzar el significado de la acción o aportar mayor reconocimiento visual
- Navegación secundaria dentro de un párrafo de texto

**Comportamiento:**
- `Hover`: incrementa la claridad visual para señalar disponibilidad sin llamar demasiado la atención
- `Pressed`: reduce levemente el contraste o modifica el subrayado, ofreciendo retroalimentación inmediata
- `Disabled`: conserva la estructura pero elimina interacción, color y énfasis para evitar ambigüedades
- El subrayado aparece o se refuerza en Hover y Pressed — ayuda a distinguir el enlace de otros elementos textuales en contextos complejos

**✅ DO:**
- Usar para acciones de menor jerarquía o rutas complementarias
- Combinar con ícono cuando la acción se beneficia de pistas visuales que clarifiquen su propósito
- Preferir `Size = M` como configuración predeterminada para coherencia en la mayoría de pantallas

**❌ DON'T:**
- No usar cuando la acción es primaria o crítica — usar `Button`
- No combinar demasiados íconos en una misma vista o dentro de un mismo enlace — reduce legibilidad y genera ruido
- No usar `Variant = Theme` para enlaces que no aportan valor jerárquico — puede competir con elementos de mayor prioridad
- No usar para acciones destructivas

---

### Navbar (Bottom Navigation)

**Descripción:** Barra de navegación inferior con íconos y etiquetas para acceso directo y permanente a las secciones principales de la aplicación. Diseñada para 3 a 5 secciones.

**Casos de uso:**
- Aplicaciones con 3–5 secciones principales donde se garantiza acceso directo y permanente
- Catálogos, dashboards, cuentas personales, flujos de autoservicio de uso frecuente
- Navegación principal en mobile (bottom navigation)

**Comportamiento:**
- `Hover` (cuando aplica): el ícono aumenta sutilmente su contraste
- `Pressed`: retroalimentación táctil o visual que confirma el toque
- `Active`: permanece visible hasta que el usuario selecciona otro tab
- Con 5 tabs: mantener equilibrio visual para que ninguno se sienta desproporcionado
- Badge: activar solo cuando aporte valor informativo real (conteo, novedad)

**✅ DO:**
- Usar etiquetas claras y cortas
- Priorizar íconos reconocibles e inmediatos
- Mantener visible el estado activo en todo momento
- Activar el Badge solo cuando aporte valor

**❌ DON'T:**
- No saturar la barra con más de 5 tabs
- No usar etiquetas extensas
- No usar íconos que requieran interpretación compleja
- No usar `Style = Box` en pantallas con excesiva elevación o contraste innecesario
- No usar si ya existe un `AppBar` con navegación completa
- No usar cuando la navegación es jerárquica o tiene rutas profundas — usar patrón lateral o encabezado fijo

---

### Tabs

**Descripción:** Navegación entre sub-vistas de contenido paralelo y complementario dentro de la misma jerarquía. La navegación entre tabs es instantánea sin animaciones excesivas.

**Casos de uso:**
- Contenido paralelo, complementario y de la misma jerarquía donde el usuario alterna sin perder el hilo
- Activos/Inactivos, Detalles/Historial/Documentos — 2–5 secciones de igual jerarquía
- `Style = Default` → superficies minimalistas; énfasis en la línea activa
- `Style = Box` → tarjetas o paneles estructurados; borde o fondo cambian según estado
- `Style = Tonal` → entornos más suaves; la superficie coloreada se intensifica o atenúa según interacción

**Comportamiento:**
- `Hover`: incrementa contraste o cambia fondo para indicar intención sin activar el tab
- `Pressed`: sigue los estados nativos según el estilo — puede cambiar borde, subrayado o tonalidad
- `Active`: permanece visible como referencia constante sobre la sección actual
- `Disabled`: impide interacción y comunica indisponibilidad
- `children[1].children[N]` → Tab N → texto contextual
- Badge en tab → ocultar si no aplica

**✅ DO:**
- Usar cuando el contenido está al mismo nivel jerárquico
- Mantener textos breves y claros — evitar etiquetas extensas
- Asegurar suficiente espacio horizontal; distribuir tabs según densidad
- Activar el Badge solo cuando la información aporte valor real
- Cambiar los nombres de los tabs a secciones reales

**❌ DON'T:**
- No mezclar tabs con jerarquías profundas o que impliquen navegación externa
- No usar íconos innecesarios si no refuerzan la comprensión
- No saturar un set con demasiados tabs — limitar a lo esencial
- No usar `Box` o `Tonal` cuando la interfaz necesita máxima ligereza
- No usar si las secciones tienen jerarquía diferente — usar `Breadcrumb`
- No usar para navegación entre pantallas distintas — usar `Sidebar` o `AppBar`

---

## 📤 Upload

---

### Attachment

**Descripción:** Componente modular para la carga y gestión de archivos adjuntos. Soporta estados de progreso, error y acciones contextuales. Disponible en layouts `Preview` y `Horizontal`.

**Casos de uso:**
- Flujos de carga o gestión de archivos: formularios, paneles de administración, editores de contenido
- Áreas donde el usuario sube múltiples documentos con control de estado individual
- `Preview` → archivos visuales o cuando la miniatura agrega valor para el reconocimiento rápido
- `Horizontal` → flujos compactos o listas extensas donde la densidad es prioritaria

**Comportamiento:**
- `Charging` → muestra barra de progreso e íconos de acción como cancelar
- `Hover` → realza acciones secundarias (descargar, eliminar) respetando los estados propios de ActionIcon
- `Filled` → acciones disponibles de forma inmediata
- `Error` → destaca la superficie en rojo y expone HelpText con mensaje explicativo
- `Disabled` → desactiva interacciones, elimina contraste e iconografía activa
- La transición entre estados debe ser suave y clara — el usuario debe entender si un archivo está en proceso, completado o fallido

**✅ DO:**
- Usar `Preview` para archivos visuales o cuando la previsualización agrega valor
- Usar `Horizontal` para listas extensas o flujos compactos
- Comunicar errores siempre con HelpText
- Activar solo las acciones necesarias según permisos del usuario

**❌ DON'T:**
- No saturar de acciones — priorizar las más utilizadas
- No ocultar el tamaño del archivo si es relevante para el flujo
- No usar `Preview` si no hay valor real en la miniatura
- No mostrar el botón de descarga mientras el archivo está cargando

---

### File Uploader

**Descripción:** Contenedor para subir, listar y gestionar múltiples archivos con drag-and-drop, lista y vista grid/preview. La subida es una acción central del flujo.

**Casos de uso:**
- Formularios de onboarding, carga de documentos legales, comprobantes de pago, envío de evidencias en tickets de soporte
- Desktop: bloque completo del layout con área amplia de arrastre
- Pantallas densas: vista compacta con lista o grid, manteniendo la misma lógica de interacción
- Vista lista: detalle del archivo (nombre, tipo, peso, acciones) — lectura rápida alineada con otros campos
- Vista grid/preview: cuando importa el contenido visual del archivo (imágenes, capturas) — refuerza reconocimiento mediante miniaturas

**Comportamiento:**
- Presenta drop zone visible con instrucciones
- Al arrastrar un archivo sobre la zona: cambia de estado para indicar que puede soltarse
- Tras soltar o seleccionar: muestra progreso de carga y estado final (éxito o error)
- Permite eliminar archivos ya cargados
- Puede restringir tipos y cantidad de archivos

**✅ DO:**
- Mostrar el progreso de carga para cada archivo
- Permitir al usuario eliminar archivos antes de enviar
- Indicar claramente los tipos y tamaños permitidos dentro de la drop zone

**❌ DON'T:**
- No usar si solo se requiere un archivo y la experiencia de drag & drop no agrega valor — usar `File Input`
- No ocultar el estado de carga
- No bloquear la interfaz completa durante la carga
- No usar para imágenes de perfil o fotos — usar `ImageUpload`

---

### ImageUpload

**Descripción:** Carga y previsualización de imágenes. Adapta automáticamente su estado entre vacío (con iconografía de carga) y vista previa de imagen cargada.

**Casos de uso:**
- Foto de perfil, imagen de producto, banner, miniatura, documentos gráficos, evidencias fotográficas
- Tamaños grandes: flujos donde la imagen es elemento central (fichas de producto, portadas)
- Tamaños pequeños: interfaces compactas, tarjetas, grids de edición, carga modular de múltiples imágenes

**Comportamiento:**
- Muestra previsualización de la imagen seleccionada antes de confirmar la carga
- Permite recortar o reencuadrar la imagen si se requiere
- Valida tipo de archivo (JPG, PNG y formatos de imagen) y tamaño máximo
- Ofrece opción para eliminar la imagen ya cargada y seleccionar una nueva

**✅ DO:**
- Mostrar siempre una previsualización de la imagen
- Indicar las dimensiones o proporción recomendada
- Permitir al usuario reemplazar la imagen fácilmente

**❌ DON'T:**
- No usar para documentos no visuales — usar `File Input` o `File Uploader`
- No omitir la previsualización
- No permitir formatos no visuales (.pdf, .docx)

---

## 🛒 Ecommerce

---

### ProductEcommerce

**Descripción:** Card de producto con imagen, nombre, precio, descuentos, etiquetas y acciones de carrito. Balance entre densidad informativa y claridad visual.

**Casos de uso:**
- Listados de productos, carruseles, recomendaciones, módulos destacados, resultados de búsqueda
- Cualquier vista donde se presenten múltiples artículos de forma comparativa
- Facilita la lectura inmediata de precios, descuentos y promociones con acciones directas (agregar al carro, ver detalle)
- `Position = Vertical` → grillas / `Position = Horizontal` → filas amplias

**Comportamiento:**
- `Type = Box`: puede elevarse ligeramente en Hover para reforzar la interactividad
- `Position = Horizontal`: el espaciado se adapta sin comprometer la proporción de la imagen ni la jerarquía de precios
- Las etiquetas superiores se mantienen visibles y legibles en todas las variantes
- Las acciones del botón reaccionan con sus propios estados (Hover, Pressed, Disabled, Loading) sin afectar el resto de la tarjeta

**✅ DO:**
- Mostrar siempre el precio principal con jerarquía clara
- Incluir etiquetas superiores cuando existan beneficios o descuentos importantes
- Elegir `Position` según el contexto del layout: `Vertical` para grid, `Horizontal` para filas amplias
- Usar `Type = Box` para destacar productos estratégicos dentro del catálogo

**❌ DON'T:**
- No mostrar múltiples precios promocionales innecesarios — genera ruido visual
- No saturar la tarjeta con demasiados tags sin jerarquía clara
- No usar `Position = Horizontal` en espacios estrechos — compromete la legibilidad
- No usar en contextos de backoffice o gestión interna — usar `Product File`
- No usar para servicios o contenidos sin precio

---

## 🔧 Utilidades / Internos

---

### HelpText

**Descripción:** Texto auxiliar debajo de campos de formulario para guiar la interacción.

**Casos de uso:**
- Explicar formato esperado, restricciones o errores de validación bajo un campo

**Comportamiento crítico:**
- Al instanciar cualquier TextInput, PasswordInput o PhoneInput → ocultar siempre con `.hidden = true`

**✅ DO:**
- Mostrar solo cuando hay información adicional útil para el usuario

**❌ DON'T:**
- No usar si la instrucción ya está clara en el label del campo
- No usar para errores de servidor — usar `Alert` o `Notification`
- No dejar visible en pantalla al instanciar campos de formulario

---

### MobileDatePicker

**Descripción:** Selector de fechas optimizado para pantallas táctiles móviles.

**Casos de uso:**
- Variante mobile del `Date Input` para flujos exclusivamente táctiles

**✅ DO:**
- Usar exclusivamente en pantallas mobile

**❌ DON'T:**
- No usar en desktop — usar `Date Input` estándar

---

### Progress Steps

**Descripción:** Indicador compacto de pasos con puntos visuales para flujos simples.

**Casos de uso:**
- Onboarding corto, tutoriales de 3–5 pasos sin necesidad de labels por paso

**✅ DO:**
- Usar para flujos cortos donde los pasos no tienen nombres distintos

**❌ DON'T:**
- No usar si los pasos tienen nombres o estados distintos — usar `Stepper`

---

## 📋 Guía de decisión rápida

### ¿Qué componente de navegación usar?

| Situación | Componente |
|---|---|
| Navegación principal de la app | `AppBar` |
| Secciones laterales en desktop | `Sidebar` |
| Sub-vistas en la misma pantalla | `Tabs` |
| Profundidad jerárquica | `Breadcrumb` |
| Navegación inferior mobile | `Navbar` |

### ¿Qué componente de selección usar?

| Situación | Componente |
|---|---|
| Selección única, lista larga | `Select` |
| Selección múltiple | `Multiselect` |
| Opciones ≤3 mutuamente excluyentes | `Radiobutton` |
| Varias opciones independientes | `Checkbox` |
| Estado on/off inmediato | `Switch` |
| Dos modos con doble etiqueta | `Toggle Button Binary` |

### ¿Qué componente de feedback usar?

| Situación | Componente |
|---|---|
| Proceso indeterminado (inline) | `Spinner` |
| Proceso de larga duración | `Loader` |
| Progreso cuantificable | `ProgressBar` |
| Progreso en espacio reducido | `ProgressCircle` |
| Flujo con pasos discretos | `Stepper` |
| Contenido sin cargar | `Skeleton` |
| Mensaje temporal post-acción | `Notification` |
| Mensaje persistente en pantalla | `Alert` |
| Decisión bloqueante requerida | `Modal` |
| Sin contenido disponible | `EmptyState` |

### ¿Qué componente de lista usar?

| Situación | Componente |
|---|---|
| Pares clave-valor (solo lectura) | `DataList` |
| Lista con acciones por ítem | `ActionList` |
| Lista con destino de navegación | `NavigationList` |
| Lista con toggle on/off | `ToggleList` |
| Comparación de múltiples atributos | `Table` |

---

## 🌐 Estructura de pantalla

---

### Footer

**Descripción:** Componente de cierre de pantalla que comunica información persistente o enlaces relevantes que no pertenecen al flujo principal. Adapta su estructura entre desktop (columnas en paralelo) y mobile (lectura vertical compacta).

**Casos de uso:**
- Políticas de privacidad, términos y condiciones, información legal
- Enlaces a redes sociales, accesos de soporte, información sobre la compañía
- Interfaces que requieren cierre visual con identidad de marca o navegación secundaria
- Desktop: distribución en columnas para múltiples piezas en paralelo
- Mobile: reorganiza el contenido para lectura vertical compacta manteniendo jerarquías

**Propiedades:**
- `Shadow` → genera separación visual sin interacción
- `Outline` → separación visual alternativa — no combinar con `Shadow` simultáneamente
- `Expandable content` (mobile) → usa `navigation/expand_more` para mostrar/ocultar contenido si el diseño lo requiere
- Secciones activables/desactivables: contenido extendido, vínculos sociales, área de contacto — según el caso de uso

**Comportamiento:**
- Componente principalmente estático
- Los íconos de redes sociales pueden comportarse como enlaces externos con indicadores visuales de accesibilidad y foco por teclado
- No presenta estados Hover o Pressed más allá de los propios de los íconos-enlace

**✅ DO:**
- Usar para reforzar identidad, presentar enlaces relevantes o entregar información legal
- Adaptar según dispositivo: versiones mobile priorizan orden y compacidad
- Activar o desactivar secciones según el contexto para evitar información irrelevante

**❌ DON'T:**
- No incluir exceso de contenido — el footer es un cierre, no un contenedor principal de navegación
- No saturar con demasiados íconos sociales o bloques de texto
- No usar `Shadow` y `Outline` simultáneamente

---

*Documento generado a partir de `component-descriptions.md` y `ds-snapshot.md` — IT DS v1.50.0*
