;; Auto-generated. Do not edit!


(when (boundp 'p2pkg::p2mensaje)
  (if (not (find-package "P2PKG"))
    (make-package "P2PKG"))
  (shadow 'p2mensaje (find-package "P2PKG")))
(unless (find-package "P2PKG::P2MENSAJE")
  (make-package "P2PKG::P2MENSAJE"))

(in-package "ROS")
;;//! \htmlinclude p2mensaje.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass p2pkg::p2mensaje
  :super ros::object
  :slots (_numero _posicion _fecha ))

(defmethod p2pkg::p2mensaje
  (:init
   (&key
    ((:numero __numero) 0)
    ((:posicion __posicion) (instance geometry_msgs::Pose :init))
    ((:fecha __fecha) "")
    )
   (send-super :init)
   (setq _numero (round __numero))
   (setq _posicion __posicion)
   (setq _fecha (string __fecha))
   self)
  (:numero
   (&optional __numero)
   (if __numero (setq _numero __numero)) _numero)
  (:posicion
   (&rest __posicion)
   (if (keywordp (car __posicion))
       (send* _posicion __posicion)
     (progn
       (if __posicion (setq _posicion (car __posicion)))
       _posicion)))
  (:fecha
   (&optional __fecha)
   (if __fecha (setq _fecha __fecha)) _fecha)
  (:serialization-length
   ()
   (+
    ;; int32 _numero
    4
    ;; geometry_msgs/Pose _posicion
    (send _posicion :serialization-length)
    ;; string _fecha
    4 (length _fecha)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _numero
       (write-long _numero s)
     ;; geometry_msgs/Pose _posicion
       (send _posicion :serialize s)
     ;; string _fecha
       (write-long (length _fecha) s) (princ _fecha s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _numero
     (setq _numero (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Pose _posicion
     (send _posicion :deserialize buf ptr-) (incf ptr- (send _posicion :serialization-length))
   ;; string _fecha
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fecha (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get p2pkg::p2mensaje :md5sum-) "1e76c1ca9ea3c78b71e71cf7428e9560")
(setf (get p2pkg::p2mensaje :datatype-) "p2pkg/p2mensaje")
(setf (get p2pkg::p2mensaje :definition-)
      "int32 numero
geometry_msgs/Pose posicion
string fecha

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :p2pkg/p2mensaje "1e76c1ca9ea3c78b71e71cf7428e9560")


