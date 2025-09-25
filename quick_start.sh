#!/usr/bin/env bash

# Script de démarrage rapide Avatar IA Mac M3
# Utilise les scripts originaux intégrés

set -e

echo "🚀 Avatar IA Mac M3 - Démarrage Rapide"
echo "======================================"
echo ""

# Vérifier les prérequis
echo "1. Vérification des prérequis..."
bash ONLY/.specify/scripts/bash/check-prerequisites.sh --install

echo ""
echo "2. Configuration du système..."
bash ONLY/.specify/scripts/bash/setup-plan.sh

echo ""
echo "3. Test du système..."
bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only

echo ""
echo "✅ Configuration terminée !"
echo ""
echo "Pour démarrer ComfyUI :"
echo "  bash ONLY/.specify/scripts/bash/setup-plan.sh --start"
echo ""
echo "Pour voir le statut :"
echo "  bash ONLY/.specify/scripts/bash/setup-plan.sh --status"
echo ""
echo "Pour nettoyer :"
echo "  bash ONLY/.specify/scripts/bash/setup-plan.sh --cleanup"
