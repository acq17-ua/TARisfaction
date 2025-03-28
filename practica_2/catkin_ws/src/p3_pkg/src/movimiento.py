#!/usr/bin/env python3

import rospy
import sys
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Twist
from math import sin, cos, pi, sqrt

def process_new_position(data, args):

    # normal update
    if( args["xo"] is not None ):
        
        args["x"] = data.position[0]
        args["y"] = data.position[1]
    

        args["done"] = sqrt( abs(args["x"]-args["xo"]) + abs(args["y"]-args["yo"]) ) >= args["distance"]
        #print(f"new pos recorded: {args['x']},{args['y']} -- ({args['done']})")

    # first position recorded
    else:
        args["xo"] = data.position[0]
        args["yo"] = data.position[1]
        
        #print(f"first pos recorded: {args['xo']},{args['yo']}")

def prepare_ros(callback_args):

    pub = rospy.Publisher("/cmd_vel_mux/input/teleop", Twist, queue_size=10)
    sub = rospy.Subscriber("/joint_states", JointState, process_new_position, callback_args=callback_args)
    node = rospy.init_node("move_generator", anonymous=True)
    rate = rospy.Rate(.7)

    return pub, sub, node, rate

def move_triangle():
    
    args = { "xo":None, "yo":None, "x":None, "y":None, "done":False, "distance":3 }
    pub, sub, node, rate = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            print("First side done")
            args["done"] = False
            args["xo"], args["yo"] = args["x"], args["y"]

            break

        

        # keep moving straight
        #msg.linear.x = cos(120*pi/180)
        #msg.linear.y = sin(120*pi/180)
        #msg.angular.z = 120*pi/180
        msg.linear.x = 1
        print(f"moving straight: {msg.linear.x},{msg.linear.y} [{args['x']}, {args['y']}]")
        pub.publish(msg)
        rate.sleep()

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            print("second side done")
            args["done"] = False
            args["xo"], args["yo"] = args["x"], args["y"]

            break

        msg.linear.x = cos(120*pi/180)
        msg.linear.y = sin(120*pi/180)
        print(f"moving tilted 1: {msg.linear.x},{msg.linear.y} [{args['x']}, {args['y']}]")
        #msg.angular.z = 120*pi/180
        #msg.linear.x = 1
        pub.publish(msg)
        rate.sleep()
    
    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            print("Third side done")
            args["done"] = False
            args["xo"], args["yo"] = args["x"], args["y"]

            break

        msg.linear.x = cos(120*pi/180)
        msg.linear.y = -sin(120*pi/180)
        print(f"moving tilted 2: {msg.linear.x},{msg.linear.y} [{args['x']}, {args['y']}]")
        # keep moving straight
        #msg.linear.x = 1
        #msg.linear.y = 0
        #msg.angular.z = 120*pi/180
        pub.publish(msg)
        rate.sleep()

    return

def move_line():

    args = { "xo":None, "yo":None, "x":None, "y":None, "done":False, "distance":2 }
    pub, sub, node, rate = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            print("We moved 2 m in a straight line")
            return

        # keep moving straight
        msg.linear.x = 1
        pub.publish(msg)
        rate.sleep()

 

def move_square():
    
    pub, node, rate = prepare_ros()
    return

def move_infinity():
    
    pub, node, rate = prepare_ros()
    return

if __name__=="__main__":
    
    move = sys.argv[1]

    if( move=='0' ):
        move_line()

    elif( move=='1' ):
        move_triangle()

    elif( move=='2' ):
        move_square()

    elif( move=='3' ):
        move_infinity()

    else:
        print( "not a valid move" )
