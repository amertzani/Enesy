#!/bin/bash

# spaCy Installation Script for macOS
# Tries multiple methods to install spaCy successfully

set -e

echo "🔧 Installing spaCy on macOS..."
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run ./init_venv.sh first"
    exit 1
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Check Python version and architecture
PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
ARCH=$(uname -m)
echo "📋 Python: $PYTHON_VERSION"
echo "📋 Architecture: $ARCH"
echo ""

# Method 1: Try installing pre-built wheels (fastest, most reliable)
echo "🔹 Method 1: Installing spaCy with pre-built wheels..."
echo "   (This avoids compilation issues)"
if pip install --only-binary :all: spacy>=3.7.0; then
    echo "✅ spaCy installed successfully with pre-built wheels!"
    
    # Download language model
    echo ""
    echo "📥 Downloading spaCy English language model..."
    if python3 -m spacy download en_core_web_sm; then
        echo "✅ spaCy model downloaded successfully!"
        echo ""
        echo "🎉 spaCy is ready to use!"
        exit 0
    else
        echo "⚠️  spaCy installed but model download failed"
        echo "   You can download it later with: python3 -m spacy download en_core_web_sm"
        exit 0
    fi
else
    echo "⚠️  Pre-built wheels not available, trying other methods..."
fi

# Method 2: Try installing with conda (if available)
if command -v conda &> /dev/null; then
    echo ""
    echo "🔹 Method 2: Installing spaCy with conda..."
    echo "   (Conda packages are pre-compiled and more reliable on macOS)"
    if conda install -c conda-forge spacy -y; then
        echo "✅ spaCy installed successfully with conda!"
        
        # Download language model
        echo ""
        echo "📥 Downloading spaCy English language model..."
        if python3 -m spacy download en_core_web_sm; then
            echo "✅ spaCy model downloaded successfully!"
            echo ""
            echo "🎉 spaCy is ready to use!"
            exit 0
        fi
    else
        echo "⚠️  Conda installation failed, trying pip with build isolation..."
    fi
fi

# Method 3: Try installing with pip using build isolation disabled
echo ""
echo "🔹 Method 3: Installing spaCy with pip (no build isolation)..."
echo "   (This may work if build dependencies are already installed)"

# First, try to install build dependencies separately
echo "   Installing build dependencies..."
pip install setuptools wheel cython || echo "   ⚠️  Some build dependencies failed"

# Try installing spaCy
if pip install --no-build-isolation spacy>=3.7.0; then
    echo "✅ spaCy installed successfully!"
    
    # Download language model
    echo ""
    echo "📥 Downloading spaCy English language model..."
    if python3 -m spacy download en_core_web_sm; then
        echo "✅ spaCy model downloaded successfully!"
        echo ""
        echo "🎉 spaCy is ready to use!"
        exit 0
    fi
else
    echo "⚠️  Installation failed"
fi

# Method 4: Check for Xcode Command Line Tools
echo ""
echo "🔹 Method 4: Checking build tools..."
if ! xcode-select -p &> /dev/null; then
    echo "❌ Xcode Command Line Tools not installed!"
    echo ""
    echo "💡 Installing Xcode Command Line Tools is required for building spaCy"
    echo "   Run this command: xcode-select --install"
    echo "   Then run this script again"
    exit 1
else
    echo "✅ Xcode Command Line Tools are installed"
fi

# Method 5: Try installing older version of spaCy (may have better wheel support)
echo ""
echo "🔹 Method 5: Trying older spaCy version (3.7.0)..."
if pip install spacy==3.7.0; then
    echo "✅ spaCy 3.7.0 installed successfully!"
    
    # Download language model
    echo ""
    echo "📥 Downloading spaCy English language model..."
    if python3 -m spacy download en_core_web_sm; then
        echo "✅ spaCy model downloaded successfully!"
        echo ""
        echo "🎉 spaCy is ready to use!"
        exit 0
    fi
fi

# If all methods failed
echo ""
echo "❌ All installation methods failed"
echo ""
echo "💡 Troubleshooting steps:"
echo ""
echo "1. Install/Update Xcode Command Line Tools:"
echo "   xcode-select --install"
echo ""
echo "2. Try using conda (recommended for macOS):"
echo "   conda install -c conda-forge spacy"
echo "   python3 -m spacy download en_core_web_sm"
echo ""
echo "3. Check Python architecture matches your Mac:"
echo "   python3 -c 'import platform; print(platform.machine())'"
echo "   uname -m"
echo ""
echo "4. Try creating a fresh virtual environment:"
echo "   rm -rf venv"
echo "   python3 -m venv venv"
echo "   source venv/bin/activate"
echo "   pip install --upgrade pip"
echo "   ./install_spacy_macos.sh"
echo ""
echo "Note: spaCy is optional - your app works without it!"
exit 1

