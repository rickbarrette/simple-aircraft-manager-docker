# Simple Aircraft Manager (Docker)

This repository provides a streamlined **Docker Compose** configuration for deploying [simple-aircraft-manager](https://github.com/marbindrakon/simple-aircraft-manager).

It automates the environment setup, ensuring all dependencies are handled within isolated containers for a "plug-and-play" experience.

---

## 🚀 Getting Started

### 1\. Clone the Repository

Since this project relies on the core manager as a submodule, ensure you use the `--recursive` flag or initialize submodules after cloning.

Bash

```
git clone https://github.com/rickbarrette/simple-aircraft-manager-docker.git
cd simple-aircraft-manager-docker
git submodule update --init --recursive --remote
```

### 2\. Configuration

Before launching, review the `docker-compose.yml` file. You may need to adjust port mappings, volume paths, or environment variables to suit your local setup.

### 3\. Build and Launch

Run the following commands to build the images and start the containers in the background:

Bash

```
# Build the containers
docker compose build

# Start the application
docker compose up -d
```

---

## 🛠 Prerequisites

*   **Docker** (v20.10+)
    
*   **Docker Compose** (v2.0+)
    
*   **Git**
    

## 📂 Project Structure

*   `docker-compose.yml` – Defines the multi-container application.
    
*   `/simple-aircraft-manager` – Git submodule containing the application source code.
