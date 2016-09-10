; Auto-generated. Do not edit!


(cl:in-package cone_detector-msg)


;//! \htmlinclude positionFromDetectRGB.msg.html

(cl:defclass <positionFromDetectRGB> (roslisp-msg-protocol:ros-message)
  ((who
    :reader who
    :initarg :who
    :type cl:fixnum
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (flag
    :reader flag
    :initarg :flag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass positionFromDetectRGB (<positionFromDetectRGB>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <positionFromDetectRGB>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'positionFromDetectRGB)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cone_detector-msg:<positionFromDetectRGB> is deprecated: use cone_detector-msg:positionFromDetectRGB instead.")))

(cl:ensure-generic-function 'who-val :lambda-list '(m))
(cl:defmethod who-val ((m <positionFromDetectRGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cone_detector-msg:who-val is deprecated.  Use cone_detector-msg:who instead.")
  (who m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <positionFromDetectRGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cone_detector-msg:x-val is deprecated.  Use cone_detector-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <positionFromDetectRGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cone_detector-msg:y-val is deprecated.  Use cone_detector-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <positionFromDetectRGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cone_detector-msg:z-val is deprecated.  Use cone_detector-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <positionFromDetectRGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cone_detector-msg:flag-val is deprecated.  Use cone_detector-msg:flag instead.")
  (flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <positionFromDetectRGB>) ostream)
  "Serializes a message object of type '<positionFromDetectRGB>"
  (cl:let* ((signed (cl:slot-value msg 'who)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <positionFromDetectRGB>) istream)
  "Deserializes a message object of type '<positionFromDetectRGB>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'who) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flag) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<positionFromDetectRGB>)))
  "Returns string type for a message object of type '<positionFromDetectRGB>"
  "cone_detector/positionFromDetectRGB")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'positionFromDetectRGB)))
  "Returns string type for a message object of type 'positionFromDetectRGB"
  "cone_detector/positionFromDetectRGB")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<positionFromDetectRGB>)))
  "Returns md5sum for a message object of type '<positionFromDetectRGB>"
  "876ca217fcc53faec876347db09a50ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'positionFromDetectRGB)))
  "Returns md5sum for a message object of type 'positionFromDetectRGB"
  "876ca217fcc53faec876347db09a50ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<positionFromDetectRGB>)))
  "Returns full string definition for message of type '<positionFromDetectRGB>"
  (cl:format cl:nil "int8 who~%float32 x~%float32 y~%float32 z~%int16 flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'positionFromDetectRGB)))
  "Returns full string definition for message of type 'positionFromDetectRGB"
  (cl:format cl:nil "int8 who~%float32 x~%float32 y~%float32 z~%int16 flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <positionFromDetectRGB>))
  (cl:+ 0
     1
     4
     4
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <positionFromDetectRGB>))
  "Converts a ROS message object to a list"
  (cl:list 'positionFromDetectRGB
    (cl:cons ':who (who msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':flag (flag msg))
))
