; Auto-generated. Do not edit!


(cl:in-package p2pkg-msg)


;//! \htmlinclude p2mensaje.msg.html

(cl:defclass <p2mensaje> (roslisp-msg-protocol:ros-message)
  ((numero
    :reader numero
    :initarg :numero
    :type cl:integer
    :initform 0)
   (posicion
    :reader posicion
    :initarg :posicion
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (fecha
    :reader fecha
    :initarg :fecha
    :type cl:string
    :initform ""))
)

(cl:defclass p2mensaje (<p2mensaje>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <p2mensaje>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'p2mensaje)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name p2pkg-msg:<p2mensaje> is deprecated: use p2pkg-msg:p2mensaje instead.")))

(cl:ensure-generic-function 'numero-val :lambda-list '(m))
(cl:defmethod numero-val ((m <p2mensaje>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader p2pkg-msg:numero-val is deprecated.  Use p2pkg-msg:numero instead.")
  (numero m))

(cl:ensure-generic-function 'posicion-val :lambda-list '(m))
(cl:defmethod posicion-val ((m <p2mensaje>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader p2pkg-msg:posicion-val is deprecated.  Use p2pkg-msg:posicion instead.")
  (posicion m))

(cl:ensure-generic-function 'fecha-val :lambda-list '(m))
(cl:defmethod fecha-val ((m <p2mensaje>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader p2pkg-msg:fecha-val is deprecated.  Use p2pkg-msg:fecha instead.")
  (fecha m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <p2mensaje>) ostream)
  "Serializes a message object of type '<p2mensaje>"
  (cl:let* ((signed (cl:slot-value msg 'numero)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posicion) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fecha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fecha))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <p2mensaje>) istream)
  "Deserializes a message object of type '<p2mensaje>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numero) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posicion) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fecha) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fecha) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<p2mensaje>)))
  "Returns string type for a message object of type '<p2mensaje>"
  "p2pkg/p2mensaje")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'p2mensaje)))
  "Returns string type for a message object of type 'p2mensaje"
  "p2pkg/p2mensaje")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<p2mensaje>)))
  "Returns md5sum for a message object of type '<p2mensaje>"
  "1e76c1ca9ea3c78b71e71cf7428e9560")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'p2mensaje)))
  "Returns md5sum for a message object of type 'p2mensaje"
  "1e76c1ca9ea3c78b71e71cf7428e9560")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<p2mensaje>)))
  "Returns full string definition for message of type '<p2mensaje>"
  (cl:format cl:nil "int32 numero~%geometry_msgs/Pose posicion~%string fecha~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'p2mensaje)))
  "Returns full string definition for message of type 'p2mensaje"
  (cl:format cl:nil "int32 numero~%geometry_msgs/Pose posicion~%string fecha~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <p2mensaje>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posicion))
     4 (cl:length (cl:slot-value msg 'fecha))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <p2mensaje>))
  "Converts a ROS message object to a list"
  (cl:list 'p2mensaje
    (cl:cons ':numero (numero msg))
    (cl:cons ':posicion (posicion msg))
    (cl:cons ':fecha (fecha msg))
))
