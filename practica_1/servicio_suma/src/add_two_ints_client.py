#!/usr/bin/env python3

from __future__ import print_function

import sys
import rospy
from servicio_suma.srv import *

def add_two_ints_client(a, b, c, d, e):
    rospy.wait_for_service('add_two_ints')
    try:
        add_two_ints = rospy.ServiceProxy('add_two_ints', AddTwoInts)
        resp1 = add_two_ints(a, b, c, d, e)
        return resp1.sum
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def usage():
    return "%s [a b c d e]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 6:
        a = int(sys.argv[1])
        b = int(sys.argv[2])
        c = int(sys.argv[3])
        d = int(sys.argv[4])
        e = int(sys.argv[5])
    else:
        print(usage())
        sys.exit(1)
    print("Requesting %s+%s-%s*%s/%s"%(a,b,c,d,e))
    print("%s + %s - %s * %s / %s = %s"%(a, b, c, d, e, add_two_ints_client(a, b, c, d, e)))
