# Install script for directory: /workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/workspace/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/BumperEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/CliffEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/DigitalOutput.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/ExternalPower.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/Led.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/PowerSystemEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/SensorState.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/VersionInfo.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/ControllerInfo.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/ButtonEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/DigitalInputEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/DockInfraRed.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/KeyboardInput.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/MotorPower.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/RobotStateEvent.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/Sound.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/ScanAngle.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/msg/WheelDropEvent.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/action" TYPE FILE FILES "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/action/AutoDocking.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingAction.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingActionGoal.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingActionResult.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingGoal.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingResult.msg"
    "/workspace/catkin_ws/devel/share/kobuki_msgs/msg/AutoDockingFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/kobuki_msgs/catkin_generated/installspace/kobuki_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/include/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/roseus/ros/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/common-lisp/ros/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/gennodejs/ros/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/workspace/catkin_ws/devel/lib/python3/dist-packages/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/lib/python3/dist-packages/kobuki_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/kobuki_msgs/catkin_generated/installspace/kobuki_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/kobuki_msgs/catkin_generated/installspace/kobuki_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs/cmake" TYPE FILE FILES
    "/workspace/catkin_ws/build/Turtlebot_on_noetic/kobuki_msgs/catkin_generated/installspace/kobuki_msgsConfig.cmake"
    "/workspace/catkin_ws/build/Turtlebot_on_noetic/kobuki_msgs/catkin_generated/installspace/kobuki_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_msgs" TYPE FILE FILES "/workspace/catkin_ws/src/Turtlebot_on_noetic/kobuki_msgs/package.xml")
endif()

