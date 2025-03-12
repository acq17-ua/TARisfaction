# Install script for directory: /workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/ARPair.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/ARPairList.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/Wall.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/WallList.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/Column.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/ColumnList.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/MagicButton.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/NavigationControl.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/NavigationControlStatus.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/Table.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/TableList.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/Trajectory.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/TrajectoryList.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/Waypoint.msg"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/msg/WaypointList.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/srv" TYPE FILE FILES "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/srv/WaypointListService.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/action" TYPE FILE FILES
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/action/NavigateTo.action"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/action/DockingInteractor.action"
    "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/action/Localize.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToAction.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToActionGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToActionResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/NavigateToFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorAction.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorActionGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorActionResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/DockingInteractorFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeAction.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeActionGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeActionResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeGoal.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeResult.msg"
    "/workspace/catkin_ws/devel/share/yocs_msgs/msg/LocalizeFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/yocs_msgs" TYPE FILE FILES "/workspace/catkin_ws/devel/include/yocs_msgs/JoystickConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/yocs_msgs" TYPE FILE FILES "/workspace/catkin_ws/devel/lib/python3/dist-packages/yocs_msgs/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/workspace/catkin_ws/devel/lib/python3/dist-packages/yocs_msgs/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/yocs_msgs" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/lib/python3/dist-packages/yocs_msgs/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/yocs_msgs/catkin_generated/installspace/yocs_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/include/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/roseus/ros/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/common-lisp/ros/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/gennodejs/ros/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/workspace/catkin_ws/devel/lib/python3/dist-packages/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/lib/python3/dist-packages/yocs_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/yocs_msgs/catkin_generated/installspace/yocs_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/Turtlebot_on_noetic/yocs_msgs/catkin_generated/installspace/yocs_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs/cmake" TYPE FILE FILES
    "/workspace/catkin_ws/build/Turtlebot_on_noetic/yocs_msgs/catkin_generated/installspace/yocs_msgsConfig.cmake"
    "/workspace/catkin_ws/build/Turtlebot_on_noetic/yocs_msgs/catkin_generated/installspace/yocs_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yocs_msgs" TYPE FILE FILES "/workspace/catkin_ws/src/Turtlebot_on_noetic/yocs_msgs/package.xml")
endif()

