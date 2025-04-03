#!/usr/bin/env python3
import rospy
from bondpy import bondpy
from nav_msgs.msg import Odometry

def stop_callback(data):
    rospy.signal_shutdown("")
    quit()

def odom_callback(msg):
    x = msg.pose.pose.position.x
    y = msg.pose.pose.position.y
    rospy.loginfo(f"{x:.2f},{y:.2f}")

rospy.init_node("odometry_listener")
rospy.Timer(rospy.Duration(20), stop_callback)
rospy.Subscriber("/odom", Odometry, odom_callback)

bond = bondpy.Bond("bond_topic", "1")

bond.start()
#rospy.spin()
bond.wait_until_broken()
