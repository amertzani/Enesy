# Manual Server Startup Guide

Run backend and frontend in separate terminal windows for debugging.

## Terminal 1 - Backend (Python FastAPI)

```bash
# Navigate to project directory
cd /Users/s20/Enesy

# Activate virtual environment
source venv/bin/activate

# Start backend server
python3 api_server.py
```

**Expected output:**
```
Starting NesyX API server on http://0.0.0.0:8001
API documentation available at http://localhost:8001/docs
Frontend should connect to: http://localhost:8001
```

**Backend will be available at:**
- API: http://localhost:8001
- API Docs: http://localhost:8001/docs
- Health Check: http://localhost:8001/health

---

## Terminal 2 - Frontend (React/Node.js)

```bash
# Navigate to frontend directory
cd /Users/s20/Enesy/RandDKnowledgeGraph

# Install dependencies (if not already done)
npm install

# Start frontend server
npm run dev
```

**Expected output:**
```
✅ Server running at http://localhost:5005
```

**Frontend will be available at:**
- http://localhost:5005

---

## Debugging Tips

### Check Backend Logs
The backend terminal will show:
- API requests and responses
- File upload processing
- Knowledge graph operations
- Any errors or exceptions

### Check Frontend Logs
The frontend terminal will show:
- Vite dev server status
- Build errors
- Network requests
- React errors

### Common Issues

**Port already in use:**
```bash
# Backend - use different port
export API_PORT=8002
python3 api_server.py

# Frontend - use different port
export PORT=5006
npm run dev
```

**Backend not starting:**
- Check if venv is activated: `which python3` should show venv path
- Check Python dependencies: `pip list | grep fastapi`
- Check for errors in terminal output

**Frontend not starting:**
- Check Node.js version: `node --version` (need 18+)
- Check if dependencies installed: `ls node_modules`
- Check for errors in terminal output

**File loading issues:**
- Check backend terminal for upload errors
- Check browser console (F12) for network errors
- Verify file path and permissions
- Check CORS settings in api_server.py

---

## Stopping Servers

Press `Ctrl+C` in each terminal window to stop the servers.

---

## Quick Commands Reference

**Backend:**
```bash
cd /Users/s20/Enesy && source venv/bin/activate && python3 api_server.py
```

**Frontend:**
```bash
cd /Users/s20/Enesy/RandDKnowledgeGraph && npm run dev
```

