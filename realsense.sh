''' 
    install realsense API
''' 

echo $1|sudo -S apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u

sudo apt-get install -y librealsense2-dkms
sudo apt-get install -y librealsense2-utils

sudo apt-get install -y librealsense2-dev
sudo apt-get install -y librealsense2-dbg

''' 
    install realsense-ros and create workspace
'''

mkdir -p ~/ros2_ws/src && cd ~/ros2_ws/src/ \
    && git clone https://github.com/IntelRealSense/realsense-ros.git -b ros2-development 


cd ~/ros2_ws && sudo apt-get install python3-rosdep -y 
cd ~/ros2_ws && sudo rosdep init # "sudo rosdep init --include-eol-distros" for Eloquent and earlier 
cd ~/ros2_ws && rosdep update  # "sudo rosdep update --include-eol-distros" for Eloquent and earlier
cd ~/ros2_ws && rosdep install -i --from-path src --rosdistro $ROS_DISTRO --skip-keys=librealsense2 -y
cd ~/ros2_ws && colcon build

