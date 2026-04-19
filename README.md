# 🔥 AI Avatar - Premium OnlyFans Avatar Platform

[![GitHub Codespaces](https://img.shields.io/badge/GitHub%20Codespaces-Ready-blue?logo=github&logoColor=white)](https://github.com/codespaces)
[![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python&logoColor=white)](https://python.org)
[![ComfyUI](https://img.shields.io/badge/ComfyUI-SDXL-green?logo=stable-diffusion&logoColor=white)](https://comfy.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Automated AI avatar platform for the premium adult content market**

Development of an **automated AI avatar platform** for the premium adult content market. Building a 100% local pipeline for generating consistent and personalized content, optimized for monetization on platforms like OnlyFans.

## 🚀 1-Click Start with GitHub Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?repo=Soynido/avatar)

### ⚡ Automatic Installation
1. **Click "Open in GitHub Codespaces"** above
2. **Wait for installation** (~5-10 minutes)
3. **Access ComfyUI** : http://localhost:8188
4. **Generate avatars** : `./codespace-start.sh`

## 💰 Commercial Goals

- **50+ premium photos** full-body consistent (4+ varied outfits)
- **2-3 short video clips** full-body (5-10s) for engagement
- **1 voice sequence** + lipsync (head-talk) for personalization
- **Automated pipeline** for mass production
- **Monetization** on premium adult content platforms

## 🎯 OnlyFans Avatar Styles

| Style | Description | Optimized Prompt |
|-------|-------------|-----------------|
| **Casual Sexy** | Casual seductive outfit | `casual outfit, tight jeans, crop top, natural beauty, seductive smile` |
| **Lingerie Premium** | Luxury lingerie | `luxury lingerie, silk, lace, premium quality, seductive pose` |
| **Sporty Fit** | Attractive sportswear | `sportswear, yoga pants, athletic body, confident pose` |
| **Elegant Sophisticated** | Elegant sophisticated style | `elegant dress, sophisticated style, luxury fashion, confident pose` |
| **Intimate Bedroom** | Intimate bedroom ambiance | `intimate setting, bedroom, sensual pose, perfect body` |

## 🛠️ Technical Stack

### AI Core
- **ComfyUI** : Central engine with MPS support
- **Stable Diffusion XL (SDXL)** : Main high-quality model
- **IP-Adapter FaceID** : Perfect visual consistency
- **VAE FaceID** : Optimized encoding/decoding

### Infrastructure
- **Python 3.11+** : Main environment
- **PyTorch** : AI framework (CPU/CUDA/MPS)
- **GitHub Codespaces** : Cloud environment
- **Docker** : Containerization (optional)

## 📁 Project Structure

```
avatar/
├── .devcontainer/              # Codespaces configuration
│   ├── devcontainer.json       # Container config
│   ├── setup.sh               # Auto installation
│   └── start.sh               # Quick start
├── ONLY/
│   ├── ComfyUI/               # Main AI engine
│   ├── models/                # AI models (15GB+)
│   │   ├── checkpoints/       # SDXL Base & Refiner
│   │   ├── ipadapter/         # IP-Adapter FaceID
│   │   └── vae/               # VAE FaceID
│   ├── outputs/               # Generated content
│   │   ├── images/            # Avatar photos
│   │   ├── video/             # Avatar videos
│   │   └── audio/             # Audio + lipsync
│   └── .specify/              # Scripts & workflows
│       ├── memory/            # Documentation
│       └── scripts/           # Automation
└── CODESPACES.md              # Codespaces guide
```

## 🎨 Avatar Generation

### Full OnlyFans Collection
```bash
# Generate 5 styles × 3 images = 15 premium avatars
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py
```

### Individual Styles
```bash
# Casual sexy (3 images)
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py --style casual_sexy --count 3

# Lingerie premium (3 images)  
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py --style lingerie_premium --count 3
```

### ComfyUI Web Interface
```bash
# Start ComfyUI
cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188

# Access the interface
# http://localhost:8188
```

## 🔧 Local Installation (Mac M3)

### Prerequisites
- Mac M3 (18GB unified RAM)
- macOS 14.0+ (Sonoma or later)
- 100GB+ free storage
- Python 3.10+

### Quick Start
```bash
# Clone the project
git clone https://github.com/Soynido/avatar.git
cd avatar

# Full automatic installation
./quick_start.sh

# Or manual installation
bash ONLY/.specify/scripts/bash/setup-plan.sh
```

## 📊 Technical Specifications

### Mac M3 Performance
- **Resolution** : 1024x1024 (commercial quality)
- **Generation time** : ~30-60s per image
- **Memory** : 8-12GB RAM used
- **GPU** : MPS (Metal Performance Shaders)

### Codespaces Performance
- **CPU** : Optimized cloud instances
- **RAM** : 8-32GB depending on plan
- **Storage** : Persistent volumes for models
- **Costs** : Usage-based billing

## 🎯 Quality Criteria

### Visual Consistency
- ✅ Avatar perfectly recognizable across images
- ✅ Same face, same body, same style
- ✅ Variations only in outfits/poses

### Commercial Quality
- ✅ 1024x1024 resolution maintained
- ✅ Consistent and attractive facial details
- ✅ Professional photographic quality
- ✅ No major visual artifacts

### OnlyFans Monetization
- ✅ Visual appeal suited to the premium market
- ✅ Diversity of poses and outfits
- ✅ Maximum user engagement
- ✅ High-value content

## 📚 Documentation

- **[Codespaces Guide](CODESPACES.md)** - Complete cloud configuration
- **[Technical Specifications](ONLY/.specify/memory/specs.md)** - Technical details
- **[Development Plan](ONLY/.specify/memory/plan.md)** - Detailed roadmap
- **[Tasks](ONLY/.specify/memory/tasks.md)** - Task list
- **[Constitution](ONLY/.specify/memory/constitution.md)** - Project principles

## 🤝 Contributing

This project follows the principles established in the constitution:
- ✅ Respect for absolute locality
- ✅ Strict legal compliance
- ✅ Technical pragmatism
- ✅ Mandatory documentation

### Development Workflow
1. Fork the repository
2. Create a feature branch
3. Implement changes
4. Test and validate
5. Pull Request to main

## ⚖️ Legal Compliance

- ✅ **100% AI Avatar** : No real person
- ✅ **Adult content** : Platform compliance
- ✅ **Legal monetization** : OnlyFans compliant
- ✅ **Intellectual property** : Open source models

## 📞 Support

### Resources
- [GitHub Issues](https://github.com/Soynido/avatar/issues)
- [Discussions](https://github.com/Soynido/avatar/discussions)
- [ComfyUI Documentation](https://docs.comfy.org/)

### Common Issues
1. **Slow Codespace** : Restart the container
2. **Models not detected** : Check permissions
3. **Generation fails** : Check ComfyUI logs
4. **Ports closed** : Restart ComfyUI with `0.0.0.0`

## 📈 Roadmap

### Phase 1 ✅ - Premium Photos
- [x] ComfyUI + SDXL setup
- [x] Photo generation pipeline
- [x] 50+ photos with 4+ outfits

### Phase 2 🚧 - Interactive Videos  
- [ ] AnimateDiff integration
- [ ] Generate 5-10s clips
- [ ] FFmpeg post-processing

### Phase 3 📋 - Audio and Lipsync
- [ ] Local TTS setup
- [ ] SadTalker integration
- [ ] Complete lipsync pipeline

## 📄 License

[MIT License](LICENSE) - See the LICENSE file for details.

---

**🔥 AI Avatar - Premium OnlyFans Platform**  
**💰 Automated generation of monetizable avatars**

[![GitHub stars](https://img.shields.io/github/stars/Soynido/avatar?style=social)](https://github.com/Soynido/avatar/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Soynido/avatar?style=social)](https://github.com/Soynido/avatar/network/members)
[![GitHub issues](https://img.shields.io/github/issues/Soynido/avatar)](https://github.com/Soynido/avatar/issues)