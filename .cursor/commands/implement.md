# Plan d'Exécution - Avatar IA Mac M3

## Vue d'ensemble

Ce document fournit un plan d'exécution pas-à-pas pour mettre en place et exécuter le projet Avatar IA sur Mac M3. Toutes les commandes sont prêtes à être copiées/collées dans le terminal.

## Prérequis

- Mac M3 avec 18GB RAM
- macOS 14.0+ (Sonoma ou plus récent)
- Connexion Internet stable
- 100GB+ d'espace disque libre

## Phase 1 : Vérification et Installation des Prérequis

### 1.1 Vérifier les prérequis

```bash
# Rendre le script exécutable
chmod +x .specify/scripts/bash/check-prerequisites.sh

# Vérifier les prérequis
bash .specify/scripts/bash/check-prerequisites.sh
```

### 1.2 Installer les prérequis manquants

```bash
# Installer automatiquement les prérequis manquants
bash .specify/scripts/bash/check-prerequisites.sh --install
```

### 1.3 Tester le support MPS

```bash
# Tester PyTorch MPS (après installation)
bash .specify/scripts/bash/check-prerequisites.sh --check-mps
```

## Phase 2 : Configuration de l'Environnement

### 2.1 Configuration complète du projet

```bash
# Rendre le script exécutable
chmod +x ONLY/.specify/scripts/bash/setup-plan.sh

# Configuration complète
bash ONLY/.specify/scripts/bash/setup-plan.sh
```

### 2.2 Configuration sans ComfyUI (optionnel)

```bash
# Si ComfyUI est déjà installé
bash ONLY/.specify/scripts/bash/setup-plan.sh --skip-comfyui
```

### 2.3 Configuration sans modèles (optionnel)

```bash
# Si vous voulez configurer les modèles manuellement
bash ONLY/.specify/scripts/bash/setup-plan.sh --skip-models
```

### 2.4 Test du système uniquement

```bash
# Pour tester le système sans réinstallation
bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only
```

### 2.5 Nettoyage du système

```bash
# Pour nettoyer les fichiers temporaires
bash ONLY/.specify/scripts/bash/setup-plan.sh --cleanup
```

### 2.6 Statut du système

```bash
# Pour afficher le statut du système
bash ONLY/.specify/scripts/bash/setup-plan.sh --status
```

## Phase 3 : Téléchargement des Modèles

### 3.1 Modèles SDXL (Photos)

```bash
# Créer le répertoire des modèles
mkdir -p models/checkpoints models/vae

# Télécharger SDXL Base (optionnel - grand fichier)
# wget -O models/checkpoints/sd_xl_base_1.0.safetensors "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"

# Télécharger SDXL VAE
wget -O models/vae/sdxl_vae.safetensors "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
```

### 3.2 Modèles SD1.5 (Vidéos)

```bash
# Télécharger SD1.5 Base
wget -O models/checkpoints/v1-5-pruned-emaonly.safetensors "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors"

# Télécharger SD1.5 VAE
wget -O models/vae/vae-ft-mse-840000-ema-pruned.safetensors "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
```

### 3.3 Modèles ControlNet

```bash
# Créer le répertoire ControlNet
mkdir -p models/controlnet

# Télécharger OpenPose
wget -O models/controlnet/control_v11p_sd15_openpose.pth "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_v11p_sd15_openpose.pth"

# Télécharger Depth
wget -O models/controlnet/control_v11f1p_sd15_depth.pth "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_v11f1p_sd15_depth.pth"

# Télécharger SoftEdge
wget -O models/controlnet/control_v11p_sd15_softedge.pth "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_v11p_sd15_softedge.pth"
```

### 3.4 Modèles IP-Adapter

```bash
# Créer le répertoire IP-Adapter
mkdir -p models/ipadapter

# Télécharger IP-Adapter FaceID
wget -O models/ipadapter/ip-adapter-faceid_sd15.bin "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-faceid_sd15.bin"

# Télécharger IP-Adapter FaceID Plus
wget -O models/ipadapter/ip-adapter-faceid-plus_sd15.bin "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-faceid-plus_sd15.bin"
```

### 3.5 Modèles AnimateDiff

```bash
# Créer le répertoire AnimateDiff
mkdir -p models/animatediff

# Télécharger Motion Module
wget -O models/animatediff/mm_sd_v15_v2.0.safetensors "https://huggingface.co/guoyww/animatediff-motion-adapter-v1-5-2/resolve/main/mm_sd_v15_v2.0.safetensors"
```

## Phase 4 : Lancement de ComfyUI

### 4.1 Démarrer ComfyUI

```bash
# Méthode simple avec script intégré
bash ONLY/.specify/scripts/bash/setup-plan.sh --start

# Ou méthode manuelle
cd ONLY/ComfyUI
source .venv/bin/activate
python main.py --listen 127.0.0.1 --port 8188 --force-fp16 --lowvram --cpu-vae
```

### 4.2 Vérifier ComfyUI

```bash
# Dans un autre terminal, vérifier que ComfyUI fonctionne
curl http://127.0.0.1:8188/system_stats
```

### 4.3 Accéder à l'interface

Ouvrir le navigateur et aller à : http://127.0.0.1:8188

## Phase 5 : Tests de Base

### 5.1 Test de génération d'image simple

```bash
# Créer un script de test
cat > test_generation.py << 'EOF'
import torch
import requests
import json

# Test MPS
print("MPS available:", torch.backends.mps.is_available())

# Test ComfyUI API
try:
    response = requests.get("http://127.0.0.1:8188/system_stats")
    print("ComfyUI status:", response.status_code)
except:
    print("ComfyUI not accessible")
EOF

# Exécuter le test dans l'environnement ComfyUI
cd ONLY/ComfyUI
source .venv/bin/activate
python ../../test_generation.py
cd ../..
```

### 5.2 Test FFmpeg

```bash
# Tester FFmpeg
ffmpeg -version

# Créer un test vidéo simple
ffmpeg -f lavfi -i testsrc=duration=1:size=320x240:rate=1 -pix_fmt yuv420p test_video.mp4

# Vérifier le fichier
ls -la test_video.mp4
```

### 5.3 Test Piper TTS

```bash
# Installer Piper TTS
pip install piper-tts

# Tester Piper (si disponible)
# piper --model en_US-lessac-medium.onnx --output test_audio.wav "Hello, this is a test"
```

## Phase 6 : Commandes FFmpeg Utiles

### 6.1 Extraction de frames

```bash
# Extraire frames d'une vidéo de référence
ffmpeg -i ONLY/assets/refs/dance_reference.mp4 -vf fps=12 -q:v 2 ONLY/assets/refs/frames/frame_%04d.jpg
```

### 6.2 Assemblage de vidéo

```bash
# Assembler frames en vidéo
ffmpeg -framerate 12 -i ONLY/outputs/frames/frame_%04d.jpg -c:v libx264 -pix_fmt yuv420p ONLY/outputs/video/generated.mp4
```

### 6.3 Ajout d'audio

```bash
# Ajouter audio à une vidéo
ffmpeg -i ONLY/outputs/video/generated.mp4 -i ONLY/outputs/audio/voice.wav -c:v copy -c:a aac -shortest ONLY/outputs/video/final_with_audio.mp4
```

## Phase 7 : Développement

### 7.1 Structure du projet

```bash
# Voir la structure complète
tree -L 3

# Voir les modèles installés
ls -la ONLY/models/*/
```

### 7.2 Workflows ComfyUI

```bash
# Créer le répertoire des workflows
mkdir -p workflows

# Les workflows seront sauvegardés ici
# - workflows/photo_generation.json
# - workflows/video_generation.json
# - workflows/lipsync.json
```

### 7.3 Scripts Python

```bash
# Créer le répertoire des scripts
mkdir -p scripts

# Les scripts de génération seront créés ici
# - scripts/generate_photos.py
# - scripts/generate_videos.py
# - scripts/generate_audio.py
```

## Phase 8 : Monitoring et Debug

### 8.1 Vérifier l'utilisation mémoire

```bash
# Vérifier l'utilisation mémoire
top -l 1 | grep "PhysMem"

# Vérifier l'utilisation GPU (si disponible)
system_profiler SPDisplaysDataType
```

### 8.2 Logs ComfyUI

```bash
# Voir les logs ComfyUI
tail -f ComfyUI/logs/comfyui.log
```

### 8.3 Test de performance

```bash
# Script de test de performance
cat > test_performance.py << 'EOF'
import time
import torch

# Test MPS performance
if torch.backends.mps.is_available():
    device = torch.device("mps")
    x = torch.randn(1000, 1000, device=device)
    start = time.time()
    y = torch.mm(x, x)
    end = time.time()
    print(f"MPS matrix multiplication time: {end - start:.4f}s")
else:
    print("MPS not available")
EOF

python test_performance.py
```

## Dépannage

### Problèmes courants

1. **MPS non disponible** : Vérifier que PyTorch est installé avec support MPS
2. **Mémoire insuffisante** : Réduire la taille des batchs (1-2)
3. **ComfyUI ne démarre pas** : Vérifier les dépendances Python
4. **Modèles manquants** : Vérifier les chemins dans ComfyUI

### Commandes de diagnostic

```bash
# Vérifier Python et PyTorch
python3 -c "import torch; print(torch.__version__); print(torch.backends.mps.is_available())"

# Vérifier les modèles
find ONLY/models -name "*.safetensors" -o -name "*.pth" -o -name "*.bin"

# Vérifier ComfyUI
cd ONLY/ComfyUI && python main.py --help
```

## Prochaines Étapes

1. **Phase 1** : Configurer IP-Adapter pour cohérence avatar
2. **Phase 2** : Développer pipeline de génération de photos (SDXL)
3. **Phase 3** : Intégrer AnimateDiff pour vidéos (SD1.5)
4. **Phase 4** : Ajouter TTS et lipsync

Voir `.specify/memory/tasks.md` pour les tâches détaillées.
