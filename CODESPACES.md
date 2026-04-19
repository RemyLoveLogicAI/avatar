# 🚀 AI Avatar - GitHub Codespaces

## Overview

Complete configuration for running the **OnlyFans AI Avatar Platform** in GitHub Codespaces. The project is automatically set up with all necessary components.

## ⚡ 1-Click Start

1. **Create a Codespace** : Click the "Code" button → "Codespaces" → "Create codespace"
2. **Wait for installation** : ~5-10 minutes (AI model download)
3. **Access the interface** : http://localhost:8188 (ComfyUI)
4. **Generate avatars** : `python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py`

## 🔧 Automatic Configuration

### Installed Components
- ✅ **Python 3.11** with virtual environment
- ✅ **PyTorch** (CPU optimized for Codespaces)
- ✅ **ComfyUI** with all dependencies
- ✅ **AI Models** : SDXL, IP-Adapter, VAE
- ✅ **VS Code Extensions** : Python, Jupyter, Copilot
- ✅ **Forwarded ports** : 8188 (ComfyUI), 3000 (Dev), 8000 (API)

### Mounted Directories
- `ONLY/models/` : AI models (persistent)
- `ONLY/outputs/` : Generated images/videos (persistent)

## 📋 Essential Commands

### Quick Start
```bash
# After opening the Codespace
./codespace-start.sh
```

### OnlyFans Avatar Generation
```bash
# Full collection (5 styles × 3 images)
python ONLY/.specify/scripts/python/generate_onlyfans_avatars.py

# Available styles:
# - casual_sexy : Casual seductive outfit
# - lingerie_premium : Luxury lingerie
# - sporty_fit : Attractive sportswear
# - elegant_sophisticated : Elegant sophisticated style
# - intimate_bedroom : Intimate bedroom ambiance
```

### ComfyUI Management
```bash
# Start ComfyUI manually
cd ONLY/ComfyUI && source .venv/bin/activate && python main.py --listen 0.0.0.0 --port 8188

# View logs
tail -f ONLY/ComfyUI/comfyui.log

# Stop ComfyUI
kill $(cat ONLY/ComfyUI/comfyui.pid)
```

### Automation Scripts
```bash
# Full system test
bash ONLY/.specify/scripts/bash/setup-plan.sh --test-only

# System status
bash ONLY/.specify/scripts/bash/setup-plan.sh --status

# Cleanup
bash ONLY/.specify/scripts/bash/setup-plan.sh --cleanup
```

## 🌐 Web Access

| Service | URL | Description |
|---------|-----|-------------|
| **ComfyUI** | http://localhost:8188 | Main generation interface |
| **Dev Server** | http://localhost:3000 | Development server |
| **API Server** | http://localhost:8000 | REST API |

## 💰 Premium OnlyFans Prompts

### Content Styles
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

### Negative Prompts (safety)
```
"blurry, low quality, distorted, extra limbs, bad anatomy, watermark, text, deformed, ugly, underage, child, old, wrinkles"
```

## 📁 Project Structure

```
avatar/
├── .devcontainer/           # Codespaces configuration
│   ├── devcontainer.json    # Container configuration
│   ├── setup.sh            # Automatic installation
│   └── start.sh            # Quick start
├── ONLY/
│   ├── ComfyUI/            # Main AI engine
│   ├── models/             # AI models (15GB+)
│   │   ├── checkpoints/    # SDXL Base & Refiner
│   │   ├── ipadapter/      # IP-Adapter FaceID
│   │   └── vae/            # VAE FaceID
│   ├── outputs/            # Generated content
│   │   ├── images/         # Avatar photos
│   │   ├── video/          # Avatar videos
│   │   └── audio/          # Audio + lipsync
│   └── .specify/           # Scripts & workflows
│       ├── memory/         # Documentation
│       └── scripts/        # Automation
└── codespace-start.sh      # Quick start
```

## 🔧 Troubleshooting

### ComfyUI won't start
```bash
# Check logs
tail -f ONLY/ComfyUI/comfyui.log

# Restart
kill $(cat ONLY/ComfyUI/comfyui.pid) 2>/dev/null || true
./codespace-start.sh
```

### Missing models
```bash
# Reinstall models
bash .devcontainer/setup.sh
```

### Ports not accessible
- Check that ports are forwarded in the "Ports" tab of VS Code
- ComfyUI must listen on `0.0.0.0:8188` (not `127.0.0.1`)

## 💡 Codespaces Optimizations

### Performance
- **CPU** : Codespaces uses optimized CPU instances
- **RAM** : 8-32GB depending on plan (sufficient for SDXL)
- **Storage** : Models mounted as persistent volumes

### Costs
- **Codespaces** : Usage-based billing (automatic shutdown)
- **Models** : Downloaded only once (HuggingFace cache)
- **Generation** : Local CPU (no AI cloud costs)

## 🎯 Commercial Goals

### Expected Deliverables
- ✅ **50+ premium photos** full-body consistent
- ✅ **3-4 different outfits** (casual, lingerie, sporty, intimate)
- ✅ **Automated pipeline** for mass production
- ✅ **Monetization** on premium OnlyFans platforms

### Quality Criteria
- **Resolution** : 1024x1024 (commercial quality)
- **Consistency** : Avatar perfectly recognizable
- **Diversity** : Variety of poses and outfits
- **Appeal** : Optimized for user engagement

## 📞 Support

### Resources
- [ComfyUI Documentation](https://docs.comfy.org/)
- [Technical specifications](./ONLY/.specify/memory/specs.md)
- [Development plan](./ONLY/.specify/memory/plan.md)
- [Detailed tasks](./ONLY/.specify/memory/tasks.md)

### Common Issues
1. **Slow Codespace** : Restart the container
2. **Models not detected** : Check permissions
3. **Generation fails** : Check ComfyUI logs
4. **Ports closed** : Restart ComfyUI with `0.0.0.0`

---

**🔥 AI Avatar - Premium OnlyFans Platform**  
**💰 Automated generation of monetizable avatars**
