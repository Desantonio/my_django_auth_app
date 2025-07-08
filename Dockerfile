# Use official Python image
FROM python:3.10

# Set environment variables to prevent .pyc files and enable stdout/stderr immediately
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory inside the container
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy entire project into the container
COPY . /code/

# Expose Django's default port
EXPOSE 8000

# Run Django development server (for production use gunicorn)
ENTRYPOINT ["./entrypoint.sh"]

