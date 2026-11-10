from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class FarmData(BaseModel):
    location: str
    soil_type: str
    water_availability: str
    season: str

@app.get("/")
def root():
    return {"service": "crop-service", "status": "ok"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/recommend")
def recommend(farm: FarmData):
    crops = [
        {"crop": "Maize", "suitability": "High", "description": "Staple crop", "match_reasons": ["Good soil", "Good water"]},
        {"crop": "Tomatoes", "suitability": "High", "description": "Cash crop", "match_reasons": ["Good soil", "Good season"]},
        {"crop": "Beans", "suitability": "Medium", "description": "Nitrogen fixing", "match_reasons": ["Good soil"]},
        {"crop": "Cassava", "suitability": "Medium", "description": "Drought tolerant", "match_reasons": ["Good water"]},
    ]
    return {"status": "success", "farm_data": farm.dict(), "recommendations": crops}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8002)
