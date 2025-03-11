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
