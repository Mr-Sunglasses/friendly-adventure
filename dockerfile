# Use the official Python base image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code into the container
COPY . .

# Expose the port that the Django development server will run on
EXPOSE 8000

# Run migrations and start the Django development server
CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000
