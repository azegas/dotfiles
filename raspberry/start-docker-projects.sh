#!/bin/bash

cd /home/arvydas/GIT/monitoring && /usr/bin/docker compose up -d
cd /home/arvydas/GIT/QUOTES.WEB && /usr/bin/docker compose -f docker-compose-pi.yml up --build -d
cd /home/arvydas/GIT/QUOTES.API&& /usr/bin/docker compose -f docker-compose-pi.yml up --build -d

echo "All Docker projects started."
