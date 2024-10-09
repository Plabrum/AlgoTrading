# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install Poetry and dependencies
RUN pip install poetry

# Copy project files to the working directory
COPY pyproject.toml poetry.lock /app/
RUN poetry install --no-dev --no-interaction --no-ansi

# Copy the rest of the project files
COPY . /app

# Expose port 8000 to the outside world
EXPOSE 8000

# Command to run the app using Uvicorn
CMD ["poetry", "run", "uvicorn", "my_project.app:app", "--host", "0.0.0.0", "--port", "8000"]
