# Use the official Jupyter Data Science Notebook as a base image
FROM jupyter/datascience-notebook:latest

# Set environment variables
USER root

# Copy README.md into the container
COPY README.md /home/jovyan/

# Copy requirements.txt into the container
COPY requirements.txt /tmp/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# Switch back to the jovyan user
USER $NB_UID
