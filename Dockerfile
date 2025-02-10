# Step 1: Use an official Python image to install dependencies
FROM python:3.12-slim as build

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy the application files
COPY . /app/

# Step 4: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Set up Nginx and install it
FROM nginx:latest

# Step 6: Copy the Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Step 7: Copy the FastAPI app and dependencies from the build stage
COPY --from=build /app /app

# Step 8: Expose port 80 for Nginx
EXPOSE 80

# Step 9: Start Nginx and FastAPI
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 & nginx -g 'daemon off;'"]
