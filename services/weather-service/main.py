from fastapi import FastAPI
from datetime import datetime, timedelta
import random

app = FastAPI()

@app.get("/")
def root():
    return {"service": "weather-service", "status": "ok"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/forecast/{location}")
def forecast(location: str):
    today = datetime.now()
    days = []
    for i in range(7):
        d = today + timedelta(days=i)
        days.append({
            "date": d.strftime("%Y-%m-%d"),
            "day": d.strftime("%A"),
            "weather": random.choice(["Sunny", "Cloudy", "Rainy"]),
            "temperature": random.randint(18, 35),
            "humidity": random.randint(40, 90),
            "rainfall": random.choice([0, 2, 5, 10]),
            "wind_speed": random.randint(5, 25)
        })
    return {
        "status": "success",
        "data": {
            "location": location,
            "forecast": days,
            "summary": "Favorable weather for farming",
            "source": "Simulated"
        }
    }

@app.get("/advice/{location}")
def advice(location: str):
    return {
        "status": "success",
        "location": location,
        "advice": ["Monitor weather daily", "Plan irrigation", "Protect crops from extremes"],
        "summary": "Good farming conditions"
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8005)
