# Constitution du Projet Avatar IA

**Version:** 1.0.0  
**Date de ratification:** 2024-12-19  
**Dernière modification:** 2024-12-19

## Vue d'ensemble

Ce document établit les principes fondamentaux, les contraintes et les objectifs du projet de création d'un avatar 100% IA corps entier pour la génération de contenu NSFW cohérent sur OnlyFans.

## Objectif du Projet

Développer un **MVP fonctionnel en 2-3 semaines** capable de générer :
- 50+ photos plein-pied cohérentes de l'avatar (3-4 tenues)
- 2-3 clips vidéo corps entier courts (5-10s) cohérents
- 1 séquence vocale (TTS) + gros plan lipsync (head-talk)
- Un pipeline reproductible documenté

## Principes Fondamentaux

### 1. Principe de Localité Absolue
**Règle :** Toute génération doit s'exécuter en local sur GPU personnel, sans aucun service cloud payant.

**Justification :** Budget initial de 0€ impose une approche 100% locale. Tous les outils (ComfyUI, Stable Diffusion, TTS) doivent fonctionner sur RTX 3060 ou mieux.

### 2. Principe de Conformité Légale
**Règle :** Interdiction totale d'utiliser l'image ou la voix de personnes réelles. L'avatar doit être une création originale 100% IA.

**Justification :** Protection contre les poursuites légales et respect des droits d'image. Aucun contenu impliquant des mineurs n'est autorisé.

### 3. Principe de Cohérence Visuelle
**Règle :** L'avatar doit maintenir une identité visuelle cohérente à travers toutes les générations (visage, corps, style).

**Justification :** Essentiel pour la crédibilité du contenu et l'expérience utilisateur. Utilisation de LoRA et techniques de contrôle pour garantir la cohérence.

### 4. Principe de Pragmatisme Technique
**Règle :** Prioriser les solutions fonctionnelles simples plutôt que les optimisations complexes.

**Justification :** Contrainte de temps (2-3 semaines) et équipe réduite (2 personnes max) imposent des choix pragmatiques.

### 5. Principe d'Automatisation Maximale
**Règle :** Automatiser au maximum les workflows de génération et de post-traitement.

**Justification :** Réduction du temps de production et reproductibilité du pipeline. Scripts Python et workflows ComfyUI sauvegardés.

### 6. Principe de Documentation Obligatoire
**Règle :** Chaque composant du pipeline doit être documenté avec des exemples reproductibles.

**Justification :** Faciliter la maintenance et l'évolution du projet. Scripts, workflows et procédures doivent être clairement documentés.

## Contraintes Techniques

### Matériel
- **GPU :** Apple M3 (GPU intégré Metal/MPS, 18GB RAM unifiée)
- **RAM :** 18GB RAM unifiée (GPU + CPU partagés)
- **Stockage :** 100GB+ pour modèles et datasets
- **OS :** macOS avec support Metal Performance Shaders (MPS)

### Outils Imposés (Optimisés M3)
- **ComfyUI** : Moteur central avec support MPS
- **Stable Diffusion 1.5** : Modèle principal (plus léger que SDXL)
- **SDXL** : Optionnel pour photos haute qualité (fp16, batch=1)
- **ControlNet** : OpenPose/Depth pour poses
- **IP-Adapter** : Cohérence visuelle (remplace LoRA local)
- **AnimateDiff** : Génération vidéo (SD1.5, 8-12 steps)
- **SadTalker** : Lipsync (plus stable que LivePortrait)
- **Piper/Coqui-TTS** : Synthèse vocale (CPU)
- **FFmpeg** : Post-traitement et montage vidéo

## Priorités de Développement

### Phase 1 (Semaine 1) : Photos Cohérentes
1. Configuration ComfyUI + MPS (Metal Performance Shaders)
2. Configuration IP-Adapter pour cohérence avatar
3. Pipeline génération photos (SD1.5 + SDXL optionnel)
4. 50+ photos avec 3-4 tenues différentes

### Phase 2 (Semaine 2) : Vidéos Courtes
1. Intégration AnimateDiff (SD1.5, 8-12 steps)
2. ControlNet pour poses dynamiques
3. Génération 2-3 clips (5s max, optimisé M3)
4. Post-traitement FFmpeg

### Phase 3 (Semaine 3) : Audio et Lipsync
1. Configuration TTS local (Piper/Coqui)
2. Intégration SadTalker
3. Pipeline lipsync complet
4. Documentation finale

## Hypothèses de Travail

### Capacités Techniques (M3)
- GPU M3 suffisant pour SD1.5 + AnimateDiff (SDXL limité)
- Outils open source avec support MPS/Metal
- Temps de génération : 2-8 min par image, 10-20 min par vidéo (5s)

### Qualité Attendue (Optimisée M3)
- Photos : Qualité professionnelle avec SD1.5, SDXL pour finitions
- Vidéos : Mouvements simples, durée limitée à 5s pour performance
- Audio : Clarté vocale acceptable pour lipsync (CPU)

## Risques Identifiés

### Risques Techniques (M3)
- **Qualité vidéo limitée** : AnimateDiff + M3 = artefacts possibles, durée limitée
- **Cohérence sans LoRA** : IP-Adapter moins précis que LoRA entraîné
- **Lenteur génération** : M3 plus lent que RTX, batch size limité à 1-2
- **Mémoire limitée** : 18GB partagés entre GPU/CPU, pas de batch large

### Risques Légaux
- **Contenu NSFW** : Respect des plateformes et législation
- **Droits d'auteur** : Vérification que l'avatar est 100% original

### Risques de Planning
- **Délais serrés** : 2-3 semaines pour MVP complet
- **Équipe réduite** : 2 personnes maximum

## Gouvernance

### Processus de Décision
- Décisions techniques : Consensus entre les 2 membres de l'équipe
- Modifications constitution : Vote unanime requis
- Priorités : Réévaluation hebdomadaire

### Versioning
- **MAJOR** : Changements incompatibles de principes
- **MINOR** : Ajout de nouveaux principes ou sections
- **PATCH** : Clarifications et corrections

### Conformité
- Audit hebdomadaire de conformité aux principes
- Documentation des écarts et justifications
- Mise à jour des processus si nécessaire

## Livrables Obligatoires

### Documentation
- Pipeline complet documenté
- Scripts Python reproductibles
- Workflows ComfyUI sauvegardés
- Guide d'installation et configuration

### Contenu Généré
- 50+ photos cohérentes (3-4 tenues)
- 2-3 clips vidéo (5-10s)
- 1 séquence audio + lipsync
- Exemples de qualité pour validation

### Code
- Scripts d'automatisation
- Utilitaires de post-traitement
- Tests de cohérence visuelle
- Pipeline de validation

## Conclusion

Cette constitution établit le cadre de développement du projet Avatar IA. Toute décision technique ou organisationnelle doit respecter ces principes fondamentaux. Les modifications de cette constitution nécessitent un consensus unanime de l'équipe et une mise à jour de version appropriée.

---

**Prochaine révision :** 2024-12-26 (audit hebdomadaire)
