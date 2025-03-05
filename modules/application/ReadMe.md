## **Endpoints**
The FastAPI application exposes the following endpoints:

### **Basic Endpoints**
- `/` → **Hello World** – Returns a simple greeting message.

### **Performance Testing Endpoints**
- `/slow` → **Fixed 2-second delay** – Simulates a slow request by introducing a fixed sleep time.
- `/random-delay` → **Random delay (0.5 - 3 seconds)** – Introduces a random sleep time for performance testing.
- `/fast` → **Fast Response** – Instantly returns a response with no delay.

### **Computation & Resource-Intensive Endpoints**
- `/cpu-intensive` → **Simulated CPU-Intensive Task** – Performs a heavy computational task (sum of squares) to test CPU performance.
- `/io-wait` → **Simulated I/O Wait** – Introduces a fixed 5-second sleep to mimic I/O latency.

### **Usage**
To test the endpoints, you can use `curl`:

```sh
# Basic "Hello World"
curl http://<load-balancer-ip>:8000/

# Simulate slow responses
curl http://<load-balancer-ip>:8000/slow
curl http://<load-balancer-ip>:8000/random-delay

# Performance-heavy endpoints
curl http://<load-balancer-ip>:8000/cpu-intensive
curl http://<load-balancer-ip>:8000/io-wait
```
