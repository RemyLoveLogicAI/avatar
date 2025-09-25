#!/bin/bash

# Script de démarrage rapide pour GitHub Codespaces
# Avatar IA - Plateforme d'Avatars OnlyFans

set -e

echo "🚀 Avatar IA - Démarrage Codespace"
echo "==================================="
echo "💰 Plateforme d'Avatars OnlyFans Premium"
echo ""

# Vérifier si nous sommes dans un Codespace
if [ -n "$CODESPACES" ]; then
    echo "✅ Environnement Codespace détecté"
    PROJECT_ROOT="/workspaces/avatar-ia"
else
    echo "⚠️  Environnement local détecté"
    PROJECT_ROOT="$(pwd)"
fi

cd "$PROJECT_ROOT"

# Vérifier l'état de ComfyUI
COMFYUI_DIR="$PROJECT_ROOT/ONLY/ComfyUI"

if [ -f "$COMFYUI_DIR/comfyui.pid" ]; then
    PID=$(cat "$COMFYUI_DIR/comfyui.pid")
    if ps -p $PID > /dev/null 2>&1; then
        echo "✅ ComfyUI déjà en cours (PID: $PID)"
    else
        echo "🔄 Démarrage de ComfyUI..."
        cd "$COMFYUI_DIR"
        source .venv/bin/activate
        nohup python main.py --listen 0.0.0.0 --port 8188 > comfyui.log 2>&1 &
        echo $! > comfyui.pid
        echo "✅ ComfyUI démarré (PID: $(cat comfyui.pid))"
    fi
else
    echo "🔄 Premier démarrage de ComfyUI..."
    cd "$COMFYUI_DIR"
    source .venv/bin/activate
    nohup python main.py --listen 0.0.0.0 --port 8188 > comfyui.log 2>&1 &
    echo $! > comfyui.pid
    echo "✅ ComfyUI démarré (PID: $(cat comfyui.pid))"
fi

# Attendre le démarrage
echo "⏳ Attente du démarrage de ComfyUI..."
sleep 8

# Test de connectivité
echo "🔍 Test de connectivité..."
if curl -s -f http://localhost:8188 > /dev/null; then
    echo "✅ ComfyUI accessible sur http://localhost:8188"
    echo ""
    echo "🎯 PRÊT POUR GÉNÉRATION D'AVATARS!"
    echo ""
    echo "📋 Commandes utiles :"
    echo "  • Générer avatars OnlyFans:"
    echo "    python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py"
    echo ""
    echo "  • Démarrer manuellement ComfyUI:"
    echo "    cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188"
    echo ""
    echo "  • Voir les logs:"
    echo "    tail -f ONLY/ComfyUI/comfyui.log"
    echo ""
    echo "  • Arrêter ComfyUI:"
    echo "    kill \$(cat ONLY/ComfyUI/comfyui.pid)"
    echo ""
    echo "🌐 Interface web: http://localhost:8188"
    echo "💰 Optimisé pour monétisation OnlyFans Premium!"
else
    echo "⚠️  ComfyUI en cours de démarrage..."
    echo "💡 Attendez quelques minutes puis vérifiez: http://localhost:8188"
fi

echo ""
echo "🔥 Avatar IA - Plateforme OnlyFans Premium"
echo "🎨 Génération d'avatars automatisée"
