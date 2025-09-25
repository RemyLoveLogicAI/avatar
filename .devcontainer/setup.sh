#!/bin/bash

# Avatar IA - Setup Script pour GitHub Codespaces
# Installation automatique de tous les composants nécessaires

set -e

echo "🚀 Avatar IA - Configuration Codespaces"
echo "========================================"
echo ""

# Variables
PROJECT_ROOT="/workspaces/avatar-ia"
COMFYUI_DIR="$PROJECT_ROOT/ONLY/ComfyUI"
MODELS_DIR="$PROJECT_ROOT/ONLY/models"
OUTPUTS_DIR="$PROJECT_ROOT/ONLY/outputs"

# Couleurs pour les logs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérification des prérequis
log_info "Vérification des prérequis..."
python3 --version
pip3 --version
node --version
npm --version

# Mise à jour du système
log_info "Mise à jour du système..."
sudo apt-get update -y
sudo apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    ffmpeg \
    imagemagick \
    libmagickwand-dev

# Installation de Python et dépendances
log_info "Configuration de l'environnement Python..."
cd $PROJECT_ROOT

# Création de l'environnement virtuel ComfyUI
if [ ! -d "$COMFYUI_DIR/.venv" ]; then
    log_info "Création de l'environnement virtuel ComfyUI..."
    cd $COMFYUI_DIR
    python3 -m venv .venv
    source .venv/bin/activate
    
    # Mise à jour de pip
    pip install --upgrade pip setuptools wheel
    
    # Installation des dépendances PyTorch pour Linux (CPU/CUDA)
    log_info "Installation de PyTorch..."
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
    
    # Installation des dépendances ComfyUI
    log_info "Installation des dépendances ComfyUI..."
    pip install -r requirements.txt
    
    # Installation des dépendances supplémentaires pour l'IA
    log_info "Installation des dépendances IA..."
    pip install \
        opencv-python-headless \
        diffusers \
        accelerate \
        xformers \
        transformers \
        safetensors \
        pillow \
        numpy \
        scipy \
        tqdm \
        psutil \
        aiohttp \
        pyyaml \
        requests \
        huggingface-hub
    
    log_success "Environnement Python configuré"
else
    log_info "Environnement Python déjà existant"
fi

# Configuration des répertoires
log_info "Configuration des répertoires..."
mkdir -p $MODELS_DIR/{checkpoints,ipadapter,vae,controlnet,animatediff}
mkdir -p $OUTPUTS_DIR/{images,video,audio,frames,pose}

# Téléchargement des modèles essentiels (si pas déjà présents)
log_info "Vérification des modèles IA..."
cd $MODELS_DIR

# SDXL Base Model (si absent)
if [ ! -f "checkpoints/sd_xl_base_1.0.safetensors" ]; then
    log_info "Téléchargement SDXL Base Model..."
    curl -L -o checkpoints/sd_xl_base_1.0.safetensors \
        "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    log_success "SDXL Base Model téléchargé"
else
    log_info "SDXL Base Model déjà présent"
fi

# SDXL Refiner (si absent)
if [ ! -f "checkpoints/sd_xl_refiner_1.0.safetensors" ]; then
    log_info "Téléchargement SDXL Refiner..."
    curl -L -o checkpoints/sd_xl_refiner_1.0.safetensors \
        "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
    log_success "SDXL Refiner téléchargé"
else
    log_info "SDXL Refiner déjà présent"
fi

# IP-Adapter FaceID (si absent)
if [ ! -f "ipadapter/ip-adapter-faceid_sdxl.bin" ]; then
    log_info "Téléchargement IP-Adapter FaceID..."
    curl -L -o ipadapter/ip-adapter-faceid_sdxl.bin \
        "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin"
    log_success "IP-Adapter FaceID téléchargé"
else
    log_info "IP-Adapter FaceID déjà présent"
fi

# VAE FaceID (si absent)
if [ ! -f "vae/vae-ft-mse-840000-ema-pruned.safetensors" ]; then
    log_info "Téléchargement VAE FaceID..."
    curl -L -o vae/vae-ft-mse-840000-ema-pruned.safetensors \
        "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    log_success "VAE FaceID téléchargé"
else
    log_info "VAE FaceID déjà présent"
fi

# Configuration des permissions
log_info "Configuration des permissions..."
sudo chown -R vscode:vscode $PROJECT_ROOT
chmod -R 755 $PROJECT_ROOT

# Installation des dépendances Node.js (si nécessaire)
log_info "Vérification des dépendances Node.js..."
cd $PROJECT_ROOT
if [ -f "package.json" ]; then
    npm install
    log_success "Dépendances Node.js installées"
fi

# Configuration des scripts d'automatisation
log_info "Configuration des scripts..."
chmod +x $PROJECT_ROOT/quick_start.sh
chmod +x $PROJECT_ROOT/ONLY/.specify/scripts/bash/*.sh

# Test de l'installation
log_info "Test de l'installation..."
cd $COMFYUI_DIR
source .venv/bin/activate

# Test Python
python3 -c "import torch; print(f'PyTorch version: {torch.__version__}')"
python3 -c "import cv2; print(f'OpenCV version: {cv2.__version__}')"

# Test ComfyUI (import des modules)
python3 -c "import comfy; print('ComfyUI modules OK')" || log_warning "ComfyUI modules non disponibles (normal au premier lancement)"

log_success "Installation terminée avec succès!"

# Affichage des informations de démarrage
echo ""
echo "🎉 CONFIGURATION CODESPACES TERMINÉE"
echo "===================================="
echo ""
echo "📋 Commandes utiles :"
echo "  • Démarrer ComfyUI:     cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188"
echo "  • Script rapide:        ./quick_start.sh"
echo "  • Test système:         bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only"
echo "  • Statut:               bash ONLY/.specify/scripts/bash/setup-plan.sh --status"
echo ""
echo "🌐 Accès web :"
echo "  • ComfyUI Interface:    http://localhost:8188"
echo "  • Ports forwardés:      8188 (ComfyUI), 3000 (Dev), 8000 (API)"
echo ""
echo "📁 Répertoires :"
echo "  • Modèles:              ONLY/models/"
echo "  • Outputs:              ONLY/outputs/"
echo "  • Scripts:              ONLY/.specify/scripts/"
echo ""
echo "💡 Pour générer des avatars OnlyFans :"
echo "  python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py"
echo ""

# Démarrage automatique de ComfyUI en arrière-plan
log_info "Démarrage de ComfyUI..."
cd $COMFYUI_DIR
source .venv/bin/activate
nohup python main.py --listen 0.0.0.0 --port 8188 > comfyui.log 2>&1 &
COMFYUI_PID=$!
echo $COMFYUI_PID > comfyui.pid

# Attendre que ComfyUI démarre
log_info "Attente du démarrage de ComfyUI..."
sleep 10

# Test de connectivité
if curl -s -f http://localhost:8188 > /dev/null; then
    log_success "ComfyUI démarré avec succès sur http://localhost:8188"
else
    log_warning "ComfyUI en cours de démarrage... (peut prendre quelques minutes)"
fi

echo ""
echo "✅ SETUP TERMINÉ - Prêt pour le développement!"
echo "🔥 Avatar IA - Plateforme OnlyFans Premium"
echo ""
