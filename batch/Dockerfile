FROM python:3.8

# Copy the python script into the container
COPY app/square.py /app

# Set the working directory
WORKDIR /app

# Run the Python script when the container starts
CMD [ "python", "square.py", "3"]