#!/usr/bin/env python3

import rospy
import sys
from bondpy import bondpy
#from sensor_msgs.msg import JointState
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from math import sin, cos, pi, sqrt
from tf.transformations import euler_from_quaternion

def process_new_position(data, args):

    if args["done"]:
        rospy.sleep(.1)
        return

    #print(f"is_rotating: {args['is_rotating']}")
    
    # rotation update
    if args["is_rotating"]:

        #print("we rotating")

        # rotation update
        if args["orientation_o"] is not None:
            #print("normal update")

            _,_,args['orientation'] = euler_from_quaternion([   data.pose.pose.orientation.x,
                                                                data.pose.pose.orientation.y,
                                                                data.pose.pose.orientation.z,
                                                                data.pose.pose.orientation.w
                                                                ])

            angle_rotated = abs(abs(args["orientation"])-abs(args["orientation_o"]))
            #args["done"] = angle_rotated >= args["angle"]

            print(f"orientation_o={args['orientation_o']} - orientation={args['orientation']} = {angle_rotated} (>= {args['angle']}: {args['done']})")

            #print(args["angle"])
            #print(f"new orientation: {args['orientation']} -- ({args['done']})")

        # we just started rotating
        else:
            print("first rotation update")

            # get yaw (to radians)
            _,_,args['orientation_o'] = euler_from_quaternion([ data.pose.pose.orientation.x,
                                                                data.pose.pose.orientation.y,
                                                                data.pose.pose.orientation.z,
                                                                data.pose.pose.orientation.w
                                                                ])
            
            #args["orientation_o"] = float(data.pose.pose.orientation.z)
            #args["orientation"] = float(data.pose.pose.orientation.z)
            print(f"initial orientation: {args['orientation_o']}")
            print(f"{args['orientation_o']} {args['orientation']}")
            quit()
            
        return

    # movement update
    if( args["xo"] is not None ):
    
        args["x"] = data.pose.pose.position.x
        args["y"] = data.pose.pose.position.y

        distance = sqrt( abs(args["x"]-args["xo"])**2 + abs(args["y"]-args["yo"])**2 )
        args["done"] = (distance >= args["distance"])
        
    # first position recorded
    else:
        args["x"] = args["xo"] = data.pose.pose.position.x
        args["y"] = args["yo"] = data.pose.pose.position.y

def rotate(pub, args, rate):

    print("begun rotating")

    args["is_rotating"] = True

    angular_speed = .5 # rad/s

    rotation = Twist()
    rotation.angular.z = angular_speed
    
    while not args["done"]:
        pub.publish(rotation)
    
    # finish rotation
    rotation.angular.z = 0
    pub.publish(rotation)

    print("finished rotating")

    # wait for robot to stabilize
    rospy.sleep(1)

    args["is_rotating"] = False
    args["done"] = False
    args["orientation_o"] = None
    args["orientation"] = None

def advance(pub, args, rate):

    print("begun move")
    move = Twist()
    move.linear.x = 1

    while not args["done"]:
        pub.publish(move)

    move.linear.x = 0
    pub.publish(move)

    rospy.sleep(1)

    args["done"] = False
    args["xo"], args["yo"] = args["x"], args["y"]

def prepare_ros(callback_args):

    pub = rospy.Publisher("/cmd_vel_mux/input/teleop", Twist, queue_size=10)
    sub = rospy.Subscriber("/odom", Odometry, process_new_position, callback_args=callback_args)
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
    rotate(pub, 120, args)

    # second side

    advance(pub, args, msg, rate)
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
    
    args = {    "xo":None, "yo":None, 
                "x":None, "y":None, 
                "done":False, 
                "distance":2, 
                "is_rotating":False, 
                "orientation_o":None, "orientation":None,
                "angle":(pi/2) }


    pub, sub, node, rate, bond = prepare_ros(args)

    # wait for a first position
    while ( not rospy.is_shutdown() ) and args["xo"] is None:
        rate.sleep()

    print("SIDE 1")
    advance(pub, args, rate)
    rotate(pub, args, rate)

    print("SIDE 2")
    advance(pub, args, rate)
    rotate(pub, args, rate)

    print("SIDE 3")
    advance(pub, args, rate)
    rotate(pub, args, rate)

    print("SIDE 4")
    advance(pub, args, rate)
    rotate(pub, args, rate)

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
