# Zellij Plugin for Oh My Zsh

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

1. **Verifica que Zellij esté instalado** - Muestra advertencia si no lo está
2. **Carga completaciones automáticas** - Desde `_zellij` para comandos, flags y layouts de Zellij

## Completaciones disponibles

Al escribir `zellij <TAB>` obtienes:
- Comandos: `action`, `attach`, `delete-session`, `edit`, `kill-all-sessions`, `kill-session`, `list-sessions`, `options`, `pipe`, `run`, `setup`, `start`, `version`
- Flags globales y por comando
- Nombres de sesiones existentes
- Layouts disponibles

## Estructura

```
zellij/
├── zellij.plugin.zsh    # Plugin principal (carga completions)
├── _zellij              # Completaciones completas de Zsh
└── README.md            # Este archivo
```

## Solución de problemas

### Las completaciones no funcionan (Tab)

Si al presionar `Tab` no aparecen las completaciones de Zellij, regenera el caché:

```zsh
rm -f ~/.zcompdump*
exec zsh
```

## Actualizar

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zellij
git pull
source ~/.zshrc
```

## Licencia

MIT - Basado en completaciones oficiales de Zellij