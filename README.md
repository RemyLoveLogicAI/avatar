# 🔥 Avatar IA - Plateforme d'Avatars OnlyFans Premium

[![GitHub Codespaces](https://img.shields.io/badge/GitHub%20Codespaces-Ready-blue?logo=github&logoColor=white)](https://github.com/codespaces)
[![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python&logoColor=white)](https://python.org)
[![ComfyUI](https://img.shields.io/badge/ComfyUI-SDXL-green?logo=stable-diffusion&logoColor=white)](https://comfy.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Plateforme d'avatars IA automatisés pour le marché du contenu adulte premium**

Développement d'une **plateforme d'avatars IA automatisés** pour le marché du contenu adulte premium. Création d'un pipeline 100% local pour génération de contenu cohérent et personnalisé, optimisé pour monétisation sur plateformes comme OnlyFans.

## 🚀 Démarrage en 1 clic avec GitHub Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?repo=Soynido/avatar)

### ⚡ Installation automatique
1. **Cliquer sur "Open in GitHub Codespaces"** ci-dessus
2. **Attendre l'installation** (~5-10 minutes)
3. **Accéder à ComfyUI** : http://localhost:8188
4. **Générer des avatars** : `./codespace-start.sh`

## 💰 Objectifs Commerciaux

- **50+ photos premium** plein-pied cohérentes (4+ tenues variées)
- **2-3 clips vidéo** corps entier courts (5-10s) pour engagement
- **1 séquence vocale** + lipsync (head-talk) pour personnalisation
- **Pipeline automatisé** pour production de masse
- **Monétisation** sur plateformes de contenu adulte premium

## 🎯 Styles d'Avatars OnlyFans

| Style | Description | Prompt Optimisé |
|-------|-------------|-----------------|
| **Casual Sexy** | Tenue décontractée séductrice | `casual outfit, tight jeans, crop top, natural beauty, seductive smile` |
| **Lingerie Premium** | Lingerie de luxe | `luxury lingerie, silk, lace, premium quality, seductive pose` |
| **Sporty Fit** | Tenue de sport attrayante | `sportswear, yoga pants, athletic body, confident pose` |
| **Elegant Sophisticated** | Style élégant sophistiqué | `elegant dress, sophisticated style, luxury fashion, confident pose` |
| **Intimate Bedroom** | Ambiance intimiste chambre | `intimate setting, bedroom, sensual pose, perfect body` |

## 🛠️ Stack Technique

### Core IA
- **ComfyUI** : Moteur central avec support MPS
- **Stable Diffusion XL (SDXL)** : Modèle principal haute qualité
- **IP-Adapter FaceID** : Cohérence visuelle parfaite
- **VAE FaceID** : Encodage/décodage optimisé

### Infrastructure
- **Python 3.11+** : Environnement principal
- **PyTorch** : Framework IA (CPU/CUDA/MPS)
- **GitHub Codespaces** : Environnement cloud
- **Docker** : Containerisation (optionnel)

## 📁 Structure du Projet

```
avatar/
├── .devcontainer/              # Configuration Codespaces
│   ├── devcontainer.json       # Container config
│   ├── setup.sh               # Installation auto
│   └── start.sh               # Démarrage rapide
├── ONLY/
│   ├── ComfyUI/               # Moteur IA principal
│   ├── models/                # Modèles IA (15GB+)
│   │   ├── checkpoints/       # SDXL Base & Refiner
│   │   ├── ipadapter/         # IP-Adapter FaceID
│   │   └── vae/               # VAE FaceID
│   ├── outputs/               # Contenu généré
│   │   ├── images/            # Photos avatars
│   │   ├── video/             # Vidéos avatars
│   │   └── audio/             # Audio + lipsync
│   └── .specify/              # Scripts & workflows
│       ├── memory/            # Documentation
│       └── scripts/           # Automatisation
└── CODESPACES.md              # Guide Codespaces
```

## 🎨 Génération d'Avatars

### Collection complète OnlyFans
```bash
# Générer 5 styles × 3 images = 15 avatars premium
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py
```

### Styles individuels
```bash
# Casual sexy (3 images)
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py --style casual_sexy --count 3

# Lingerie premium (3 images)  
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py --style lingerie_premium --count 3
```

### Interface web ComfyUI
```bash
# Démarrer ComfyUI
cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188

# Accéder à l'interface
# http://localhost:8188
```

## 🔧 Installation Locale (Mac M3)

### Prérequis
- Mac M3 (18GB RAM unifiée)
- macOS 14.0+ (Sonoma ou plus récent)
- 100GB+ stockage libre
- Python 3.10+

### Démarrage rapide
```bash
# Cloner le projet
git clone https://github.com/Soynido/avatar.git
cd avatar

# Installation automatique complète
./quick_start.sh

# Ou installation manuelle
bash ONLY/.specify/scripts/bash/setup-plan.sh
```

## 📊 Spécifications Techniques

### Performance Mac M3
- **Résolution** : 1024x1024 (qualité commerciale)
- **Temps génération** : ~30-60s par image
- **Mémoire** : 8-12GB RAM utilisée
- **GPU** : MPS (Metal Performance Shaders)

### Performance Codespaces
- **CPU** : Instances optimisées cloud
- **RAM** : 8-32GB selon plan
- **Stockage** : Volumes persistants pour modèles
- **Coûts** : Facturation à l'usage

## 🎯 Critères de Qualité

### Cohérence Visuelle
- ✅ Avatar parfaitement reconnaissable entre images
- ✅ Même visage, même corps, même style
- ✅ Variations uniquement dans tenues/poses

### Qualité Commerciale
- ✅ Résolution 1024x1024 maintenue
- ✅ Détails du visage cohérents et attrayants
- ✅ Qualité photographique professionnelle
- ✅ Pas d'artefacts visuels majeurs

### Monétisation OnlyFans
- ✅ Attrait visuel adapté au marché premium
- ✅ Diversité des poses et tenues
- ✅ Engagement utilisateur maximal
- ✅ Contenu à forte valeur ajoutée

## 📚 Documentation

- **[Guide Codespaces](CODESPACES.md)** - Configuration complète cloud
- **[Spécifications Techniques](ONLY/.specify/memory/specs.md)** - Détails techniques
- **[Plan de Développement](ONLY/.specify/memory/plan.md)** - Roadmap détaillée
- **[Tâches](ONLY/.specify/memory/tasks.md)** - Liste des tâches
- **[Constitution](ONLY/.specify/memory/constitution.md)** - Principes du projet

## 🤝 Contribution

Ce projet suit les principes établis dans la constitution :
- ✅ Respect de la localité absolue
- ✅ Conformité légale stricte
- ✅ Pragmatisme technique
- ✅ Documentation obligatoire

### Workflow de développement
1. Fork du repository
2. Créer une branche feature
3. Implémenter les modifications
4. Tests et validation
5. Pull Request vers main

## ⚖️ Conformité Légale

- ✅ **Avatar 100% IA** : Aucune personne réelle
- ✅ **Contenu adulte** : Respect des plateformes
- ✅ **Monétisation légale** : Conformité OnlyFans
- ✅ **Propriété intellectuelle** : Modèles open source

## 📞 Support

### Ressources
- [Issues GitHub](https://github.com/Soynido/avatar/issues)
- [Discussions](https://github.com/Soynido/avatar/discussions)
- [Documentation ComfyUI](https://docs.comfy.org/)

### Problèmes courants
1. **Codespace lent** : Redémarrer le container
2. **Modèles non détectés** : Vérifier les permissions
3. **Génération échoue** : Vérifier les logs ComfyUI
4. **Ports fermés** : Redémarrer ComfyUI avec `0.0.0.0`

## 📈 Roadmap

### Phase 1 ✅ - Photos Premium
- [x] Configuration ComfyUI + SDXL
- [x] Pipeline génération photos
- [x] 50+ photos avec 4+ tenues

### Phase 2 🚧 - Vidéos Interactives  
- [ ] Intégration AnimateDiff
- [ ] Génération clips 5-10s
- [ ] Post-traitement FFmpeg

### Phase 3 📋 - Audio et Lipsync
- [ ] Configuration TTS local
- [ ] Intégration SadTalker
- [ ] Pipeline lipsync complet

## 📄 Licence

[MIT License](LICENSE) - Voir le fichier LICENSE pour plus de détails.

---

**🔥 Avatar IA - Plateforme OnlyFans Premium**  
**💰 Génération automatisée d'avatars monétisables**

[![GitHub stars](https://img.shields.io/github/stars/Soynido/avatar?style=social)](https://github.com/Soynido/avatar/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Soynido/avatar?style=social)](https://github.com/Soynido/avatar/network/members)
[![GitHub issues](https://img.shields.io/github/issues/Soynido/avatar)](https://github.com/Soynido/avatar/issues)