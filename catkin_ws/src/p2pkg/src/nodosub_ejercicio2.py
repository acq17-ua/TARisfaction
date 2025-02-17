#!/usr/bin/env python3
import rospy
from p2pkg.msg import p2mensaje

def callback(data):
    rospy.loginfo("RECIBO: fecha: %s | numero: %s | position.x: %s | orientation.w: %s" %(data.fecha, data.numero, data.posicion.position.x, data.posicion.orientation.w))

def nodo_recibe():
    rospy.init_node('nodosub_ejercicio2', anonymous=True)
    rospy.Subscriber("topic_ejercicio2", p2mensaje, callback)
    rospy.spin()

if __name__ == '__main__':
    nodo_recibe()
