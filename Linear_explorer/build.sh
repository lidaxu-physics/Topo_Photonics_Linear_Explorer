#!/usr/bin/env bash
set -e
echo "============================================================"
echo " Topological Photonic Lattice Explorer — Build Script"
echo "============================================================"

rm -rf build dist

pyinstaller PhotonicLatticeExplorer.spec

if [ -f "dist/PhotonicLatticeExplorer" ]; then
    echo ""
    echo " Build SUCCESS — dist/PhotonicLatticeExplorer is ready."
else
    echo ""
    echo " Build FAILED — check output above for errors."
    exit 1
fi
