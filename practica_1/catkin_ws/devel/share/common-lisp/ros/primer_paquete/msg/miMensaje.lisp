; Auto-generated. Do not edit!


(cl:in-package primer_paquete-msg)


;//! \htmlinclude miMensaje.msg.html

(cl:defclass <miMensaje> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass miMensaje (<miMensaje>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <miMensaje>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'miMensaje)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name primer_paquete-msg:<miMensaje> is deprecated: use primer_paquete-msg:miMensaje instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <miMensaje>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader primer_paquete-msg:x-val is deprecated.  Use primer_paquete-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <miMensaje>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader primer_paquete-msg:y-val is deprecated.  Use primer_paquete-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<miMensaje>)))
    "Constants for message type '<miMensaje>"
  '((:NOMBRE . "AlbaC"))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'miMensaje)))
    "Constants for message type 'miMensaje"
  '((:NOMBRE . "AlbaC"))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <miMensaje>) ostream)
  "Serializes a message object of type '<miMensaje>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <miMensaje>) istream)
  "Deserializes a message object of type '<miMensaje>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<miMensaje>)))
  "Returns string type for a message object of type '<miMensaje>"
  "primer_paquete/miMensaje")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'miMensaje)))
  "Returns string type for a message object of type 'miMensaje"
  "primer_paquete/miMensaje")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<miMensaje>)))
  "Returns md5sum for a message object of type '<miMensaje>"
  "aa495b732c9aefce046c1353dbc93e7e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'miMensaje)))
  "Returns md5sum for a message object of type 'miMensaje"
  "aa495b732c9aefce046c1353dbc93e7e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<miMensaje>)))
  "Returns full string definition for message of type '<miMensaje>"
  (cl:format cl:nil "int32 x~%int32 y~%string nombre=AlbaC~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'miMensaje)))
  "Returns full string definition for message of type 'miMensaje"
  (cl:format cl:nil "int32 x~%int32 y~%string nombre=AlbaC~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <miMensaje>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <miMensaje>))
  "Converts a ROS message object to a list"
  (cl:list 'miMensaje
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
