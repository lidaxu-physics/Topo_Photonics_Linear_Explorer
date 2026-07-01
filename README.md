# Topological Photonic Lattice Explorer

A standalone desktop application for simulating and visualizing topological photonic lattices. No Jupyter or notebook environment required — just run or build the app and start exploring.

---

## Overview

This tool is designed for **linear photonic systems only** — it models coupled-resonator lattices in the linear (single-photon / classical field) regime and does not account for nonlinear effects such as Kerr interactions or parametric processes.

Within that scope, it lets you interactively construct coupled-resonator lattices, tune their Hamiltonians, and compute transmission spectra and field flow in real time. It is designed for researchers studying topological photonics, including integer quantum Hall (IQH) and anomalous quantum Hall (AQH) phases in photonic systems.

**Model.** The physics backend is a **tight-binding (coupled-mode) effective Hamiltonian**: each site ring is a single mode, and the intermediate *link (coupling) rings are integrated out* into effective nearest-neighbor hoppings carrying synthetic-flux (Peierls) phases. The simulator therefore does **not** resolve the field inside the link rings or the round-trip propagation within a ring — it works directly in the lattice Hamiltonian picture, which makes it fast and ideal for exploring band structure and edge modes. For a full *z*-resolved transfer-matrix treatment that keeps the link rings explicitly (and a nonlinear Kerr-comb extension), see the companion repositories [Topological_Photonics_TMM](https://github.com/lidaxu-physics/Topological_Photonics_TMM) and [Topological_Photonics_Ikeda](https://github.com/lidaxu-physics/Topological_Photonics_Ikeda).

The GUI is built with PyQt5 and Matplotlib, and the physics backend uses fully vectorized NumPy computations. An optional JAX backend is supported: if JAX is installed, the frequency solver is JIT-compiled and dispatched via XLA (GPU or CPU), with automatic fallback to NumPy otherwise.

---

## Features

- **Multiple lattice geometries**: IQH superlattice, AQH superlattice, IQH×AQH mixed, AQH zigzag, IQH cylinder, AQH cylinder
- **Interactive lattice editor**: click to set input/output ports, add on-site potential perturbations ("heaters"), or introduce defects (missing sites)
- **Tunable Hamiltonian parameters**: flux phases φ_IQH and φ_AQH, intra/inter-supercell coupling strengths, loss rates κ_in and κ_ex, and superlattice grid sizes
- **Transmission spectrum**: through-port, drop-port, and group delay plots over a user-defined frequency sweep
- **Field flow visualization**: steady-state power flow arrows on the lattice at any probe frequency
- **Cylinder geometries**: periodic boundary in x with tunable external flux ψ, polar visualization
- **Optional JAX acceleration**: GPU/XLA-accelerated frequency solve when JAX is available
- **Session export**: save lattice images (PNG + SVG), spectra plots, all parameters, and complex field data as a timestamped `.zip`

---

## Requirements

- Python 3.8+
- PyQt5 >= 5.15
- matplotlib >= 3.7
- numpy >= 1.24

Install dependencies:

```bash
pip install -r requirements.txt
```

Optional (for GPU/XLA acceleration):

```bash
pip install jax jaxlib
```

---

## Running from Source

```bash
python app.py
```

---

## Building a Standalone Executable

### Linux / macOS

```bash
bash build.sh
```

The binary will be at `dist/PhotonicLatticeExplorer`.

### Windows

```bat
build.bat
```

The executable will be at `dist\PhotonicLatticeExplorer.exe`.

Both scripts install dependencies and invoke PyInstaller with the correct flags for a single-file windowed application.

---

## Usage

1. **Select a Hamiltonian type** from the dropdown (e.g. `IQH_IQH`, `AQH_cyl`, `A_zigzag`).
2. **Set lattice dimensions** using the grid size spinboxes (Nx0, Ny0 for the unit cell; Nx1, Ny1 for the supercell).
3. **Adjust physics parameters**: coupling J1, loss rates κ_in / κ_ex, and flux phases φ_IQH / φ_AQH via the sliders.
4. **Edit the lattice**: use the mode buttons to set the IN/OUT ports, apply on-site potentials to individual rings, or mark sites as defects.
5. **Set the frequency sweep** range and step size, then click **Run** to compute.
6. **Inspect results**: click or drag on the spectrum panels to probe the field flow at any frequency.
7. **Save**: choose an output folder and click **Save** to export all plots and data as a `.zip`.

---

## File Structure

```
├── app.py                        # Main application (UI + physics)
├── requirements.txt              # Python dependencies
├── build.sh                      # Linux/macOS build script
├── build.bat                     # Windows build script
├── PhotonicLatticeExplorer.spec  # PyInstaller spec file
└── icon.ico                      # Application icon
```

---

## License

Released under the **MIT License** — see [`LICENSE`](LICENSE).

## Citation

If you use this software in academic work, please cite both the software and the relevant
publications. Citation metadata is in [`CITATION.cff`](CITATION.cff), and GitHub renders a
ready-to-copy citation via the **"Cite this repository"** button on the repo sidebar.

The tight-binding model and topological lattices implemented here build on:

- M. Hafezi, E. A. Demler, M. D. Lukin, and J. M. Taylor, *Robust optical delay lines with
  topological protection*, Nature Physics **7**, 907 (2011).
- M. Hafezi, S. Mittal, J. Fan, A. Migdall, and J. M. Taylor, *Imaging topological edge
  states in silicon photonics*, Nature Photonics **7**, 1001 (2013).
- S. Mittal, V. V. Orre, D. Leykam, Y. D. Chong, and M. Hafezi, *Photonic anomalous quantum
  Hall effect*, Phys. Rev. Lett. **123**, 043201 (2019).
- M. Jalali Mehrabad, A. Parhizkar, L. Xu, *et al.*, *Quantum Metamorphosis: Programmable
  Emergence and the Breakdown of Bulk–Edge Dichotomy in Multiscale Systems*,
  arXiv:2511.13831 (2025).
- C. J. Flower, M. Jalali Mehrabad, L. Xu, *et al.*, *Observation of topological frequency
  combs*, Science **384**, 1356 (2024).
- L. Xu, M. Jalali Mehrabad, C. J. Flower, *et al.*, *On-chip multi-timescale spatiotemporal
  optical synchronization*, Science Advances **11**, eadw7696 (2025).
- L. Xu, A. Padhye, S. Sarkar, *et al.*, *Single-Shot Realization of 10000-Mode
  Octave-Spanning Artificial Gauge Fields*, arXiv:2606.23960 (2026).


