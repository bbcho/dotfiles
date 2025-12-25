#!/bin/bash
# Setup script for neovim notebook environment on Fedora
# Uses uv for Python environment management

set -e

echo "=== Neovim Notebook Setup for Fedora (uv) ==="

# Check for uv
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source ~/.cargo/env
fi

# Create a dedicated neovim/jupyter venv
NVIM_VENV="$HOME/.local/share/nvim-jupyter"
echo "[1/5] Creating dedicated venv at $NVIM_VENV..."
uv venv "$NVIM_VENV"

# Install Python dependencies into the venv
echo "[2/5] Installing Python dependencies..."
uv pip install --python "$NVIM_VENV/bin/python" \
    jupyter \
    jupyter_client \
    pynvim \
    cairosvg \
    pnglatex \
    plotly \
    kaleido \
    nbformat \
    ipykernel \
    matplotlib \
    pandas \
    numpy

# Register the kernel globally so Molten can find it
echo "[3/5] Registering Jupyter kernel..."
"$NVIM_VENV/bin/python" -m ipykernel install --user --name nvim-python --display-name "Python (nvim)"

# System dependencies for image rendering
echo "[4/5] Installing system dependencies..."
sudo dnf install -y \
    ImageMagick \
    luajit \
    luarocks

# Neovim dependencies via luarocks (for image.nvim)
echo "[5/5] Installing Lua dependencies..."
luarocks --local install magick

echo ""
echo "=== Setup Complete ==="
echo ""
echo "venv location: $NVIM_VENV"
echo "Jupyter kernel: nvim-python"
echo ""
echo "Next steps:"
echo "1. Copy the config files to your LazyVim config:"
echo "   cp lua/plugins/notebook.lua ~/.config/nvim/lua/plugins/"
echo "   cp lua/notebook-cells.lua ~/.config/nvim/lua/"
echo "   mkdir -p ~/.config/nvim/after/ftplugin"
echo "   cp after/ftplugin/python.lua ~/.config/nvim/after/ftplugin/"
echo ""
echo "2. Restart Neovim (LazyVim will auto-install plugins)"
echo ""
echo "3. Run :UpdateRemotePlugins and restart Neovim again"
echo ""
echo "4. Open a Python file and run :MoltenInit"
echo ""
echo "Helper functions (auto-injected on kernel init):"
echo "  show_interactive(fig)  - Pop Plotly figure to browser"
echo "  show(fig, interactive=True/False)"
echo "  pop()                  - Pop last figure to browser"
echo "  <leader>mp             - Keymap for pop()"
echo ""
echo "=== Per-Project Kernels ==="
echo ""
echo "For project-specific deps, create a kernel in your project:"
echo "  cd my-project"
echo "  uv venv"
echo "  uv pip install ipykernel plotly kaleido <your-deps>"
echo "  uv run python -m ipykernel install --user --name myproject"
echo ""
echo "Then use :MoltenInit myproject in Neovim."
echo ""
