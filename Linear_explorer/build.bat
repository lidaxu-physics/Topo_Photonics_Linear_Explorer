@echo off
echo ============================================
echo  Topological Photonic Lattice Explorer v2
echo  Build Script
echo ============================================

echo.
echo [1/2] Installing dependencies...
pip install pyqt5 matplotlib numpy pyinstaller

echo.
echo [2/2] Building executable...
pyinstaller --onefile --windowed ^
    --name "PhotonicLatticeExplorer" ^
    --icon "icon.ico" ^
    --add-data "icon.ico;." ^
    --hidden-import PyQt5.sip ^
    --hidden-import PyQt5.QtPrintSupport ^
    --hidden-import matplotlib.backends.backend_qt5agg ^
    --hidden-import matplotlib.backends.backend_agg ^
    --hidden-import matplotlib.figure ^
    --hidden-import numpy.core._multiarray_umath ^
    --collect-submodules matplotlib ^
    app.py

echo.
echo ============================================
echo  Done!
echo  Your exe is at:  dist\PhotonicLatticeExplorer.exe
echo ============================================
pause
