#!/usr/bin/env python3

import rospy
import sys
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Twist
from math import sin, cos, pi, sqrt

def process_new_position(data, args):

    if( args["is_rotating"] ):
        return

    # normal update
    if( args["xo"] is not None ):
        
        args["x"] = data.position[0]
        args["y"] = data.position[1]
    

        #args["done"] = sqrt( abs(args["x"]-args["xo"])**2 + abs(args["y"]-args["yo"])**2 ) >= args["distance"]
        
        distance = sqrt( abs(args["x"]-args["xo"])**2 + abs(args["y"]-args["yo"])**2 )
        args["done"] = distance >= args["distance"]

        if(args["done"]):
            print(f"it was me: {args['x']},{args['y']} -- ({args['done']})")
            print(f"--it was me: {args['xo']},{args['yo']} -- ({args['done']})")
            print(f"--distance: {distance}")

        #print(f"new pos recorded: {args['x']},{args['y']} -- ({args['done']})")

    # first position recorded (calculate end coordinates)
    else:

        #args["x"] = sin(args["angle"]*pi/180) 
        #args["y"] = cos(args["angle"]*pi/180)
            
        args["xo"] = data.position[0]
        args["yo"] = data.position[1]

        print(f"first pos recorded: {args['xo']},{args['yo']}")

def rotate(pub, degrees, callback_args):

    callback_args["is_rotating"] = True

    angular_speed = .5 # rad/s
    wait_time = (degrees*pi/180) / angular_speed

    print(f"wait time: {wait_time}")

    rotation = Twist()
    rotation.angular.z = angular_speed
    
    start = rospy.get_time()
    

    while (start + wait_time) > rospy.get_time():
        pub.publish(rotation)
   
    print(f"start: {start} wait_time: {wait_time} now: {rospy.get_time()}")
    # finish rotation
    rotation.angular.z = 0
    pub.publish(rotation)

    # wait for robot to stabilize
    rospy.sleep(.3)

    callback_args["is_rotating"] = False

def prepare_ros(callback_args):

    pub = rospy.Publisher("/cmd_vel_mux/input/teleop", Twist, queue_size=10)
    sub = rospy.Subscriber("/joint_states", JointState, process_new_position, callback_args=callback_args)
    node = rospy.init_node("move_generator", anonymous=True)
    rate = rospy.Rate(.7)

    return pub, sub, node, rate

def move_triangle():
    
    args = { "xo":None, "yo":None, "x":None, "y":None, "done":False, "distance":3, "is_rotating":False }
    pub, sub, node, rate = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            break

        msg.linear.x = 1
        pub.publish(msg)
        rate.sleep()

    print("First side done")
    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]
    rotate(pub, 120, args)
    print("finished rotating")

    print(f"{rospy.is_shutdown()}")

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            print("second move is done also")
            break

        msg.linear.x = 1
        pub.publish(msg)
        rate.sleep()
    
    print("Second side done")
    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]
    rotate(pub, 120, args)
    print("finished rotating")

    # send orders
    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:
            break

        msg.linear.x = 1
        # keep moving straight
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
