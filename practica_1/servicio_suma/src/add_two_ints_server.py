#!/usr/bin/env python3

from __future__ import print_function

from servicio_suma.srv import AddTwoInts,AddTwoIntsResponse
import rospy

def handle_add_two_ints(req):
    print("Returning [%s + %s - %s * %s / %s = %s]"%(req.a, req.b, req.c, req.d, req.e, (req.a + req.b - req.c * req.d / req.e)))
    return AddTwoIntsResponse(req.a + req.b - req.c * req.d / req.e)

def add_two_ints_server():
    rospy.init_node('add_two_ints_server')
    s = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
    print("Ready to make the operation.")
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()
