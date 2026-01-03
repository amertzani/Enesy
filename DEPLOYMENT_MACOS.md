# 🍎 macOS Deployment Guide

This guide will help you deploy and run the NesyX Knowledge Graph application on your MacBook Pro.

## Prerequisites

Before starting, ensure you have the following installed:

1. **Python 3.8+** - Check with `python3 --version`
   - If not installed: `brew install python3` (requires Homebrew)
   - Or download from [python.org](https://www.python.org/downloads/)

2. **Node.js 18+** - Check with `node --version`
   - If not installed: `brew install node`
   - Or download from [nodejs.org](https://nodejs.org/)

3. **Homebrew** (optional but recommended) - Check with `brew --version`
   - Install from [brew.sh](https://brew.sh/)

## Quick Start

### Option 1: Automated Setup (Recommended)

1. **Make scripts executable** (if not already):
   ```bash
   chmod +x setup_macos.sh start_backend.sh start_frontend.sh start_all.sh
   ```

2. **Run the setup script**:
   ```bash
   ./setup_macos.sh
   ```
   This will:
   - Create a Python virtual environment
   - Install all Python dependencies
   - Set up the environment

3. **Install Node.js dependencies**:
   ```bash
   cd RandDKnowledgeGraph
   npm install
   cd ..
   ```

4. **Start both servers**:
   ```bash
   ./start_all.sh
   ```
   This opens two terminal windows - one for backend, one for frontend.

### Option 2: Manual Setup

#### Step 1: Python Backend Setup

1. **Create virtual environment**:
   ```bash
   python3 -m venv venv
   ```

2. **Activate virtual environment**:
   ```bash
   source venv/bin/activate
   ```

3. **Install Python dependencies**:
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Download spaCy language model**:
   ```bash
   python3 -m spacy download en_core_web_sm
   ```

#### Step 2: Node.js Frontend Setup

1. **Navigate to frontend directory**:
   ```bash
   cd RandDKnowledgeGraph
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

#### Step 3: Start the Application

**Terminal 1 - Backend**:
```bash
# From project root
source venv/bin/activate
python3 api_server.py
```

**Terminal 2 - Frontend**:
```bash
# From RandDKnowledgeGraph directory
npm run dev
```

## Accessing the Application

Once both servers are running:

- **Frontend**: http://localhost:5005
- **Backend API**: http://localhost:8001
- **API Documentation**: http://localhost:8001/docs

## Troubleshooting

### Port Already in Use

If you see "port already in use" errors:

**Backend** (default port 8001):
```bash
export API_PORT=8002
python3 api_server.py
```

**Frontend** (default port 5005):
```bash
export PORT=5006
npm run dev
```

### Python Virtual Environment Issues

If you have issues with the virtual environment:

```bash
# Remove old environment
rm -rf venv

# Create new one
python3 -m venv venv

# Activate and reinstall
source venv/bin/activate
pip install -r requirements.txt
```

### Node.js Issues

If npm install fails:

```bash
# Clear npm cache
npm cache clean --force

# Remove node_modules and reinstall
cd RandDKnowledgeGraph
rm -rf node_modules package-lock.json
npm install
```

### ML Library Installation Issues

Some ML libraries (like `bitsandbytes`) may not work on macOS as they're designed for CUDA/GPU. This is normal and won't affect basic functionality.

If `spacy` installation fails:
```bash
# Try installing with conda instead
conda install -c conda-forge spacy
python3 -m spacy download en_core_web_sm
```

### Permission Denied Errors

If you get "permission denied" when running scripts:

```bash
chmod +x setup_macos.sh start_backend.sh start_frontend.sh start_all.sh
```

## Environment Variables

You can customize the application behavior with environment variables:

**Backend**:
- `API_PORT`: Backend server port (default: 8001)
- `API_HOST`: Backend server host (default: 0.0.0.0)
- `USE_TRIPLEX`: Enable Triplex model (default: false)

**Frontend**:
- `PORT`: Frontend server port (default: 5005)
- `NODE_ENV`: Environment mode (development/production)

Example:
```bash
export API_PORT=8002
export PORT=5006
./start_all.sh
```

## Development vs Production

### Development Mode (Default)

- Hot reloading enabled
- Detailed error messages
- Vite dev server for frontend

### Production Mode

1. **Build the frontend**:
   ```bash
   cd RandDKnowledgeGraph
   npm run build
   ```

2. **Start in production mode**:
   ```bash
   # Backend
   source venv/bin/activate
   python3 api_server.py

   # Frontend (from RandDKnowledgeGraph directory)
   NODE_ENV=production npm start
   ```

## File Structure

```
Enesy/
├── api_server.py              # FastAPI backend server
├── knowledge.py                # Knowledge graph logic
├── file_processing.py          # File upload processing
├── documents_store.py          # Document storage
├── responses.py                # LLM response generation
├── requirements.txt            # Python dependencies
├── setup_macos.sh              # macOS setup script
├── start_backend.sh            # Backend startup script
├── start_frontend.sh           # Frontend startup script
├── start_all.sh                # Start both servers
├── RandDKnowledgeGraph/        # Frontend application
│   ├── client/                 # React frontend
│   ├── server/                 # Express server
│   └── package.json            # Node.js dependencies
└── DEPLOYMENT_MACOS.md         # This file
```

## Stopping the Application

To stop the servers:

1. **If using `start_all.sh`**: Close the terminal windows or press `Ctrl+C` in each
2. **If running manually**: Press `Ctrl+C` in each terminal

## Next Steps

1. **Upload documents**: Use the file upload feature to add PDF, DOCX, TXT, or CSV files
2. **Add knowledge**: Manually add facts or let the system extract them from documents
3. **Explore the graph**: Visualize your knowledge graph
4. **Chat**: Ask questions about your knowledge base

## Additional Resources

- **API Documentation**: http://localhost:8001/docs (when backend is running)
- **Project README**: See `README.md` for more information about the project

## Support

If you encounter issues:

1. Check the terminal output for error messages
2. Verify all prerequisites are installed
3. Ensure ports are not in use by other applications
4. Check that virtual environment is activated (for Python commands)

## Notes

- The application uses file-based storage (`knowledge_graph.pkl`, `documents_store.json`)
- Data persists between restarts
- The backend clears all facts on startup (as configured in `api_server.py`)
- ML models are loaded on first use and may take 1-2 minutes

---

**Last Updated**: 2025-01-15
**Platform**: macOS (tested on macOS 14+)

