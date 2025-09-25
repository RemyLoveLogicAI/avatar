#!/bin/bash

# Script de démarrage rapide pour Codespaces
# Utilisable après la création du container

set -e

echo "🚀 Démarrage Avatar IA - Codespaces"
echo "===================================="

PROJECT_ROOT="/workspaces/avatar-ia"
COMFYUI_DIR="$PROJECT_ROOT/ONLY/ComfyUI"

# Vérifier si ComfyUI est déjà en cours
if pgrep -f "python.*main.py" > /dev/null; then
    echo "✅ ComfyUI déjà en cours d'exécution"
else
    echo "🔄 Démarrage de ComfyUI..."
    cd $COMFYUI_DIR
    source .venv/bin/activate
    nohup python main.py --listen 0.0.0.0 --port 8188 > comfyui.log 2>&1 &
    echo $! > comfyui.pid
    echo "✅ ComfyUI démarré (PID: $(cat comfyui.pid))"
fi

# Attendre le démarrage
echo "⏳ Attente du démarrage..."
sleep 5

# Test de connectivité
if curl -s -f http://localhost:8188 > /dev/null; then
    echo "✅ ComfyUI accessible sur http://localhost:8188"
else
    echo "⚠️  ComfyUI en cours de démarrage..."
fi

echo ""
echo "🎯 Commandes utiles :"
echo "  • Générer avatars:     python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py"
echo "  • Arrêter ComfyUI:     kill \$(cat ONLY/ComfyUI/comfyui.pid)"
echo "  • Logs ComfyUI:        tail -f ONLY/ComfyUI/comfyui.log"
echo ""
echo "🌐 Accès web : http://localhost:8188"
echo "💰 Prêt pour génération d'avatars OnlyFans Premium!"
