# Guía de Instalación de Docker y  Nvidia-Docker

En este documento se presenta la guía de instalación de Docker y Nvidia-Docker para la realización de las prácticas de la asignatura Tecnologías y Arquitecturas Robóticas del Grado en Ingeniería Informática. 

En este caso la instalación estará detallada para Ubuntu 24.04 LTS.


## Instalación de Visual Studio Code

Para poder programar/editar cualquier código fuente que vamos a usar en las prácticas es necesario tener un IDE, en este caso se recomienda la instalación de Visual Studio Code. 

Visual Studio Code (VS Code) de Microsoft es una de las principales opciones entre los desarrolladores en cuanto a editores de código. Es conocido por su versatilidad, su compatibilidad con muchos lenguajes de programación y su capacidad para ampliarse con muchas herramientas útiles que hacen la vida del desarrollador mucho más fácil y productiva.

En este caso, también nos va servir para poder conectarnos a los contenedores de `Docker` que generaremos con las imágenes de ROS y ROS 2, de esta forma, se podrá trabajar de forma directa sobre ellos, pudiendo exprimir todas las ventajas y herramientas en el espacio de trabajo que se va a generar.

### Paso 1: Instalar los prerequisitos

Antes de comenzar la instalación, debemos instalar algunos paquetes que será necesario que estén disponibles en nuestro sistema Ubuntu 24.04 para los siguientes pasos.

Para ello, abre una terminal y escribe los siguientes comandos para actualizar la base de paquetes e instalar los requisitos previos:

```bash
sudo apt update
sudo apt install wget gpg apt-transport-https
```
### Paso 2: Importar la clave GPG de Microsoft

Para asegurarnos de que los paquetes que recibimos para instalar Visual Studio Code son auténticos, debemos descargar e importar las claves GPG firmadas por Microsoft en nuestro sistema Ubuntu 24.04.

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
```
Observa que ninguno de los comandos genera salida.

### Paso 3: Añadir el repositorio de código de Microsoft Visual Studio

Después de importar las claves GPG de Microsoft, añadiremos el repositorio oficial de Visual Studio Code a nuestro sistema Ubuntu 24.04. Si se lanza una nueva versión, el paquete de actualización estará disponible con el resto de las actualizaciones regulares de tu sistema.

```bash
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
```

A continuación, puedes eliminar de forma segura la clave GPG descargada, que ya ha sido importada a su sistema.

```bash
rm packages.microsoft.gpg
```

### Paso 4: Ejecutar la actualización del sistema

Antes de proceder con la instalación de VS Code en nuestro sistema Ubuntu 24.04, debemos actualizar la lista de paquetes disponibles. Por lo tanto, ejecuta el siguiente comando para actualizar el índice de repositorios de software de Ubuntu.

```bash
sudo apt update
```

Como puede ver en el resultado de la terminal, el repositorio de Microsoft ya está disponible en su sistema y listo para ser utilizado.

### Paso 5: Instalar VS Code en Ubuntu 24.04 LTS

Todo está ya preparado para la instalación propiamente dicha. Para instalar VS Code en su sistema Ubuntu 24.04 LTS (Noble Numbat), ejecuta el siguiente comando y espera a que se complete la instalación.

```bash
sudo apt install code
```

### Paso 6: Ejecutar Visual Studio Code en Ubuntu 24.04
En una terminal ejecuta:
```bash
code
```
Y ya se nos abrirá la aplicación de Visual Studio Code.

### Paso 7: Instalación de Extensiones
Para poder acceder a los contenedores que generaremos con Docker, es necesario instalar algunas Extensiones de Visual Studio. Para ello, iremos a la pestaña de extensiones de VS Code e instalaremos las extensiones de `Docker` y `Dev Containers`.

## Instalación de Docker

Antes de instalar el motor Docker, debe desinstalar cualquier paquete conflictivo.

Su distribución de Linux puede proporcionar paquetes Docker no oficiales, que pueden entrar en conflicto con los paquetes oficiales proporcionados por Docker. Debe desinstalar estos paquetes antes de instalar la versión oficial de `Docker Engine`.

Los paquetes no oficiales a desinstalar son:

- docker.io
- docker-compose
- docker-compose-v2
- docker-doc
- podman-docker

Además, `Docker Engine` depende de `containerd` y `runc`. `Docker Engine` agrupa estas dependencias en un único paquete: `containerd.io`. Si has instalado `containerd` o `runc` previamente, desinstálalos para evitar conflictos con las versiones incluidas en `Docker Engine`.

Ejecuta el siguiente comando para desinstalar todos los paquetes en conflicto:

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

`apt-get` podría informar de que no tiene ninguno de estos paquetes instalados.

Las imágenes, contenedores, volúmenes y redes almacenados en `/var/lib/docker/` no se eliminan automáticamente al desinstalar Docker. Si quieres empezar con una instalación limpia, y prefieres limpiar cualquier dato existente, lee la sección de [desinstalación del motor Docker](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine), este paso puede ser recomendable para evitar futuros conflictos, sin emabrgo, si es la primera vez que instalas Docker no deberías tener ningún problema. 

### Métodos de instalación
Puedes instalar `Docker Engine` de diferentes maneras, dependiendo de tus necesidades:

- `Docker Engine` viene incluido con [Docker Desktop para Linux](https://docs.docker.com/desktop/setup/install/linux/). Esta es la forma más fácil y rápida de empezar.

- Configurar e instalar `Docker Engine` desde el [repositorio `apt` de Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

- [Instálalo manualmente](https://docs.docker.com/engine/install/ubuntu/#install-from-a-package) y gestiona las actualizaciones manualmente.

- Utilice un [script de conveniencia](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script). Sólo se recomienda para entornos de pruebas y desarrollo.

En este caso se ha optado por instalar mediante el repositorio `apt`, si desea usar otro método de instalación puede redirigirse mediante los enlaces anteriores.

#### Instalar utilizando el repositorio `apt`
Antes de instalar `Docker Engine` por primera vez en un nuevo equipo host, es necesario configurar el repositorio apt de Docker. Después, puedes instalar y actualizar Docker desde el repositorio.

1. Configurar el repositorio `apt` de Docker.

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Instala los paquetes Docker.

Para instalar la última versión, ejecuta:
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Para instalar la una versión específica, ejecuta (**OPCIONAL**: Solo si necesitas una versión en específico para tu sistema):
```bash
# List the available versions:
apt-cache madison docker-ce | awk '{ print $3 }'

5:27.5.0-1~ubuntu.24.04~noble
5:27.4.1-1~ubuntu.24.04~noble
...
```

Selecciona la versión deseada e instálala:
```bash
VERSION_STRING=5:27.5.0-1~ubuntu.24.04~noble
sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Comprueba que la instalación se ha realizado correctamente ejecutando la imagen `hello-world`:

```bash
sudo docker run hello-world
```

Este comando descarga una imagen de prueba y la ejecuta en un contenedor. Cuando el contenedor se ejecuta, imprime un mensaje de confirmación y sale.

Ahora ha instalado e iniciado correctamente `Docker Engine`.

### Administrar Docker como usuario no root
El daemon Docker se enlaza a un socket Unix, no a un puerto TCP. Por defecto es el usuario `root` el que posee el socket Unix, y otros usuarios sólo pueden acceder a él usando `sudo`. El daemon Docker siempre se ejecuta como usuario `root`.

Si no quieres preceder el comando `docker` con `sudo`, crea un grupo Unix llamado `docker` y añade usuarios a él. Cuando el daemon Docker se inicia, crea un socket Unix accesible por los miembros del grupo `docker`. En algunas distribuciones de Linux, el sistema crea automáticamente este grupo cuando se instala el motor Docker utilizando un gestor de paquetes. En ese caso, no es necesario que crees manualmente el grupo.

Para crear el grupo docker y añadir tu usuario:

1. Crear el grupo `docker`:
```bash
sudo groupadd docker
```

2. Añade tu usuario al grupo `docker`.
```bash
sudo usermod -aG docker $USER
```

3. Cierra la sesión y vuelve a iniciarla para que se vuelva a evaluar su pertenencia al grupo.

También puedes ejecutar el siguiente comando para activar los cambios en los grupos:
```bash
newgrp docker
```

4. Verifiqua que puede ejecutar comandos `docker` sin `sudo`.
```bash
docker run hello-world
```

Este comando descarga una imagen de prueba y la ejecuta en un contenedor. Cuando el contenedor se ejecuta, imprime un mensaje y sale.

Si inicialmente ejecutaste comandos CLI de Docker utilizando `sudo` antes de agregar su usuario al grupo `docker`, es posible ver el siguiente error:
```
WARNING: Error loading config file: /home/user/.docker/config.json -
stat /home/user/.docker/config.json: permission denied
```

Este error indica que la configuración de permisos para el directorio `~/.docker/` es incorrecta, debido a haber utilizado el comando `sudo` anteriormente.

Para solucionar este problema, elimina el directorio `~/.docker/` (se vuelve a crear automáticamente, pero se pierde cualquier configuración personalizada) o cambia su propiedad y permisos mediante los siguientes comandos:

```bash
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
```

Aquí les dejamos una [cheet sheet](https://dockerlabs.collabnix.com/docker/cheatsheet/) de Docker para que se puedan familiarizar con los comandos.

## Instalación de NVIDIA-Docker
NVIDIA Container Toolkit permite crear y ejecutar contenedores acelerados en la GPU. El kit incluye una [biblioteca](https://github.com/NVIDIA/libnvidia-container) de ejecución de contenedores y utilidades para configurar automáticamente los contenedores de forma que aprovechen las GPU NVIDIA.

![](./images/nvidia-docker.png)

### Requisitos
NVIDIA recomienda instalar el controlador utilizando el gestor de paquetes de tu distribución.

Para ello sencillamente iremos al gestor de *Software & Updates* de Ubuntu e iremos a la pestaña de *Additional Drivers* y seleccionaremos la opción más actualizada para nuestra GPU como se indica en la siguiente imagen:

![](./images/nvidia-drivers.png)

Una vez seleccionado, simplemente habrá que aplicar los cambios y reiniciar el sistema. Para comprobar que la instalación ha funcionado correctamente, en una terminal ejecuta:
```bash
nvidia-smi
```

El resultado debería ser el siguiente:

![](./images/nvidia-smi.png)

Para obtener información sobre cómo instalar el controlador con un gestor de paquetes, consulta la [Guía de instalación rápida de controladores NVIDIA](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html).

También puedes instalar el controlador descargando un instalador `.run`. Consulta la página de [controladores oficiales de NVIDIA](https://www.nvidia.com/Download/index.aspx?lang=en-us).


### Instalación usando `Apt`
1. Configura el repositorio de producción:
```bash
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

Opcionalmente, configura el repositorio para utilizar paquetes experimentales (**ESTE PASO NO ES OBLIGATORIO** solo si quieres probar paquetes experimentales):
```bash
sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

2. Actualiza la lista de paquetes del repositorio:
```bash
sudo apt-get update
```

3. Instala los paquetes NVIDIA Container Toolkit:
```bash
sudo apt-get install -y nvidia-container-toolkit
```

### Configuración Docker
1. Configura el tiempo de ejecución del contenedor mediante el comando `nvidia-ctk`:
```bash
sudo nvidia-ctk runtime configure --runtime=docker
```
El comando `nvidia-ctk` modifica el archivo `/etc/docker/daemon.json` en el host. El archivo se actualiza para que Docker pueda utilizar NVIDIA Container Runtime.

2. Reinicia el daemon Docker:
```bash
sudo systemctl restart docker
```
### Ejecución de una carga de trabajo de ejemplo con Docker
Después de instalar y configurar el kit de herramientas e instalar un controlador de GPU NVIDIA, puedes verificar la instalación ejecutando una carga de trabajo de muestra.

Ejecuta un contenedor con CUDA:
```bash
sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```

El resultado debería parecerse al siguiente
![](./images/nvidia-docker-output.png)

Ya tendriamos todo lo necesario instalado para poder comenzar a usar ROS y ROS2 con Docker. Para finalizar es necesario hacer un reinicio del sistema para que todos los cambios se apliquen correctamente.
