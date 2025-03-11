# Práctica 1:  Aprendiendo las bases de ROS

ROS es una colección de software de código abierto destinado al desarrollo de robots, que ofrece características parecidas a las de un sistema operativo en un conjunto de ordenadores diverso. El objetivo principal de ROS es respaldar el reciclado de código en la investigación y el desarrollo de robótica como un instrumento autónomo del lenguaje y la plataforma. Actualmente, ROS solo se puede ejecutar en plataformas que utilizan Unix (Al menos las versiones de ROS 1, ROS 2 ya se puede integrar en IOS y Windows). En esta práctica, abordaremos algunas nociones fundamentales de ROS e interactuaremos con un sistema ROS en ejecución.

## Instalación
Para la realización de esta práctica y las sucesivas, se han generado varios `Dockerfile` que serán los encargados de generar las imágenes de ROS para poder trabajar con ellas. Esto nos va a permitir generar contenedores de `Docker` con dichas imágenes, de forma que, podamos tener todas las dependencias y librerías contenidas dentro de nuestro sistema operativo (Ubuntu 24.04 LTS), evitando así incompatibilidades con otras aplicaciones. 

Para poder trabajar con los contenedores de `Docker` y ROS es necesario antes de comenzar, realizar los pasos que se encuentran en el documento [Instalacion.md](Instalacion.md) dentro de este repositorio. Este documento contiene la guía de instalación con las herramientas necesarias para poder ejecutar las prácticas de la asignatura.

Para comenzar con la instalación de ROS dentro de un contenedor `Docker` se requiere abrir una terminal dentro de la carpeta que contenga esta práctica y ejecutar los siguientes comandos:

1. Crear y construir la imágen de ROS Noetic a través del `Dockerfile`:
```bash
docker build -t ros_noetic:latest .
```
Este comando comenzará la instalación de ROS en su Distro Noetic.

2. Una vez instalado ROS ya podemos ejecutar el contenedor y conectarnos a él de la siguiente manera **sin usar Nvidia-Docker**:
```bash
sudo chmod u+x run.sh # Solo la primera vez para dar los permisos necesarios
./run.sh 
```
Si tenemos `nvidia-docker` instalado, podemos hacer que ROS emplee la GPU de nuestro dispositivo. En ese caso ejecuta lo siguiente:
```bash
sudo chmod u+x run_nvidia.sh # Solo la primera vez para dar los permisos necesarios
./run_nvidia.sh 
```
Ya estaremos dentro del contenedor y podremos empezar a trabajar con ROS.

3. Para conectarnos al contenedor desde nuevas terminales una vez lanzado el contenedor, ejecutar:
```bash
sudo chmod u+x connect_ros.sh # Solo la primera vez para dar los permisos necesarios
./connect_ros.sh
```

## Parte 1: Primeros Pasos con ROS

### Creación del espacio de Trabajo en ROS
Cuando se trabaja con el código fuente de ROS, a menudo es útil hacerlo en un `workspace` (Espacio de trabajo). Para crear un espacio de trabajo ROS lo único que tenemos que hacer es navegar hasta el directorio en el que queramos crear el espacio de trabajo y ejecutar los comandos que aparecen a
continuación. Se recomienda crearlo en la carpeta raíz de nuestro espacio de trabajo en el contenedor de `Docker` y con el nombre `catkin_ws`, de la siguiente manera:
```bash
mkdir -p catkin_ws/src
cd catkin_ws/
catkin_make
```
El comando [catkin_make](https://wiki.ros.org/catkin/commands/catkin_make) es una herramienta práctica para trabajar con [espacios de trabajo catkin](https://wiki.ros.org/catkin/workspaces). Ejecutándolo la primera vez en tu espacio de trabajo, creará un enlace *CMakeLists.txt* en tu carpeta `src`.

Además, si miras en tu directorio actual ahora deberías tener una carpeta 'build' y 'devel'. Dentro de la carpeta 'devel' puedes ver que ahora hay varios archivos `setup.*sh`. Cualquiera de estos archivos se superpondrá a este espacio de trabajo en la parte superior de tu entorno. Para más información consulta la documentación general de [catkin](http://wiki.ros.org/catkin/Tutorials). Antes de continuar ejecuta tu nuevo archivo `setup.*sh`:

```bash
source devel/setup.bash
```

**IMPORTANTE**: Cada vez que entremos en el contenedor de ROS ya sea ejecutando `./run.sh` (o si usamos nvidia-docker `./run_nvidia.sh`) o si accedemos al contenedor, una vez lanzado por el script anterior, en nuevas terminales para ejecutar diferentes herramientas de ROS ejecutando `./connect_ros.sh`, necesitamos que nuestro sistema tenga conocimiento de las variables del entorno. Para evitar tener que ejecutar siempre los mismos comandos constantemente cada vez que iniciamos el contenedor o generamos una nueva terminal, debemos ejecutar lo siguiente:

1. Configurar el archivo `~/.bashrc` para que automáticamente establezca las variables de entorno en nuestro espacio de trabajo `catkin_ws`:
```bash
nano ~/.bashrc
```

2. Dentro de este archivo en la última línea escribiremos lo siguiente:
```bash
source /workspace/catkin_ws/devel/setup.bash
```

3. Guardaremos el archivo actualizado. No obstante, esto no asegura que cada vez que ejecutemos de nuevo el contenedor, esta actualización se haya guardado. Esto se debe a que el contenedor se resetea cada vez que se cierra para evitar actualizarse automáticamente y que pueda que haya incompatibilidades en algún momento con algún cambio que hagamos, de esta forma, si hay algo que hemos tocado que haga una incompatibilidad, con cerrar y volver a lanzar el contenedor sería suficiente. En este caso, sí que nos interesa que el cambio se mantenga, por tanto, abriremos una nueva terminal (sin haber salido y cerrado el contenedor) y ejecutaremos el siguiente comando:
```bash
docker commit ros_noetic ros_noetic:latest
```
Y ya estaría guardado para siempre. (**NOTA:** Esto sirve a nivel genérico como se ha explicado para hacer que el contenedor mantenga todos los cambios. En el caso de archivos que se van a generar para las prácticas, esto no es necesario porque los archivos que se generen estarán guardados en nuestro dispositivo local y no íntegramente en nuestro contenedor únicamente.)



Para asegurarte de que tu espacio de trabajo es superpuesto correctamente por el script de instalación, asegúrate de que la variable de entorno ROS_PACKAGE_PATH incluye el directorio en el que se encuentra.

```bash
echo $ROS_PACKAGE_PATH
```
La salida debería ser la siguiente:
```
/workspace/catkin_ws/src:/opt/ros/noetic/share
```

Para que los cambios se guarden correctamente, es necesario cerrar el contenedor y volver a lanzarlo.

### Ejemplo de un entorno de ROS
En esta primera parte nos vamos a servir de los tutoriales básicos que trae la instalación de ROS para entender el funcionamiento básico de `nodos` y `topics`. 
Para ello, vamos a seguir las siguientes instrucciones dentro del contenedor de `Docker` generado anteriormente:
- Terminal 1:
```bash
roscore #Lanzar el nodo master que gestiona la comunicación de ROS
```

- Terminal 2:
En esta terminal lanza el nodo `/talker`. Observa el mensaje que está publicando dicho nodo. A continuación, observa la  lista de nodos que existen en el entorno y estudia el entorno de ROS creado.
```bash
rosrun rospy_tutorials talker
```

Revisa la siguiente documentación ([ROS Nodes](https://wiki.ros.org/ROS/Tutorials/UnderstandingNodes), [ROS Topics](https://wiki.ros.org/ROS/Tutorials/UnderstandingTopics)) y responde a las siguientes preguntas:
> Pregunta 1: ¿Qué podemos saber de este nodo? (Suscriptores, topics)
>
> Pregunta 2: ¿Qué podemos saber sobre el topic que publica el nodo que acabamos de lanzar?

- Terminal 3:
El siguiente paso es crear un suscriptor al topic que está publicando en el nodo `/talker` (`/chatter`). Para ello lanzaremos otro nodo, el nodo `/listener`.
```bash
rosrun rospy_tutorials listener
```
> Pregunta 3: ¿Qué podemos saber sobre este nuevo nodo?
>
> Pregunta 4: ¿Qué ha sucedido ahora en el topic /chatter?

Dentro de ROS existen multitud de herramientas ya  implementadas para ayudarnos a conocer mejor el entorno en el que se está trabajando. Entre ellas se encuentra la herramienta [rqt](http://wiki.ros.org/rqt). Dentro de `rqt` tenemos otra herramienta que nos permite ver la interconexión entre los diferentes nodos, `rqt_graph`. Para lanzarla, solo tenemos que escribir en una nueva Terminal lo siguiente:

- Terminal 4: 
```bash
rqt_graph
```
Esto nos muestra un gráfico donde aparecen los nodos y los topics que están actualmente en el
entorno de ROS

> Pregunta 5: ¿Qué podemos saber a partir de este gráfico?

### Creando un Servicio en ROS
A continuación, se va a crear un servicio que nos va a sumar dos enteros. Para ello copia la carpeta `servicio_suma` en `~/catkin_ws/src`. Seguidamente, ejecuta `catkin_make` desde la terminal, dentro de la carpeta `~/catkin_ws`. De esta forma ya habremos creado el servicio que nos va a permitir sumar dos enteros. Ahora lanza el `rosmaster` y ejecuta los siguientes comandos en otras Terminales:

**NOTA:** Debes hacer que los archivos `add_two_ints_server.py` y `add_two_ints_client.py` sean ejecutables usando el comando `chmod u+x`.


- Terminal 2:
```bash
rossrv list
rossrv show servicio_suma/AddTwoInts
rosrun servicio_suma add_two_ints_server.py
```

- Terminal 3:
```bash
rosrun servicio_suma add_two_ints_client.py 3 7
```

> Pregunta 6: ¿Qué puedes comentar acerca de este servicio?

### Ejercicios
1. Publica desde la terminal un mensaje, con la cadena de caracteres que desees al topic `/chatter`, para que este sea leído por el nodo `/listener`. Escribe los comandos que has tenido que ejecutar para que esto suceda. Ten en cuenta que el nodo ROS master no está lanzado todavía.

2. Cambia el servicio `servicio_suma` para que haga la siguiente operación: `a + b - c * d / e`, siendo `a, b, c, d, e` valores enteros (`int64`) pasados por línea de comandos, el resultado debe estar en formato `float64`. Describe que has tenido que hacer y los archivos que has tenido que modificar.

## Parte 2: Primeros Pasos con ROS
Anteriormente se ha explicado cómo se crea un espacio de trabajo ROS. A continuación, el objetivo es aprender a generar paquetes ROS y crear mensajes para que otros nodos publiquen este tipo de mensajes. Asimismo, se explicará cómo crear archivos `*.launch`, los cuales permiten lanzar varios nodos a la vez. 

### Crear un Paquete de ROS
El software en ROS se organiza en paquetes. Un paquete puede contener nodos ROS, una biblioteca independiente de ROS, un conjunto de datos, archivos de configuración, una herramienta de software de terceros, o cualquier otra cosa que lógicamente constituya un módulo útil. El objetivo de estos paquetes es proporcionar esta funcionalidad útil de una manera fácil de consumir para que el software pueda ser fácilmente reutilizado. En general, los paquetes ROS siguen el principio de "Ricitos de oro": suficiente funcionalidad para ser útil, pero no demasiada para que el paquete sea pesado y difícil de usar desde otro software.

Los paquetes de ROS requieren de una serie de ficheros específicos para poder
realizar la compilación de dicho paquete. Para ello, se puede hacer a mano o emplear la herramienta `catkin_create_pkg`, que genera automáticamente toda esa estructura de paquete ROS. Este comando debe ser lanzado desde la carpeta `src/` del espacio de trabajo.
```bash
cd catkin_ws/src
catkin_create_pkg primer_paquete rospy std_msgs
```

Inicialmente, como se va a estar desarrollando código con `Python`, se ha generado este paquete mediante las dependencias `rospy`. Además, se ha añadido al paquete la dependencia a los mensajes estándares de ROS, `std_msgs`. A continuación, se va a compilar este paquete, aunque el paquete todavía esté vacío, mediante el siguiente comando. Este comando debe ser ejecutado desde alguna de las carpetas del espacio de trabajo, recomendablemente desde la raíz del espacio de trabajo `catkin_ws`:

```bash
catkin_make
```

> Pregunta 1: ¿Dónde se puede observar que el paquete realmente tiene como dependencias `rospy` y `std_msgs`?

### Crear un mensaje
Los nodos se comunican entre sí publicando [mensajes](https://wiki.ros.org/Messages) en los temas. Un mensaje es una estructura de datos simple, compuesta por campos tipificados. Se admiten tipos primitivos estándar (entero, coma flotante, booleano, etc.), así como matrices de tipos primitivos. Los mensajes pueden incluir estructuras y matrices anidadas de forma arbitraria (como los structs de C).

Para generar un mensaje es necsario crear una carpeta `msg/` dentro del paquete, la cual contendrá el archivo `miMensaje.msg` y dentro de este se definirá la estructura de datos del mensaje.

```bash
cd catkin_ws/src/primer_paquete
mkdir msg
cd msg/
touch miMensaje.msg
chmod u+x miMensaje.msg
```

Una vez creado el fichero para crear el mensaje, lo editamos para que el paquete mensaje tenga los siguientes valores: `int32 x`, `int32 y`, `string nombre=tuNombre` (En la variable `nombre` añade el tuyo). Tras modificar este fichero, debemos abrir el fichero `package.xml` del paquete y añadir las siguientes dependencias:
```xml
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>
```

A continuación, hay que abrir el fichero `CMakeLists.txt` del paquete y modificar, sin quitar lo que ya hay o quitando los comentarios correspondientes, las siguientes dependencias:
```
find_package(... REQUIRED COMPONENTS message_generation ...).
add_message_files(FILES miMensaje.msg)
generate_messages(DEPENDENCIES std_msgs)
catkin_package(... CATKIN_DEPENS message_runtime ...)
```

Una vez hechas estas modificaciones, el siguiente paso es volver a compilar el paquete mediante `catkin_make primer_paquete` (siempre en la raiz de `/catkin_ws/`), de esta forma si hay varios paquetes no perderemos tiempo recompilando el resto. Tras compilar correctamente el paquete, debemos actualizar las dependencias del espacio de trabajo ejecutando `source devel/setup.bash`. Si el mensaje ha sido creado correctamente, podremos saber de qué tipo es el mensaje creado a través de la terminal.

> Pregunta 2: ¿Qué comando se debe utilizar? (Pista: [rosmsg](https://wiki.ros.org/rosmsg))

Ahora ya se puede crear un nodo que publique en un topic información con el mensaje creado. Para ello, en la carpeta `src/` de nuestro paquete vamos a crear dos nodos, un publisher, llamado `/envío_miMensaje`, y un subscriber, llamado `/recibo_miMensaje`.

Para crear estos dos nodos, que vamos a desarrollar en Python, ejecutamos los siguientes comandos:

```bash
cd catkin_ws/src/primer_paquete/src
touch nodo_envia.py
touch nodo_recibe.py
chmod u+x nodo_envia.py
chmod u+x nodo_recibe
```

Y escribimos el siguiente código en cada uno de estos ficheros.

- `nodo_recibe.py`:
```python
#!/usr/bin/env python3
import rospy
from primer_paquete.msg import miMensaje

def callback(data):
    rospy.loginfo("Recibo: %s - x: %s; y: %s" % (data.nombre, data.x, data.y))

def nodo_recibe():
    rospy.init_node('nodo_recibe', anonymous=True)
    rospy.Subscriber("mi_topic", miMensaje, callback)
    rospy.spin()

if __name__ == '__main__':
    nodo_recibe()
```

- `nodo_envia.py`:
```python
#!/usr/bin/env python3
import rospy
from primer_paquete.msg import miMensaje

def nodo_envia():
    mensaje = miMensaje()
    mensaje.x = 0
    mensaje.y = 0

    pub = rospy.Publisher('/mi_topic', miMensaje, queue_size=10)
    rospy.init_node('nodo_envia', anonymous=True)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():

        mensaje.x += 1
        mensaje.y += 2
        envio_str = "Envio: %s - x: %s; y: %s" % (mensaje.nombre, mensaje.x, mensaje.y)
        rospy.loginfo(envio_str)
        pub.publish(mensaje)
        rate.sleep()

if __name__ == '__main__':
    try:
        nodo_envia()
    except rospy.ROSInterruptException:
        pass
```

Ahora solo nos queda hacer ejecutables estos ficheros, lanzar el ROSMaster (roscore) y lanzar cada nodo en una terminal diferente.

> Pregunta 3: Muestra el gráfico de entorno ROS generado, usando rqt_graph.
>
> Pregunta 4: Intenta modificar la constante nombre, del mensaje, modificando el código del nodo `/nodo_envia`. ¿Qué sucede?
>
> Pregunta 5: ¿De qué tipo es el topic que aparece?

### Crear un archivo launch
[`roslaunch`](http://wiki.ros.org/es/roslaunch) es una herramienta para lanzar fácilmente múltiples nodos ROS local y remotamente vía SSH, así como para establecer parámetros en el Servidor de Parámetros. Incluye opciones para reiniciar automáticamente los procesos que ya han muerto. `roslaunch` toma uno o más archivos de configuración XML (con la extensión .launch) que especifican los parámetros a establecer y los nodos a lanzar, así como las máquinas en las que se deben ejecutar.

Los nodos que se han lanzado anteriormente, han tenido que ser lanzados de forma independiente en terminales separadas. Sin embargo, los podemos lanzar a la vez simplemente generado un archivo `.launch`. Para ello, es necesario generar la carpeta `launch/` que albergará los archivos de esta naturaleza, de la siguiente manera:
```bash
cd catkin_ws/src/primer_paquete
mkdir launch && cd launch
touch mi_launch.launch
chmod u+x mi_launch.launch
```

A continuación, introducimos el siguiente código en el fichero `mi_launch.launch`.

```xml
<launch>
    <!-- Nodo de envio -->
    <node name="envia_nodo" pkg="primer_paquete" type="nodo_envia.py" output="screen"/>
    <!-- Nodo de recibir -->
    <node name="recibe_nodo" pkg="primer_paquete" type="nodo_recibe.py" output="screen"/>
</launch>
```

> Pregunta 6: ¿Con que nombre se han lanzado los nodos?

### Ejercicios
1. Crea un paquete nuevo que se llame p2pkg. A continuación, define un mensaje con los siguientes campos:
```
int32 numero
geometry_msgs/Pose posicion
string fecha
```

Una vez definido, muestra los campos del mensaje usando el comando `rosmsg show`.

2. Crea un nodo publisher, llamado `/nodopub_ejercicio2`, y un nodo subscriber, llamado `/nodosub_ejercicio2`, que sean capaces de enviar y recibir el tipo de mensajes a través un topic al que llamaremos `/topic_ejercicio2`. Estos nodos deben ser creados dentro del paquete ROS p2pkg.

El nodo `/nodopub_ejercicio2` debe tener un argumento de entrada que se asignará al campo numero del mensaje. Además, para enviar todos los valores del campo posición utiliza la función *random* del paquete *random* de Python.

Ambos nodos deben mostrar por la terminal el valor del campo fecha, del campo numero, del campo `posicion.position.x` y del campo `posicion.orientation.w`. En el caso del campo fecha, debes asignarle la fecha del día actual para que se muestre por pantalla.

```python
# Pista:
from random import random
posicion.orientation.x = random()
```

3. Genera un fichero llamado `launch_ejercicio3.launch` que sea capaz de lanzar los nodos creados en el ejercicio anterior al mismo tiempo. El argumento de entrada se debe añadir por línea de comandos y tener un valor por defecto de 7 (Tienes que ver como hacer que el valor pasado por línea de comandos se guarde como argumento en el `launch`).

4. Crea otro fichero llamado `launch_ejercicio4.launch` que agrupe estos dos nodos dentro de un mismo grupo, llamado `miGrupo`. Haz uso de la etiqueta `remap` para que el topic también se encuentre dentro de ese grupo. (Pista: [`group`](http://wiki.ros.org/roslaunch/XML/group), [`remap`](http://wiki.ros.org/roslaunch/XML/remap))

## Parte 3: Acciones en ROS
En cualquier gran sistema basado en ROS, hay casos en los que a algún usuario le gustaría enviar una solicitud a un nodo para realizar alguna tarea, y también recibir una respuesta a la solicitud. Esto se puede conseguir a través de los `servicios` ROS.

En algunos casos, sin embargo, si el servicio tarda mucho tiempo en ejecutarse, el usuario podría querer disponer de la posibilidad de cancelar la solicitud durante la ejecución u obtener información periódica acerca de cómo está progresando la solicitud. Las acciones en ROS permiten crear servicios que ejecuten objetivos de larga duración que puedan ser adelantados. También proporciona una `interfaz de cliente` para enviar solicitudes al `servidor`. El `cliente` y el `servidor` se comunican mediante un protocolo desarrollado para este
fin, basado en mensajes ROS.

En esta parte, se va a aprender la manera en la que se programa una acción,
tanto la parte del `servidor` como la parte del `cliente`. Esta acción va a calcular la serie de Fibonacci de una longitud n.

### Crear un mensaje de tipo Action
Para empezar, vamos a crear un paquete llamado `mi_accion` con dependencias a `rospy` y `std_msgs`. Como sabemos, antes de crear una acción es importante definir los mensajes de objetivo (`goal`), realimentación (`feedback`) y resultado (`result`). Estos mensajes se generan automáticamente desde un fichero `*.action`. Para este ejercicio vamos a crear un fichero llamado `Fibonacci.action` definido de la siguiente manera:

```
int32 orden
---
int32[] secuencia_final
---
int32[] secuencia_actual
```

Para que se generen estos mensajes, debemos añadir al *CMakeLists.txt* lo siguiente:

```
find_package(catkin REQUIRED COMPONENTS actionlib_msgs)
add_action_files(
    DIRECTORY action
    FILES Fibonacci.action
)
generate_messages(
    DEPENDENCIES actionlib_msgs std_msgs
)
catkin_package(
    CATKIN_DEPENDS actionlib_msgs
)
```

Y en el fichero package.xml:

```xml
<build_depend>actionlib_msgs</build_depend>
<exec_depend>message_generation</exec_depend>
<exec_depend>actionlib_msgs</exec_depend>
```

Una vez añadidos el fichero `*.action` y realizadas las modificaciones pertinentes, debemos compilar nuestro paquete. Ahora, se han generado automáticamente ficheros `*.msg` relacionados con la acción, que usaremos tanto en el nodo servidor como en el cliente. Estos ficheros se pueden ver en las siguientes carpetas:

```bash
ls devel/share/mi_accion/msg
ls devel/include/mi_accion
```

> Pregunta 1: A partir de la información del fichero `actionFib.action`, ¿cuál es el tipo de mensaje que se esperará el servidor para comenzar a realizar la acción?, ¿Y el tipo de mensaje que esperará el cliente como resultado?, ¿Qué tipo de mensaje se enviará como realimentación?

### Server Action

Una vez creados los mensajes que se van a intercambiar servidor y cliente, veamos cómo se crea un servidor. Para ello, crea un fichero llamado `fib_server.py` y copia el siguiente código:

```python
#! /usr/bin/env python3
import rospy
import actionlib
import mi_accion.msg
class FibonacciAction(object):
    # create messages that are used to publish feedback/result
    _feedback = mi_accion.msg.FibonacciFeedback()
    _result = mi_accion.msg.FibonacciResult()
    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, mi_accion.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(1)
        success = True
        # append the seeds for the fibonacci sequence
        self._feedback.secuencia_actual = []
        self._feedback.secuencia_actual.append(0)
        self._feedback.secuencia_actual.append(1)
        # publish info to the console for the user
        rospy.loginfo('%s: Ejecutando, creando una secuencia de fibonacci de orden %i con semilla%i, %i' % (self._action_name, goal.orden, self._feedback.secuencia_actual[0], self._feedback.secuencia_actual[1]))
        # start executing the action
        for i in range(1, goal.orden):
        # check that preempt has not been requested by the client
            if self._as.is_preempt_requested():
                rospy.loginfo('%s: Cancelado' % self._action_name)
                self._as.set_preempted()
                success = False
                break
            self._feedback.secuencia_actual.append(self._feedback.secuencia_actual[i] + self._feedback.secuencia_actual[i-1])
            # publish the feedback
            self._as.publish_feedback(self._feedback)
            # this step is not necessary, the sequence is computed at 1 Hz for demonstration purposes
            r.sleep()
        if success:
            self._result. secuencia_final= self._feedback.secuencia_actual
            rospy.loginfo('%s: Completado' % self._action_name)
            self._as.set_succeeded(self._result)
if __name__ == '__main__':
    rospy.init_node('fibonacci')
    server = FibonacciAction(rospy.get_name())
    rospy.loginfo('Accion Fibonacci lanzada y esperando un objetivo!')
    rospy.spin()
```

Se pueden observar varias cosas en este fichero. Primero, hemos importado `actionlib`, para poder hacer uso de `SimpleActionServer`, y `mi_accion.msg`, y así hacer uso de los mensajes relacionados con la acción. Por otro lado, en el `main` creamos el objeto server que pertenece a la clase `FibonnaciAction`, donde se va a definir la funcionalidad de la acción. Y finalmente, dentro de la clase `FibonnaciAction`, hay definida una función llamada `execute_cb` que es la que se va a lanzar cuando se le mande un objetivo a la acción.

Ahora que ya conocemos esto, vamos a lanzar el nodo servidor para estudiar qué ocurre:

```bash
rosrun mi_accion fib_server.py
```

> Pregunta 2: ¿Cómo podemos saber que se ha lanzado la acción correctamente?
>
> Pregunta 3: Sin crear un nodo, ¿cómo lanzarías la acción Fibonnaci? ¿Cómo observarías el resultado de
esta acción?

### Client Action
Ahora que ya hemos creado el servidor, el siguiente paso es crear el cliente para poder lanzar la acción desde un nodo. Por ello, vamos a crear un fichero llamado `fib_client.py` donde copiaremos el siguiente código:
```python
#! /usr/bin/env python3
import rospy
# Brings in the SimpleActionClient
import actionlib
# Brings in the messages used by the fibonacci action, including the
# goal message and the result message.
import mi_accion.msg
def fibonacci_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('fibonacci', mi_accion.msg.FibonacciAction)
    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()
    # Creates a goal to send to the action server.
    goal = mi_accion.msg.FibonacciGoal(orden=20)
    # Sends the goal to the action server.
    client.send_goal(goal)
    # Waits for the server to finish performing the action.
    client.wait_for_result()
    # Prints out the result of executing the action
    return client.get_result() # A FibonacciResult

if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can
        # publish and subscribe over ROS.
        rospy.init_node('fibonacci_client_py')
        result = fibonacci_client()
        print("Result:", ', '.join([str(n) for n in result.secuencia_final]))
    except rospy.ROSInterruptException:
        pass
```

Cabe destacar varias cosas con respecto al código anterior. Primero, hemos vuelto a utilizar actionlib, en este caso para hacer uso de  `impleActionClient`, y `mi_accion.msg`. Después, hemos llamado a la acción lanzando un mensaje con el objetivo, en este caso de orden 20. Y finalmente, tras esperar al resultado, se ha obtenido el resultado para mostrarlo por pantalla.

Ahora, vamos a lanzar el nodo para comprobar que, efectivamente, este nodo lanza una acción para que el servidor nos genere una secuencia de Fibonacci de orden 20:

```bash
rosrun mi_accion fib_client.py
```

> Pregunta 4: ¿Dónde se puede observar la realimentación que nos está ofreciendo el servidor? ¿Y el resultado?
>
> Pregunta 5: Si paramos el nodo a mitad de la ejecución de la acción, ¿se cancela la acción? ¿Cómo cancelarías la acción?

### Ejercicios

1. Genera una nueva acción, `ejFibonacci.action` donde el `goal` y el `result` sean el mismo que `Fibonacci.action`, pero el `feedback` sea de tipo float64.

2. Crea un fichero `ejercicios_fibServer.py` que sea el servidor de la acción `ejFibonacci` para que se comporte igual que `fib_server.py`, con la diferencia de que el `feedback` ha de ser la **raiz cuadrada de la media de la secuencia de Fibonacci** que se está calculando en cada iteración.

3. Crea un fichero `ejercicios_fibClient.py` que sea el nodo cliente de la acción, para que el orden de la secuencia sea modificable a través de un parámetro de entrada. Este nodo cliente publicar la frase ‘en proceso’ a un topic llamado `/estado_accion` mientras la acción esté en proceso. Finalmente, debe mostrar el resultado obtenido de la acción por pantalla.

## Entrega
La entrega de esta práctica se realizará a través de la herramienta de 'Evaluación' de UaCloud. La entrega debe ser una memoria en formato `.pdf` en la cual se encuentren las respuestas a las preguntas teóricas y a los ejercicios propuestos de las diferentes partes. La entrega deberá tener el nombre de *Apellidos_Nombre.pdf*. La entrega de esta práctica es **individual**.
