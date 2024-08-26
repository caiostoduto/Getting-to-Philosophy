# Use the official Jupyter Data Science Notebook as a base image
FROM jupyter/datascience-notebook:latest

# Remove the default 'work' directory
RUN rm -rf /home/jovyan/work

# Create a new directory for scripts
RUN mkdir /tmp/scripts

# Copy requirements.txt and README.md into the container
COPY requirements.txt README.md /tmp/

# Copy scripts into the container
COPY scripts/* /tmp/scripts/

# Run script/md2ipynb.py to convert README.md to README.ipynb
RUN python /tmp/scripts/md2ipynb.py /tmp/README.md /home/jovyan/README.ipynb

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt
