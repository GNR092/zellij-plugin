# Plugin de Zellij para Oh My Zsh

Plugin de Oh My Zsh que integra **Zellij** (terminal multiplexer) con completaciones de Zsh.

## Requisitos

- [Zellij](https://zellij.dev/) instalado (`cargo install zellij` o tu gestor de paquetes)
- [Oh My Zsh](https://ohmyz.sh/) instalado

## Instalación

### Método 1: Clonar directamente en Oh My Zsh (Recomendado)

```bash
git clone git@github.com:GNR092/zellij-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zellij
```

### Método 2: Como submódulo git (para dotfiles)

```bash
cd ~/.oh-my-zsh
git submodule add git@github.com:GNR092/zellij-plugin.git custom/plugins/zellij
```

### Método 3: Manual

```bash
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zellij
# Copiar zellij.plugin.zsh y _zellij a ese directorio
```

## Configuración

Agrega `zellij` a tu array de plugins en `~/.zshrc`:

```zsh
plugins=(
  git
  zellij
  # ... otros plugins
)
```

Luego recarga la configuración:

```zsh
source ~/.zshrc
```

## Qué hace este plugin

1. **Verifica que Zellij esté instalado** - Muestra una advertencia si no lo está.
2. **Completa la CLI** - `_zellij` se basa en `zellij setup --generate-completion zsh` e incluye mejoras locales para aliases y nombres de sesiones activas.

## Completaciones disponibles

El archivo incluido se verificó contra el generador de **Zellij 0.44.3** y conserva mejoras locales. Al escribir `zellij <TAB>` aparecen estos subcomandos y aliases:

- `action` (`ac`), `attach` (`a`), `convert-config`, `convert-layout`, `convert-theme`.
- `delete-all-sessions` (`da`), `delete-session` (`d`), `edit` (`e`), `help`.
- `kill-all-sessions` (`ka`), `kill-session` (`k`), `list-aliases` (`la`), `list-sessions` (`ls`).
- `options`, `pipe`, `plugin` (`p`), `run` (`r`), `setup`, `subscribe`, `watch` (`w`), `web`.

`--version` es una opción, no un subcomando. `action` tiene sus propios subcomandos (por ejemplo, `new-pane`, `new-tab` y `switch-session`); consúltalos con `zellij action --help`. `setup` ofrece opciones, no subcomandos; entre ellas `--generate-completion <SHELL>`.

También completa:

- Nombres de sesiones activas para `attach`, `watch`, `kill-session`, `delete-session` y `action switch-session`.
- Flags de comandos y subcomandos.
- Rutas de archivos para opciones de layout; no enumera automáticamente los layouts predefinidos.

## Funciones auxiliares

El archivo `_zellij` también define estas funciones de shell:

- `zr`, `zrf`, `zri`: ejecutan un comando con `zellij run` en un panel normal, flotante o en el lugar.
- `ze`, `zef`, `zei`: abren archivos con `zellij edit` en un panel normal, flotante o en el lugar.
- `zpipe [plugin]`: ejecuta `zellij pipe`, opcionalmente indicando un plugin.

## Estructura

```
zellij/
├── zellij.plugin.zsh    # Comprueba que Zellij esté instalado
├── _zellij              # Completaciones de Zsh y mejoras locales
└── README.md            # Este archivo
```

## Solución de problemas

### Las completaciones no funcionan (Tab)

Si al presionar `Tab` no aparecen las completaciones de Zellij, regenera el caché:

```zsh
rm -f ~/.zcompdump*
exec zsh
```

### Actualizar las completaciones

La CLI actual genera la base con:

```bash
zellij setup --generate-completion zsh > /tmp/_zellij
```

Compara esa salida con `_zellij` e integra los cambios conservando las mejoras locales de aliases y sesiones dinámicas; reemplazar el archivo completo las eliminaría.

## Actualizar

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zellij
git pull
source ~/.zshrc
```

## Licencia

MIT - Basado en el generador oficial de Zellij, con completaciones locales de aliases y sesiones.
