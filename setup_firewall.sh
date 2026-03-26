#!/bin/bash

# --- Script de Configuración de Firewall Básico ---
# Objetivo: Asegurar el servidor permitiendo solo tráfico esencial.

echo "Iniciando configuración del firewall..."

# 1. Asegurar que UFW esté instalado
sudo apt update && sudo apt install ufw -y

# 2. Configurar políticas por defecto (Denegar todo lo entrante)
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Abrir puertos específicos
sudo ufw allow 22/tcp   # SSH: Para administración remota
sudo ufw allow 80/tcp   # HTTP: Para el servidor web

# 4. Activar el firewall sin pedir confirmación manual
sudo ufw --force enable

# 5. Mostrar el resultado final
sudo ufw status verbose

echo "¡Configuración completada con éxito!"