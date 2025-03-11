#! /usr/bin/env python3
import rospy
# Brings in the SimpleActionClient
import actionlib
# Brings in the messages used by the fibonacci action, including the
# goal message and the result message.
import mi_accion.msg
import sys 
from std_msgs.msg import String
from time import sleep

def fibonacci_client(laOrden):
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('fibonacci', mi_accion.msg.ejFibonacciAction)
    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()
    # Creates a goal to send to the action server.
    goal = mi_accion.msg.ejFibonacciGoal(orden=laOrden)
    # Sends the goal to the action server.
    client.send_goal(goal)

    while client.get_result() is None:
        topic_process = rospy.Publisher('/estado_accion', String, queue_size=10)
        topic_process.publish("en proceso")
        sleep(1)

    #client.wait_for_result()
    return client.get_result() # A FibonacciResult

if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can
        # publish and subscribe over ROS.
        rospy.init_node('fibonacci_client_py')

        orden = 20
        if len(sys.argv) == 2:
            orden = int(sys.argv[1])

        result = fibonacci_client(orden)
        print("Result:", ', '.join([str(n) for n in result.secuencia_final]))
    except rospy.ROSInterruptException:
        pass
