# 🚀 Avatar IA - GitHub Codespaces

## Vue d'ensemble

Configuration complète pour exécuter la **Plateforme d'Avatars IA OnlyFans** dans GitHub Codespaces. Le projet est automatiquement configuré avec tous les composants nécessaires.

## ⚡ Démarrage en 1 clic

1. **Créer un Codespace** : Cliquer sur le bouton "Code" → "Codespaces" → "Create codespace"
2. **Attendre l'installation** : ~5-10 minutes (téléchargement modèles IA)
3. **Accéder à l'interface** : http://localhost:8188 (ComfyUI)
4. **Générer des avatars** : `python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py`

## 🔧 Configuration automatique

### Composants installés
- ✅ **Python 3.11** avec environnement virtuel
- ✅ **PyTorch** (CPU optimisé pour Codespaces)
- ✅ **ComfyUI** avec toutes les dépendances
- ✅ **Modèles IA** : SDXL, IP-Adapter, VAE
- ✅ **Extensions VS Code** : Python, Jupyter, Copilot
- ✅ **Ports forwardés** : 8188 (ComfyUI), 3000 (Dev), 8000 (API)

### Répertoires montés
- `ONLY/models/` : Modèles IA (persistants)
- `ONLY/outputs/` : Images/vidéos générées (persistants)

## 📋 Commandes essentielles

### Démarrage rapide
```bash
# Après ouverture du Codespace
./codespace-start.sh
```

### Génération d'avatars OnlyFans
```bash
# Collection complète (5 styles × 3 images)
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py

# Styles disponibles :
# - casual_sexy : Tenue décontractée séductrice
# - lingerie_premium : Lingerie de luxe
# - sporty_fit : Tenue de sport attrayante  
# - elegant_sophisticated : Style élégant sophistiqué
# - intimate_bedroom : Ambiance intimiste chambre
```

### Gestion ComfyUI
```bash
# Démarrer ComfyUI manuellement
cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188

# Voir les logs
tail -f ONLY/ComfyUI/comfyui.log

# Arrêter ComfyUI
kill $(cat ONLY/ComfyUI/comfyui.pid)
```

### Scripts d'automatisation
```bash
# Test système complet
bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only

# Statut du système
bash ONLY/.specify/scripts/bash/setup-plan.sh --status

# Nettoyage
bash ONLY/.specify/scripts/bash/setup-plan.sh --cleanup
```

## 🌐 Accès web

| Service | URL | Description |
|---------|-----|-------------|
| **ComfyUI** | http://localhost:8188 | Interface principale de génération |
| **Dev Server** | http://localhost:3000 | Serveur de développement |
| **API Server** | http://localhost:8000 | API REST |

## 💰 Prompts OnlyFans Premium

### Styles de contenu
```yaml
casual_sexy:
  prompt: "beautiful woman, casual outfit, tight jeans, crop top, natural beauty, seductive smile, bedroom eyes, perfect body, high quality, professional photography, 8k resolution, sensual, alluring, attractive"
  
lingerie_premium:
  prompt: "beautiful woman, luxury lingerie, silk, lace, premium quality, seductive pose, perfect curves, bedroom setting, soft lighting, sensual, alluring, professional photography, 8k resolution, exclusive content"

sporty_fit:
  prompt: "beautiful woman, sportswear, yoga pants, sports bra, athletic body, fit physique, gym setting, confident pose, natural beauty, high quality, professional photography, 8k resolution, attractive, healthy"

elegant_sophisticated:
  prompt: "beautiful woman, elegant dress, sophisticated style, luxury fashion, confident pose, perfect makeup, studio lighting, professional photography, 8k resolution, sensual, classy, premium quality"

intimate_bedroom:
  prompt: "beautiful woman, intimate setting, bedroom, sensual pose, perfect body, seductive look, soft lighting, premium quality, professional photography, 8k resolution, alluring, exclusive"
```

### Prompts négatifs (sécurité)
```
"blurry, low quality, distorted, extra limbs, bad anatomy, watermark, text, deformed, ugly, underage, child, old, wrinkles"
```

## 📁 Structure du projet

```
avatar/
├── .devcontainer/           # Configuration Codespaces
│   ├── devcontainer.json    # Configuration container
│   ├── setup.sh            # Installation automatique
│   └── start.sh            # Démarrage rapide
├── ONLY/
│   ├── ComfyUI/            # Moteur IA principal
│   ├── models/             # Modèles IA (15GB+)
│   │   ├── checkpoints/    # SDXL Base & Refiner
│   │   ├── ipadapter/      # IP-Adapter FaceID
│   │   └── vae/            # VAE FaceID
│   ├── outputs/            # Contenu généré
│   │   ├── images/         # Photos avatars
│   │   ├── video/          # Vidéos avatars
│   │   └── audio/          # Audio + lipsync
│   └── .specify/           # Scripts & workflows
│       ├── memory/         # Documentation
│       └── scripts/        # Automatisation
└── codespace-start.sh      # Démarrage rapide
```

## 🔧 Dépannage

### ComfyUI ne démarre pas
```bash
# Vérifier les logs
tail -f ONLY/ComfyUI/comfyui.log

# Redémarrer
kill $(cat ONLY/ComfyUI/comfyui.pid) 2>/dev/null || true
./codespace-start.sh
```

### Modèles manquants
```bash
# Réinstaller les modèles
bash .devcontainer/setup.sh
```

### Ports non accessibles
- Vérifier que les ports sont forwardés dans l'onglet "Ports" de VS Code
- ComfyUI doit écouter sur `0.0.0.0:8188` (pas `127.0.0.1`)

## 💡 Optimisations Codespaces

### Performance
- **CPU** : Codespaces utilise des instances CPU optimisées
- **RAM** : 8-32GB selon le plan (suffisant pour SDXL)
- **Stockage** : Modèles montés en volumes persistants

### Coûts
- **Codespaces** : Facturation à l'usage (arrêt automatique)
- **Modèles** : Téléchargement une seule fois (cache HuggingFace)
- **Génération** : CPU local (pas de coûts cloud IA)

## 🎯 Objectifs commerciaux

### Livrables attendus
- ✅ **50+ photos premium** plein-pied cohérentes
- ✅ **3-4 tenues différentes** (casual, lingerie, sporty, intimiste)
- ✅ **Pipeline automatisé** pour production de masse
- ✅ **Monétisation** sur plateformes OnlyFans premium

### Critères de qualité
- **Résolution** : 1024x1024 (qualité commerciale)
- **Cohérence** : Avatar parfaitement reconnaissable
- **Diversité** : Variété des poses et tenues
- **Attrait** : Optimisé pour engagement utilisateur

## 📞 Support

### Ressources
- [Documentation ComfyUI](https://docs.comfy.org/)
- [Spécifications techniques](./ONLY/.specify/memory/specs.md)
- [Plan de développement](./ONLY/.specify/memory/plan.md)
- [Tâches détaillées](./ONLY/.specify/memory/tasks.md)

### Problèmes courants
1. **Codespace lent** : Redémarrer le container
2. **Modèles non détectés** : Vérifier les permissions
3. **Génération échoue** : Vérifier les logs ComfyUI
4. **Ports fermés** : Redémarrer ComfyUI avec `0.0.0.0`

---

**🔥 Avatar IA - Plateforme OnlyFans Premium**  
**💰 Génération automatisée d'avatars monétisables**
