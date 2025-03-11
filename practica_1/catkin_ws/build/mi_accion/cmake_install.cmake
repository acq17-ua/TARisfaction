# Install script for directory: /workspace/catkin_ws/src/mi_accion

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/action" TYPE FILE FILES
    "/workspace/catkin_ws/src/mi_accion/action/Fibonacci.action"
    "/workspace/catkin_ws/src/mi_accion/action/ejFibonacci.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciAction.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciActionGoal.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciActionResult.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciGoal.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciResult.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/FibonacciFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/msg" TYPE FILE FILES
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciAction.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciActionGoal.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciActionResult.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciActionFeedback.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciGoal.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciResult.msg"
    "/workspace/catkin_ws/devel/share/mi_accion/msg/ejFibonacciFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/mi_accion/catkin_generated/installspace/mi_accion-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/include/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/roseus/ros/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/common-lisp/ros/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/share/gennodejs/ros/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/workspace/catkin_ws/devel/lib/python3/dist-packages/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/workspace/catkin_ws/devel/lib/python3/dist-packages/mi_accion")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/workspace/catkin_ws/build/mi_accion/catkin_generated/installspace/mi_accion.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/cmake" TYPE FILE FILES "/workspace/catkin_ws/build/mi_accion/catkin_generated/installspace/mi_accion-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion/cmake" TYPE FILE FILES
    "/workspace/catkin_ws/build/mi_accion/catkin_generated/installspace/mi_accionConfig.cmake"
    "/workspace/catkin_ws/build/mi_accion/catkin_generated/installspace/mi_accionConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mi_accion" TYPE FILE FILES "/workspace/catkin_ws/src/mi_accion/package.xml")
endif()

