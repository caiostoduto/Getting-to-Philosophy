# Getting to Philosophy - Wikipedia Analysis

![Docker](https://img.shields.io/badge/Docker-27.1.1-blue)
![Python](https://img.shields.io/badge/Python-3.11.6%2B-green)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

This project investigates the "Getting to Philosophy" phenomenon using a Wikipedia data dump. The analysis is performed in a series of Jupyter notebooks, running within a Docker container based on the `jupyter/datascience-notebook:latest` image.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Notebooks Overview](#notebooks-overview)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Automated Data Processing**: Handles downloading, processing, and analyzing Wikipedia dumps.
- **Modular Analysis**: Organized into four distinct Jupyter notebooks for clarity and modularity.
- **Persistent Data Storage**: Uses Docker volumes to ensure data persistence even if the container is stopped.
- **Efficient Data Handling**: Utilizes Pandas and Parquet for optimal performance with large datasets.
- **Customizable Analysis**: Allows for analysis considering either only the first reference or all references of each page.

## Project Structure

```plaintext
getting-to-philosophy/
│
├── Dockerfile                 # Instructions for building the Docker image
├── requirements.txt           # Python dependencies
├── notebooks/                 # Jupyter notebooks for each step of the analysis
│   ├── 1_Select_Dump.ipynb    # Download and extract Wikipedia dump
│   ├── 2_Process_Dump.ipynb   # Extract and process each Wikipedia page
│   ├── 3_Clear_Data.ipynb     # Filter and clean data
│   ├── 4_Compute_Data.ipynb   # Compute redirects and perform analysis
│
├── jupyter-config/            # Jupyter config files (persistent storage)
├── jupyter-data/              # Jupyter data (persistent storage)
├── multistream/               # Wikipedia multistream XML files
└── output/                    # Final .parquet files from the analysis
```

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/) installed on your machine.

## Installation

1. **Clone the repository**:

```bash
git clone https://github.com/yourusername/getting-to-philosophy.git
cd getting-to-philosophy
```

2. **Start the Docker container using Docker Compose**:

```bash
docker compose up -d
```

3. **Get the Jupyter Notebook token**:

```bash
docker exec -it getting-to-philosophy jupyter notebook list
```

4. **Access Jupyter Notebook**:
Open your browser and go to http://localhost:8888. You should see the Jupyter Notebook interface.

## Usage

- **Running Notebooks**: Navigate to the **notebooks/** directory in Jupyter and execute the notebooks in order:
    1. 1_Select_Dump.ipynb
    2. 2_Process_Dump.ipynb
    3. 3_Clear_Data.ipynb
    4. 4_Compute_Data.ipynb

- **Persistent Data**: Data, Jupyter configurations, and outputs are saved in the respective directories (`jupyter-config`, `jupyter-data`, `multistream`, `output`), ensuring they persist even if the Docker container is stopped.

- **Stopping the Container**: You can stop the Docker container using Docker Compose:
```bash
docker compose down
```

## Notebooks Overview

1. **Select_Dump.ipynb**: Downloads the Wikipedia dump, verifies its integrity using SHA1, and extracts the `-pages-articles-multistream.xml.bz2` file.

2. **Process_Dump.ipynb**: Processes the extracted dump, parsing each page and its redirects.

3. **Clear_Data.ipynb**: Filters the processed data to include only valid entries (`namespace == 0`) and valid redirects.

4. **Compute_Data.ipynb**: Performs the final analysis, computing redirects and summarizing the "Getting to Philosophy" phenomenon.

## Results

The "4. Compute Data" notebook provides insights into the structure of Wikipedia page references. Here are some key findings:

- **Degree Series**: Shows the number of pages at each degree of separation from the starting page.
- **Mean Distance**: The weighted average number of clicks to reach the target page.
- **Total Nodes**: The total number of pages connected to the starting page, and the percentage of total Wikipedia pages this represents.
- **Diameter**: The maximum number of clicks needed to reach the farthest connected page.

Example results for the Portuguese Wikipedia (starting from "Filosofia"):

```
Degree Series: [386, 1102, 1090, 3039, 6954, 9894, 46271, 19748, 20979, 15232, 27173, 27683, 24657, 17524, 12703, 9222, 6269, 4558, 4019, 1777, 965, 418, 207, 82, 16, 1, 0]
Mean Distance: 10.72 nodes
Total Nodes: 261969 (13.75%)
Diameter: 26 nodes
First Reference: True
```

These results demonstrate the interconnectedness of Wikipedia pages and provide insights into the "Getting to Philosophy" phenomenon.

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue to discuss improvements, bug fixes, or new features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
