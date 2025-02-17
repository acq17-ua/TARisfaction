#!/usr/bin/env python3
import rospy
from p2pkg.msg import p2mensaje
import sys
from random import random
from datetime import datetime

def nodo_envia(numeroDado):
    mensaje = p2mensaje()
    mensaje.numero = numeroDado

    pub = rospy.Publisher('/topic_ejercicio2', p2mensaje, queue_size=10)
    rospy.init_node('nodopub_ejercicio2', anonymous=True)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():

        mensaje.fecha = datetime.today().strftime('%Y-%m-%m')
            
        mensaje.posicion.position.x = random()
        mensaje.posicion.position.y = random()
        mensaje.posicion.position.z = random()

        mensaje.posicion.orientation.x = random()
        mensaje.posicion.orientation.y = random()
        mensaje.posicion.orientation.z = random()
        mensaje.posicion.orientation.w = random()

        envio_str = "ENVIO: fecha: %s | numero: %s | position.x: %s | orientation.w: %s" %(mensaje.fecha, mensaje.numero, mensaje.posicion.position.x, mensaje.posicion.orientation.w)
        rospy.loginfo(envio_str)
        pub.publish(mensaje)
        rate.sleep()

if __name__ == '__main__':
    
    numeroDado = 0
    if len(sys.argv) == 2:
        numeroDado = sys.argv[1]

    try:
        nodo_envia(numeroDado)
    except rospy.ROSInterruptException:
        pass
