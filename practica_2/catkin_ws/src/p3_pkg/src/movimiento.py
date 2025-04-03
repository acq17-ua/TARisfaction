#!/usr/bin/env python3

import rospy
import sys
from bondpy import bondpy
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Twist
from math import sin, cos, pi, sqrt

def process_new_position(data, args):

    if( args["is_rotating"] or args["done"] ):
        rospy.sleep(.1)
        return

    # normal update
    if( args["xo"] is not None ):
        
        args["x"] = data.position[0]
        args["y"] = data.position[1]
    
        distance = sqrt( abs(args["x"]-args["xo"])**2 + abs(args["y"]-args["yo"])**2 )
        args["done"] = (distance >= args["distance"])
        print(f"moved {distance} out of {args['distance']}, (done={args['done']})")
        
    # first position recorded (calculate end coordinates)
    else:

        args["x"] = args["xo"] = data.position[0]
        args["y"] = args["yo"] = data.position[1]

        print(f"first pos recorded: {args['xo']},{args['yo']}")

def rotate(pub, degrees, callback_args):

    callback_args["is_rotating"] = True

    angular_speed = .7 # rad/s
    wait_time = (degrees*pi/180) / angular_speed

    print(f"wait time: {wait_time}")

    rotation = Twist()
    rotation.angular.z = angular_speed
    
    start = rospy.get_time()

    while (start + wait_time) > rospy.get_time():
        pub.publish(rotation)
   
    #print(f"start: {start} wait_time: {wait_time} now: {rospy.get_time()}")
    # finish rotation
    rotation.angular.z = 0
    pub.publish(rotation)

    # wait for robot to stabilize
    rospy.sleep(.7)

    callback_args["is_rotating"] = False

def advance(pub, args, msg, rate):

    while not rospy.is_shutdown():

        # movement is done
        if args["done"]:

            msg.linear.x = 0
            pub.publish(msg)
            rate.sleep()
            return

        msg.linear.x = 1
        pub.publish(msg)
        rate.sleep()

def prepare_ros(callback_args):

    pub = rospy.Publisher("/cmd_vel_mux/input/teleop", Twist, queue_size=10)
    sub = rospy.Subscriber("/joint_states", JointState, process_new_position, callback_args=callback_args)
    node = rospy.init_node("move_generator", anonymous=True)
    rate = rospy.Rate(.7)

    bond = bondpy.Bond("bond_topic", "1")
    bond.start()

    if not bond.wait_until_formed(rospy.Duration(5.0)):
        print("Couldnt connect to tracker pair (run guy_who_tracks.py)")
        quit()

    return pub, sub, node, rate, bond

def move_triangle():
   
    args = { "xo":None, "yo":None, "x":None, "y":None, "done":True, "distance":3, "is_rotating":False }
    pub, sub, node, rate, bond = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    # first side

    advance(pub, args, msg, rate)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

    rotate(pub, 120, args)

    # second side

    advance(pub, args, msg, rate)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

    rotate(pub, 120, args)

    # third side

    advance(pub, args, msg, rate)

    rotate(pub, 120, args)

    bond.break_bond()

    return

def move_line():

    args = { "xo":None, "yo":None, "x":None, "y":None, "done":True, "distance":2 }
    pub, sub, node, rate, bond = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    advance(pub, args, msg, rate)

    bond.break_bond()

    return

def move_square():
    
    args = { "xo":None, "yo":None, "x":None, "y":None, "done":False, "distance":2, "is_rotating":False }
    pub, sub, node, rate, bond = prepare_ros(args)
    msg = Twist()

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    print("bout to advance: side 1")
    # first side
    advance(pub, args, msg, rate)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

    rotate(pub, 90, args)

    print("bout to advance: side 2")
    # second side
    advance(pub, args, msg, rate)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

    rotate(pub, 90, args)

    print("bout to advance: side 3")
    # third side
    advance(pub, args, msg, rate)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

    rotate(pub, 90, args)

    print("bout to advance: side 4")
    # fourth side
    advance(pub, args, msg, rate)

    rotate(pub, 90, args)

    bond.break_bond()

    return

def move_infinity(pub, sub, node, rate):
    
    args = { "xo":None, "yo":None, "x":None, "y":None, "done":True, "distance":2 }
    pub, sub, node, rate, bond = prepare_ros(args)

    bond.break_bond()
    
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
