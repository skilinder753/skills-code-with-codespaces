#!/bin/bash

# Detiene el script si ocurre un error
set -e

# Verifica si el script se ejecuta como superusuario
if [ "$(id -u)" != "0" ]; then
   echo "Este script debe ser ejecutado como root" 1>&2
   exit 1
fi

# Actualiza e instala en un solo paso
sudo apt-get update && sudo apt-get install -y sl

# Exporta la ruta para incluir /usr/games, si no está ya incluida
if [[ ":$PATH:" != *":/usr/games:"* ]]; then
    export PATH=$PATH:/usr/games
fi