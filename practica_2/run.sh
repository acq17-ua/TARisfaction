#!/bin/bash
# --rm -> will delete the container once it is stopped
# -it -> interactive tty terminal
# -v -> mount X11 socket for GUI applications
# -v -> mount local ./src directory to /home/ros-foxy/src in the container
# -e -> environment: set DISPLAY variable for X11 forwarding
# --network -> host: use the host's network stack
# --name -> ros: name the container 'ros'
# image -> run the 'my_ros_foxy' image

export containerName=ros_noetic
sleep 3 && \
        xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerName` >/dev/null 2>&1 &

docker run --rm -it -e \
		DISPLAY=${DISPLAY} \
		-e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
		--network host \
        --workdir="/workspace" \
        --name $containerName \
		-e "TERM=xterm-256color" \
		--device /dev/dri \
        --volume="$PWD:/workspace:rw" \
        ros_noetic:latest bash

