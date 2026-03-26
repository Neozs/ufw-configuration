# 🛡️ Linux Network Security: UFW Firewall Configuration

Este proyecto demuestra la implementación de un firewall robusto en un entorno Linux (Ubuntu/WSL2) utilizando **UFW (Uncomplicated Firewall)**. El objetivo principal es aplicar el **Principio de Privilegio Mínimo**, reduciendo la superficie de ataque al cerrar todos los puertos innecesarios y permitiendo únicamente el tráfico esencial para un servidor web.

---

## 🎯 Objetivos
*   **Política de Denegación por Defecto:** Configurar `Default Deny` para todo el tráfico entrante.
*   **Acceso Seguro:** Habilitar de forma selectiva el puerto **22 (SSH)**.
*   **Servicios Web:** Permitir tráfico entrante en el puerto **80 (HTTP)**.
*   **Automatización:** Implementar el despliegue mediante un script de Bash para asegurar la repetibilidad.

## 🛠️ Tecnologías Utilizadas
*   **Sistema Operativo:** Ubuntu 22.04 LTS (vía WSL2).
*   **Firewall:** UFW (Uncomplicated Firewall).
*   **Servidor de Prueba:** Nginx.
*   **Lenguaje:** Bash Scripting.

---

## 🚀 Instalación y Uso

1. **Clonar el repositorio:**

   git clone [https://github.com/Neozs/ufw-configuration.git](https://github.com/Neozs/ufw-configuration.git)
   cd ufw-configuration

2. **chmod +x setup_firewall.sh**
3. **sudo ./setup_firewall.sh**
4. **sudo ufw status verbose**

## 🧠 Lecciones Aprendidas y Desafíos (Caso WSL2)
Durante el desarrollo de este proyecto, se identificó un comportamiento particular en el entorno Windows Subsystem for Linux (WSL2):

El Problema del Localhost: Al probar el firewall desde el navegador de Windows usando localhost, el tráfico omitía las reglas de UFW. Esto se debe a que WSL2 y Windows comparten un switch virtual que optimiza las conexiones locales.

## La Solución 
Para validar el firewall, fue necesario realizar las peticiones a la IP específica de la interfaz de red de Linux (eth0). Al usar la IP 172.x.x.x, el firewall interceptó correctamente los paquetes, resultando en un Connection Timed Out, validando así la efectividad de la seguridad.

📊 Verificación de Logs
Para auditar los intentos de conexión bloqueados, se activó el logging de UFW:

1. **sudo ufw logging on**
2. **sudo tail -f /var/log/syslog | grep -i ufw**