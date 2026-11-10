from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"service": "market-service", "status": "ok"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/listings")
def listings(crop: str = None):
    data = [
        {"farmer_name": "Agnes Farm", "crop": "Tomatoes", "quantity": 500, "price": 2.30, "location": "Central"},
        {"farmer_name": "Green Harvest", "crop": "Maize", "quantity": 1000, "price": 1.75, "location": "Eastern"}
    ]
    if crop:
        data = [d for d in data if d["crop"].lower() == crop.lower()]
    return {"status": "success", "listings": data}

@app.get("/processing/{crop}")
def processing(crop: str):
    return {
        "status": "success",
        "crop": crop,
        "suggestions": {
            "market_price": 2.00,
            "demand": "High",
            "products": [
                {"name": f"Processed {crop}", "process": "Clean → Process → Package", "profit_multiplier": 2.0, "investment": "Medium"}
            ]
        }
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8004)
