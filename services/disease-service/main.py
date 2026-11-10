from fastapi import FastAPI, File, UploadFile
import random

app = FastAPI()

@app.get("/")
def root():
    return {"service": "disease-service", "status": "ok"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/detect")
async def detect(file: UploadFile = File(...)):
    content = await file.read()
    
    if len(content) == 0:
        return {"status": "error", "message": "Empty file", "result": {"disease": "Unknown", "confidence": 0, "severity": "Unknown", "advice": "Try again"}}
    
    diseases = [
        {"disease": "Healthy", "confidence": 92, "severity": "None", "advice": "Crop looks healthy"},
        {"disease": "Leaf Spot", "confidence": 85, "severity": "Low", "advice": "Remove affected leaves"},
        {"disease": "Early Blight", "confidence": 78, "severity": "Medium", "advice": "Apply fungicide"},
        {"disease": "Late Blight", "confidence": 72, "severity": "High", "advice": "Act immediately"}
    ]
    
    result = random.choice(diseases)
    
    return {
        "status": "success",
        "filename": file.filename,
        "result": result
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8003)
