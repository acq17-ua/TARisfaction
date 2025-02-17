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
