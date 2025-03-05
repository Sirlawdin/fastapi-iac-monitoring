# Use official Python image as base
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy application files
COPY main.py .
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables for Datadog APM
ENV DD_SERVICE="fastapi-tracing"
ENV DD_ENV="production"
ENV DD_AGENT_HOST="datadog-agent"
ENV DD_TRACE_DEBUG="true"

# Expose port 8000
EXPOSE 8000

# Run the FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
