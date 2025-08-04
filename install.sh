#!/bin/bash

# Ultimate .gitignore Global Installer
# Author: @alafourcadev
# Version: 1.0.0

set -e

# Colores para output bonito
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════╗"
echo "║     Ultimate .gitignore Global Installer   ║"
echo "║              by @alafourcadev              ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

# URL del archivo
GITIGNORE_URL="https://raw.githubusercontent.com/alafourcadev/ultimate-gitignore/main/.gitignore_global"

# Función para detectar OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "🐧 Sistema detectado: Linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "🍎 Sistema detectado: macOS"
    elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
        echo "🪟 Sistema detectado: Windows"
    fi
}

# Mostrar sistema
detect_os
echo ""

# Verificar si ya existe
if [ -f ~/.gitignore_global ]; then
    echo -e "${YELLOW}⚠️  Ya tienes un .gitignore_global${NC}"
    read -p "¿Quieres hacer backup y continuar? (s/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        backup_file=~/.gitignore_global.backup.$(date +%Y%m%d_%H%M%S)
        cp ~/.gitignore_global "$backup_file"
        echo -e "${GREEN}✅ Backup creado: $backup_file${NC}"
    else
        echo -e "${RED}❌ Instalación cancelada${NC}"
        exit 1
    fi
fi

# Descargar
echo -e "${YELLOW}📥 Descargando ultimate .gitignore...${NC}"
if command -v curl &> /dev/null; then
    curl -fsSL "$GITIGNORE_URL" -o ~/.gitignore_global
elif command -v wget &> /dev/null; then
    wget -q "$GITIGNORE_URL" -O ~/.gitignore_global
else
    echo -e "${RED}❌ Error: Necesitas curl o wget instalado${NC}"
    exit 1
fi

# Configurar Git
echo -e "${YELLOW}⚙️  Configurando Git...${NC}"
git config --global core.excludesfile ~/.gitignore_global

# Verificar
if git config --get core.excludesfile &> /dev/null; then
    echo -e "${GREEN}✅ ¡Instalación exitosa!${NC}"
    echo ""
    echo -e "${BLUE}📊 Estadísticas:${NC}"
    echo "  • Patrones instalados: $(grep -v '^#' ~/.gitignore_global | grep -v '^$' | wc -l | tr -d ' ')"
    echo "  • Categorías: $(grep -c '^###' ~/.gitignore_global)"
    echo "  • Tamaño: $(ls -lh ~/.gitignore_global | awk '{print $5}')"
    echo ""
    echo -e "${GREEN}🎉 ¡Listo! Ya no subirás más archivos basura a tus repos${NC}"
    echo ""
    echo "💡 Próximos pasos:"
    echo "  • Revisa el archivo: cat ~/.gitignore_global | less"
    echo "  • Comparte con tu equipo: https://github.com/alafourcadev/ultimate-gitignore"
    echo "  • Dale una ⭐ si te gustó"
else
    echo -e "${RED}❌ Algo salió mal. Intenta la instalación manual${NC}"
    exit 1
fi