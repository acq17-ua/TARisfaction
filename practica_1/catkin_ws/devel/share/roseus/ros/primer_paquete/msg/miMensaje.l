;; Auto-generated. Do not edit!


(when (boundp 'primer_paquete::miMensaje)
  (if (not (find-package "PRIMER_PAQUETE"))
    (make-package "PRIMER_PAQUETE"))
  (shadow 'miMensaje (find-package "PRIMER_PAQUETE")))
(unless (find-package "PRIMER_PAQUETE::MIMENSAJE")
  (make-package "PRIMER_PAQUETE::MIMENSAJE"))

(in-package "ROS")
;;//! \htmlinclude miMensaje.msg.html


(intern "*NOMBRE*" (find-package "PRIMER_PAQUETE::MIMENSAJE"))
(shadow '*NOMBRE* (find-package "PRIMER_PAQUETE::MIMENSAJE"))
(defconstant primer_paquete::miMensaje::*NOMBRE* "AlbaC")

(defun primer_paquete::miMensaje-to-symbol (const)
  (cond
        (t nil)))

(defclass primer_paquete::miMensaje
  :super ros::object
  :slots (_x _y ))

(defmethod primer_paquete::miMensaje
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int32 _x
    4
    ;; int32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get primer_paquete::miMensaje :md5sum-) "aa495b732c9aefce046c1353dbc93e7e")
(setf (get primer_paquete::miMensaje :datatype-) "primer_paquete/miMensaje")
(setf (get primer_paquete::miMensaje :definition-)
      "int32 x
int32 y
string nombre=AlbaC

")



(provide :primer_paquete/miMensaje "aa495b732c9aefce046c1353dbc93e7e")


