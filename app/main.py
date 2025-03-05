from fastapi import FastAPI
import time
import random
from ddtrace import tracer

app = FastAPI()

@tracer.wrap()
@app.get("/")
def hello():
    return {"message": "Hello, World!"}

@tracer.wrap()
@app.get("/slow")
def slow_function():
    time.sleep(2)
    return {"message": "This function is slow!"}

@tracer.wrap()
@app.get("/random-delay")
def random_delay():
    delay = random.uniform(0.5, 3.0)  # Random delay between 0.5 to 3 seconds
    time.sleep(delay)
    return {"message": f"This function took {delay:.2f} seconds!"}

@tracer.wrap()
@app.get("/fast")
def fast_function():
    return {"message": "This function is fast!"}

@tracer.wrap()
@app.get("/cpu-intensive")
def cpu_intensive():
    start_time = time.time()
    total = sum(i * i for i in range(10**6))  # Simulating CPU work
    elapsed_time = time.time() - start_time
    return {"message": f"CPU-intensive task took {elapsed_time:.2f} seconds!"}

@tracer.wrap()
@app.get("/io-wait")
def io_wait():
    time.sleep(5)  # Simulating an I/O wait
    return {"message": "This function simulated an I/O wait!"}
