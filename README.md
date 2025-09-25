# Avatar IA - Plateforme d'Avatars Automatisés

## Vue d'ensemble

Développement d'une **plateforme d'avatars IA automatisés** pour le marché du contenu adulte premium. Création d'un pipeline 100% local pour génération de contenu cohérent et personnalisé, optimisé pour monétisation sur plateformes comme OnlyFans. Développement d'un MVP commercial en 2-3 semaines avec un budget de 0€ (exécution 100% locale).

## Objectifs Commerciaux

- **50+ photos premium** plein-pied cohérentes (4+ tenues variées)
- **2-3 clips vidéo** corps entier courts (5-10s) pour engagement
- **1 séquence vocale** + lipsync (head-talk) pour personnalisation
- **Pipeline automatisé** pour production de masse
- **Monétisation** sur plateformes de contenu adulte premium

## Contraintes

- ✅ **Full local** : Aucun service cloud payant
- ✅ **Conformité légale** : Avatar 100% IA, aucune personne réelle
- ✅ **Budget 0€** : GPU personnel uniquement (M3 - Macbookpro)
- ✅ **Équipe réduite** : 2 personnes maximum
- ✅ **Délai serré** : 2-3 semaines pour MVP

## Stack Technique (Mac M3 Optimisé)

- **ComfyUI** : Moteur central avec support MPS
- **Stable Diffusion 1.5** : Modèle principal (plus léger)
- **SDXL** : Optionnel pour photos haute qualité (fp16, batch=1)
- **IP-Adapter** : Cohérence visuelle (remplace LoRA local)
- **AnimateDiff** : Génération vidéo (SD1.5, 5s max)
- **ControlNet** : Poses et contrôle
- **SadTalker** : Lipsync
- **Piper/Coqui-TTS** : Synthèse vocale (CPU)
- **FFmpeg** : Post-traitement

## Structure du Projet

```
.specify/
├── memory/
│   └── constitution.md      # Principes fondamentaux
└── templates/
    ├── plan-template.md     # Template de planification
    ├── spec-template.md     # Template de spécifications
    └── tasks-template.md    # Template de tâches
```

## Constitution

Le projet est gouverné par une [constitution](./.specify/memory/constitution.md) qui établit :
- 6 principes fondamentaux
- Contraintes techniques et légales
- Priorités de développement
- Processus de gouvernance

## Phases de Développement

### Phase 1 (Semaine 1) : Photos Cohérentes
- Configuration ComfyUI + MPS (Metal Performance Shaders)
- Configuration IP-Adapter pour cohérence
- Pipeline génération photos (SD1.5 + SDXL optionnel)
- 50+ photos avec 3-4 tenues

### Phase 2 (Semaine 2) : Vidéos Courtes
- Intégration AnimateDiff (SD1.5, 5s max)
- ControlNet pour poses
- Génération 2-3 clips (5s chacun)
- Post-traitement FFmpeg

### Phase 3 (Semaine 3) : Audio et Lipsync
- Configuration TTS local (CPU)
- Intégration SadTalker
- Pipeline lipsync complet
- Documentation finale M3

## Installation

> **Note** : Guide d'installation détaillé à venir dans la Phase 1

### Prérequis (Mac M3)
- Mac M3 (18GB RAM unifiée)
- macOS 14.0+ (Sonoma ou plus récent)
- 100GB+ stockage libre
- Python 3.10+ avec Conda

### Démarrage Rapide (Mac M3)

#### Option 1 : Démarrage automatique complet
```bash
# Cloner le projet
git clone [URL_REPO]
cd avatar-ia

# Démarrage automatique complet
./quick_start.sh
```

#### Option 2 : Démarrage manuel étape par étape
```bash
# Cloner le projet
git clone [URL_REPO]
cd avatar-ia

# Installation Miniconda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash Miniconda3-latest-MacOSX-arm64.sh

# Environnement dédié
conda create -n avatar-ia python=3.10
conda activate avatar-ia

# Installation PyTorch avec MPS
pip install torch torchvision torchaudio

# Configuration complète
bash ONLY/.specify/scripts/bash/setup-plan.sh

# Démarrage ComfyUI
bash ONLY/.specify/scripts/bash/setup-plan.sh --start

# Test du système
bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only

# Nettoyage
bash ONLY/.specify/scripts/bash/setup-plan.sh --cleanup

# Statut
bash ONLY/.specify/scripts/bash/setup-plan.sh --status
```

## Utilisation

### Génération de Photos (M3)
```bash
python generate_photos.py --count 50 --outfits 4 --device mps --batch-size 1
```

### Génération de Vidéos (M3)
```bash
python generate_videos.py --count 3 --duration 5 --device mps
```

### Synthèse Audio + Lipsync (M3)
```bash
python generate_audio.py --text "Hello world" --output audio.wav --device cpu
python lipsync.py --audio audio.wav --video face.mp4 --device mps
```

## Documentation

- [Constitution](./.specify/memory/constitution.md) - Principes et gouvernance
- [Plan de Développement M3](./.specify/memory/plan-m3.md) - Roadmap détaillée Mac M3
- [Spécifications M3](./.specify/memory/specs-m3.md) - Exigences techniques Mac M3
- [Tâches M3](./.specify/memory/tasks-m3.md) - Liste des tâches optimisées M3

## Contribution

Ce projet suit les principes établis dans la constitution :
- Respect de la localité absolue
- Conformité légale stricte
- Pragmatisme technique
- Documentation obligatoire

## Licence

[À définir selon les contraintes légales du projet]

## Support

Pour toute question ou problème :
1. Consulter la documentation
2. Vérifier les issues existantes
3. Créer une nouvelle issue avec les détails

---

**Version :** 1.0.0  
**Dernière mise à jour :** 2024-12-19
