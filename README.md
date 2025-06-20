# guac-web-isolation

# 🛡️ Guacamole Web Isolation

A lightweight web isolation solution using Apache Guacamole and Docker. Users access a remote browser running in a containerized environment via a secure HTML5 interface.

## 📦 Features

- Apache Guacamole (Remote Desktop Gateway)
- Isolated Firefox browser container (with VNC/Xfce)
- Docker-based deployment
- Automated connection registration via script

## 🚀 Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/guac-web-isolation.git
cd guac-web-isolation
docker-compose up -d
bash scripts/register_connection.sh