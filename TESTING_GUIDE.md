# 🧪 Testing Guide for NesyX Knowledge Graph Application

## Quick Start Testing

### Step 1: Start Both Servers

**Terminal 1 - Backend:**
```bash
cd /Users/s20/Enesy
source venv/bin/activate
python3 api_server.py
```

**Expected Output:**
```
Starting NesyX API server on http://0.0.0.0:8001
API documentation available at http://localhost:8001/docs
Frontend should connect to: http://localhost:8001
```

**Terminal 2 - Frontend:**
```bash
cd /Users/s20/Enesy/RandDKnowledgeGraph
npm run dev
```

**Expected Output:**
```
✅ Server running at http://localhost:5005
```

### Step 2: Access the Application

Open your browser and go to:
- **Frontend Application**: http://localhost:5005
- **Backend API Docs**: http://localhost:8001/docs

---

## Testing Checklist

### ✅ 1. Basic Connectivity Tests

#### Test Backend Health
```bash
# In a new terminal
curl http://localhost:8001/health
```

**Expected Response:**
```json
{"status": "healthy", "facts": 0}
```

#### Test Backend Root
```bash
curl http://localhost:8001/
```

**Expected Response:**
```json
{
  "status": "online",
  "service": "NesyX API",
  "facts_count": 0
}
```

#### Test Frontend Connection
- Open browser to http://localhost:5005
- Check browser console (F12) for any errors
- Should see the NesyX application interface

---

### ✅ 2. Knowledge Graph Tests

#### Test 1: Add a Fact Manually
1. Navigate to **Knowledge Base** or **Graph** page
2. Click **"Add Fact"** or **"Create Fact"** button
3. Fill in:
   - Subject: `Albert Einstein`
   - Predicate: `developed`
   - Object: `Theory of Relativity`
4. Click **Save**

**Expected Result:**
- Fact appears in the knowledge base table
- Fact appears as a node in the graph visualization
- Backend terminal shows: `✅ POST /api/knowledge/facts: Added fact`

#### Test 2: View Knowledge Graph
1. Navigate to **Graph** page
2. You should see:
   - Nodes (entities/subjects)
   - Edges (relationships/predicates)
   - Interactive graph visualization

**Expected Result:**
- Graph displays with nodes and connections
- You can drag nodes around
- Clicking nodes shows details

#### Test 3: View Facts List
1. Navigate to **Knowledge Base** page
2. You should see a table with all facts

**Expected Result:**
- Table shows all added facts
- Columns: Subject, Predicate, Object, Source
- Can edit/delete facts

---

### ✅ 3. File Upload Tests

#### Test 1: Upload PDF File
1. Navigate to **Upload** or **Documents** page
2. Click **Upload** or drag-and-drop a PDF file
3. Wait for processing

**Expected Result:**
- File uploads successfully
- Backend processes the file
- Facts are extracted and added to knowledge graph
- Document appears in documents list
- Backend terminal shows extraction progress

#### Test 2: Upload DOCX File
1. Upload a Word document (.docx)
2. Check if text is extracted

**Expected Result:**
- Document processes successfully
- Facts extracted from document content

#### Test 3: Upload TXT File
1. Upload a plain text file
2. Verify content is processed

**Expected Result:**
- Text file processes successfully
- Facts extracted

---

### ✅ 4. Chat/Query Tests

#### Test 1: Ask About Knowledge Base
1. Navigate to **Chat** page
2. Type: `What facts do you know about Albert Einstein?`
3. Press Enter

**Expected Result:**
- Response mentions facts about Einstein
- Response references the knowledge graph
- Backend terminal shows chat request

#### Test 2: Query Specific Information
1. Ask: `Tell me about Theory of Relativity`
2. Verify response uses knowledge from graph

**Expected Result:**
- Response includes relevant facts
- Response is coherent and relevant

---

### ✅ 5. Import/Export Tests

#### Test 1: Export Knowledge
1. Navigate to **Import/Export** page
2. Click **Export** button
3. Save the JSON file

**Expected Result:**
- JSON file downloads
- File contains all facts in structured format
- File includes metadata (version, timestamp, etc.)

#### Test 2: Import Knowledge
1. On **Import/Export** page
2. Click **Import** or **Choose File**
3. Select the exported JSON file
4. Click **Import**

**Expected Result:**
- Facts are imported successfully
- Duplicate facts are skipped
- New facts are added
- Backend terminal shows import progress

---

### ✅ 6. Document Management Tests

#### Test 1: View Documents List
1. Navigate to **Documents** page
2. Check list of uploaded documents

**Expected Result:**
- Shows all uploaded documents
- Displays: name, size, type, facts extracted, upload date

#### Test 2: Delete Document
1. Click delete icon on a document
2. Confirm deletion

**Expected Result:**
- Document is removed from list
- Backend terminal shows deletion

---

### ✅ 7. Graph Visualization Tests

#### Test 1: Interactive Graph
1. Navigate to **Graph** page
2. Try these interactions:
   - Drag nodes around
   - Click on nodes (should show details)
   - Click on edges (should show relationship details)
   - Zoom in/out (if supported)

**Expected Result:**
- Graph is interactive
- Nodes can be moved
- Details display correctly

#### Test 2: Graph Updates
1. Add a new fact
2. Check if graph updates automatically

**Expected Result:**
- Graph refreshes with new node/edge
- New connections appear

---

## API Testing (Using Browser or curl)

### Test API Endpoints Directly

#### Get All Facts
```bash
curl http://localhost:8001/api/knowledge/facts
```

#### Add a Fact via API
```bash
curl -X POST http://localhost:8001/api/knowledge/facts \
  -H "Content-Type: application/json" \
  -d '{
    "subject": "Test Subject",
    "predicate": "is",
    "object": "a test",
    "source": "api_test"
  }'
```

#### Chat via API
```bash
curl -X POST http://localhost:8001/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "message": "What facts do you know?",
    "history": []
  }'
```

#### Upload File via API
```bash
curl -X POST http://localhost:8001/api/knowledge/upload \
  -F "files=@/path/to/your/file.pdf"
```

---

## Browser Developer Tools Testing

### Check Network Requests
1. Open browser DevTools (F12)
2. Go to **Network** tab
3. Perform actions in the app
4. Verify:
   - API requests are being made
   - Responses are successful (200 status)
   - No CORS errors
   - No 404 or 500 errors

### Check Console for Errors
1. Open browser DevTools (F12)
2. Go to **Console** tab
3. Look for:
   - Red error messages
   - Warnings
   - API call logs (should see successful calls)

### Check Application State
1. Open browser DevTools (F12)
2. Go to **Application** or **Storage** tab
3. Check if data is being stored correctly

---

## Common Issues & Solutions

### Issue: Frontend can't connect to backend
**Solution:**
- Verify backend is running on port 8001
- Check browser console for CORS errors
- Verify `VITE_API_URL` is not set incorrectly

### Issue: File upload fails
**Solution:**
- Check backend terminal for errors
- Verify file size is reasonable
- Check file format is supported (PDF, DOCX, TXT, CSV)

### Issue: Facts not appearing
**Solution:**
- Check backend terminal for processing errors
- Verify facts were actually added (check API response)
- Refresh the frontend page
- Check browser console for errors

### Issue: Graph not displaying
**Solution:**
- Check if facts exist in knowledge base
- Check browser console for JavaScript errors
- Verify D3.js/graph libraries loaded correctly

---

## Performance Testing

### Test with Large Dataset
1. Import a large JSON file with many facts
2. Verify:
   - Import completes successfully
   - Graph renders (may take time)
   - UI remains responsive
   - No memory errors

### Test File Processing Speed
1. Upload a large PDF (10+ pages)
2. Monitor:
   - Processing time
   - Facts extracted
   - Memory usage (check backend terminal)

---

## Integration Testing Checklist

- [ ] Backend starts successfully
- [ ] Frontend starts successfully
- [ ] Frontend connects to backend
- [ ] Can add facts manually
- [ ] Can upload files
- [ ] Facts appear in knowledge base
- [ ] Graph visualization works
- [ ] Chat/query functionality works
- [ ] Import/export works
- [ ] Document management works
- [ ] No console errors
- [ ] No backend errors
- [ ] API endpoints respond correctly

---

## Quick Test Script

Run this to verify basic functionality:

```bash
# Test backend health
echo "Testing backend health..."
curl -s http://localhost:8001/health | jq .

# Test adding a fact
echo "Testing fact creation..."
curl -s -X POST http://localhost:8001/api/knowledge/facts \
  -H "Content-Type: application/json" \
  -d '{"subject":"Test","predicate":"is","object":"working","source":"test"}' | jq .

# Test getting facts
echo "Testing fact retrieval..."
curl -s http://localhost:8001/api/knowledge/facts | jq '.facts | length'

echo "✅ Basic tests complete!"
```

---

## Next Steps After Testing

1. **If everything works:** Start using the app for your research!
2. **If issues found:** Check error messages in:
   - Backend terminal
   - Frontend terminal
   - Browser console
   - Browser network tab

3. **Report issues:** Note down:
   - What you were trying to do
   - What happened vs. what you expected
   - Error messages
   - Steps to reproduce

---

**Happy Testing! 🚀**

