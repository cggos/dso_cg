# ROS Wrapper around DSO: Direct Sparse Odometry

Modified version of **[DSO_ROS](https://github.com/JakobEngel/dso_ros)** (commit 3b208b2 on Dec 4, 2018) of branch `catkin`.

This is meant as simple, minimal example of how to integrate DSO from a different project, and run it on real-time input data.
It does not provide a full ROS interface (no reconfigure / pointcloud output / pose output).
To access computed information in real-time, I recommend to implement your own Output3DWrapper; see the DSO code.


### Related Papers

* **Direct Sparse Odometry**, *J. Engel, V. Koltun, D. Cremers*, In arXiv:1607.02565, 2016

* **A Photometrically Calibrated Benchmark For Monocular Visual Odometry**, *J. Engel, V. Usenko, D. Cremers*, In arXiv:1607.02555, 2016



# Installation

* Install DSO. We need DSO to be compiled with OpenCV (to read the vignette image), and with Pangolin (for 3D visualization).

* export `DSO_PATH`
  ```sh
  cd dso_cg
  export DSO_PATH=`pwd`/dso
  ```

* build
  ```sh
  catkin_make --source dso_ros/
  ```



# Run

* common
	```sh
	rosrun dso_ros dso_live image:=image_raw \
		calib=XXXXX/camera.txt \
		gamma=XXXXX/pcalib.txt \
		vignette=XXXXX/vignette.png \
	```

* run with mynteye-s2110 left camera
  ```sh
  rosrun dso_ros dso_live image:=/mynteye/left/image_raw calib=camera.txt mode=1
	```

# Notes

## Pangolin

removing

	    fullSystem->outputWrapper = new IOWrap::PangolinDSOViewer(
	    		 (int)undistorter->getSize()[0],
	    		 (int)undistorter->getSize()[1]);

will allow you to use DSO compiled without Pangolin. However, then there is no 3D visualization.
You can also implement your own Output3DWrapper to fit your needs.

## OpenCV

you can use DSO compiled without OpenCV.
In that case, the vignette image will not be read, and no photometric calibration can be used. Also, there will not be any image visualizations / image saving.
You can also implement your own version of ImageRW.h / ImageDisplay.h, instead of the dummies.
