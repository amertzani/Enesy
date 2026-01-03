# 🚀 Quick Start Guide - macOS

Get your NesyX application running on macOS in 5 minutes!

## Prerequisites Check

```bash
# Check Python (need 3.8+)
python3 --version

# Check Node.js (need 18+)
node --version

# If missing, install with Homebrew:
brew install python3 node
```

## Setup (One-Time)

```bash
# 1. Setup Python environment
./setup_macos.sh

# 2. Install Node.js dependencies
cd RandDKnowledgeGraph
npm install
cd ..
```

## Running the Application

### Option A: Start Both Servers (Easiest)

```bash
./start_all.sh
```

This opens two terminal windows automatically.

### Option B: Start Manually

**Terminal 1 - Backend:**
```bash
./start_backend.sh
```

**Terminal 2 - Frontend:**
```bash
./start_frontend.sh
```

## Access

- **Frontend**: http://localhost:5005
- **Backend API**: http://localhost:8001
- **API Docs**: http://localhost:8001/docs

## Stopping

Press `Ctrl+C` in each terminal window, or close the terminal windows.

## Troubleshooting

**Port in use?**
```bash
export API_PORT=8002  # For backend
export PORT=5006      # For frontend
```

**Permission denied?**
```bash
chmod +x *.sh
```

**Need help?** See `DEPLOYMENT_MACOS.md` for detailed instructions.

