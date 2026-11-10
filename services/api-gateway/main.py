from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import httpx

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message": "API Gateway running", "status": "ok"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/api/v1/recommend")
async def recommend(data: dict):
    async with httpx.AsyncClient() as client:
        r = await client.post("http://127.0.0.1:8002/recommend", json=data, timeout=30.0)
        return r.json()

@app.post("/api/v1/detect-disease")
async def detect(file: bytes):
    async with httpx.AsyncClient() as client:
        r = await client.post("http://127.0.0.1:8003/detect", files={"file": file}, timeout=30.0)
        return r.json()

@app.get("/api/v1/weather/{location}")
async def weather(location: str):
    async with httpx.AsyncClient() as client:
        r = await client.get(f"http://127.0.0.1:8005/forecast/{location}", timeout=10.0)
        return r.json()

@app.get("/api/v1/market/listings")
async def listings(crop: str = None):
    async with httpx.AsyncClient() as client:
        params = {"crop": crop} if crop else {}
        r = await client.get("http://127.0.0.1:8004/listings", params=params, timeout=10.0)
        return r.json()

@app.get("/api/v1/process-suggestion/{crop}")
async def process(crop: str):
    async with httpx.AsyncClient() as client:
        r = await client.get(f"http://127.0.0.1:8004/processing/{crop}", timeout=10.0)
        return r.json()

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
