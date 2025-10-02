#!/bin/bash

# Colors
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Step 1
echo -e "${YELLOW}[1/8] Updating system...${NC}"
apt update -y > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && apt-get update -y > /dev/null 2>&1
echo -e "${GREEN}✅ System updated.${NC}"

# Step 2
echo -e "${YELLOW}[2/8] Installing required packages...${NC}"
apt-get install -y curl socat git > /dev/null 2>&1
echo -e "${GREEN}✅ Required packages installed.${NC}"

# Step 3
echo -e "${YELLOW}[3/8] Installing Docker...${NC}"
curl -fsSL https://get.docker.com | sh > /dev/null 2>&1
echo -e "${GREEN}✅ Docker installed.${NC}"

# Step 4
echo -e "${YELLOW}[4/8] Cloning Marzban-node repository...${NC}"
git clone https://github.com/Gozargah/Marzban-node ~/Marzban-node > /dev/null 2>&1
echo -e "${GREEN}✅ Repository cloned.${NC}"

# Step 5
echo -e "${YELLOW}[5/8] Creating data directory...${NC}"
mkdir -p /var/lib/marzban-node > /dev/null 2>&1
cd ~/Marzban-node || exit
echo -e "${GREEN}✅ Data directory ready.${NC}"

# Step 6
echo -e "${YELLOW}[6/8] Creating docker-compose.yml...${NC}"
cat > docker-compose.yml <<EOL
services:
  marzban-node:
    image: gozargah/marzban-node:latest
    restart: always
    network_mode: host

    environment:
      SERVICE_PORT: 8810
      XRAY_API_PORT: 8811
      SSL_CLIENT_CERT_FILE: "/var/lib/marzban-node/ssl_client_cert.pem"

    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
EOL
echo -e "${GREEN}✅ docker-compose.yml created.${NC}"

# Step 7
echo -e "${YELLOW}[7/8] Waiting for Certificate input...${NC}"
echo -e "${CYAN}Please paste your Certificate content (from -----BEGIN CERTIFICATE----- to -----END CERTIFICATE-----).${NC}"
echo -e "${CYAN}When finished, press ENTER and then Ctrl+D.${NC}"
cat > /var/lib/marzban-node/ssl_client_cert.pem
echo -e "${GREEN}✅ Certificate saved.${NC}"

# Step 8
echo -e "${YELLOW}[8/8] Starting Docker Compose...${NC}"
docker compose up -d > /dev/null 2>&1
echo -e "${GREEN}✅ Docker Compose started.${NC}"

# Final message
echo -e "--------------------------------------------------"
echo -e " ${GREEN}🎉 Marzban Node installation completed successfully!${NC}"
echo -e " ${CYAN}📌 Config path:${NC} ~/Marzban-node/docker-compose.yml"
echo -e " ${CYAN}📌 Certificate path:${NC} /var/lib/marzban-node/ssl_client_cert.pem"
echo -e " ${CYAN}🚀 Container is running now!${NC}"
echo -e " ${CYAN}🔗 Service Port:${NC} 8810"
echo -e " ${CYAN}🔗 Xray API Port:${NC} 8811"
echo -e "--------------------------------------------------"
