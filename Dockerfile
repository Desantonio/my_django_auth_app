# Example with tini integration
FROM python:3.10

# Install dependencies
WORKDIR /code
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Install tini
RUN apt-get update && apt-get install -y tini

# Copy project files
COPY . .

# Make entrypoint executable if using entrypoint.sh
RUN chmod +x entrypoint.sh

# Use tini as entrypoint for robust signal handling
ENTRYPOINT ["/usr/bin/tini", "--"]

# Command to run
CMD ["gunicorn", "auth_project.wsgi:application", "--bind", "0.0.0.0:8000"]
