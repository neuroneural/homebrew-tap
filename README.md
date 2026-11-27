# Homebrew Tap for BrainChop Core

Official Homebrew tap for [BrainChop Core](https://github.com/neuroneural/brainchop-core) — fast, zero-dependency neuroimaging segmentation and skull stripping with four embedded 3D MeshNet models (`mindgrab`, `mindmap-fast`, `mindmap`, `mindsnap`).

## Install

```bash
brew install neuroneural/tap/brainchop
```

Or tap first and install:

```bash
brew tap neuroneural/tap
brew install brainchop
```

## Installed Executables

- `brainchop` — unified CLI dispatcher (`brainchop input.nii.gz -m mindmap -o labels.nii.gz`)
- `brainchop-mindgrab` — modality-agnostic skull stripping
- `brainchop-mindmap-fast` — fast 16-channel, 18-class segmentation (v4.1)
- `brainchop-mindmap` — high-accuracy 24-channel, 18-class segmentation + `--pve` tissue fractions (v4.0)
- `brainchop-mindsnap` — 24-channel, 104-class Desikan-Killiany parcellation (v4.0)

## Supported Platforms

- **macOS (Apple Silicon / arm64):** macOS 13.2+ with Apple Metal acceleration and multi-threaded CPU (Apple SME / NEON).
- **Linux (x86_64):** glibc 2.28+ with embedded NVIDIA CUDA Driver API modules (`sm60`–`sm90` native cubins + `compute_90` PTX for forward JIT, Driver API >= 12.8, no CUDA Toolkit needed), embedded AMD HIP (`gfx1151`), and multi-threaded AVX2+FMA CPU.
