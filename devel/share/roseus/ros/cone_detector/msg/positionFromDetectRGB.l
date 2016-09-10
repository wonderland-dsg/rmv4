;; Auto-generated. Do not edit!


(when (boundp 'cone_detector::positionFromDetectRGB)
  (if (not (find-package "CONE_DETECTOR"))
    (make-package "CONE_DETECTOR"))
  (shadow 'positionFromDetectRGB (find-package "CONE_DETECTOR")))
(unless (find-package "CONE_DETECTOR::POSITIONFROMDETECTRGB")
  (make-package "CONE_DETECTOR::POSITIONFROMDETECTRGB"))

(in-package "ROS")
;;//! \htmlinclude positionFromDetectRGB.msg.html


(defclass cone_detector::positionFromDetectRGB
  :super ros::object
  :slots (_who _x _y _z _flag ))

(defmethod cone_detector::positionFromDetectRGB
  (:init
   (&key
    ((:who __who) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:flag __flag) 0)
    )
   (send-super :init)
   (setq _who (round __who))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _flag (round __flag))
   self)
  (:who
   (&optional __who)
   (if __who (setq _who __who)) _who)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:serialization-length
   ()
   (+
    ;; int8 _who
    1
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; int16 _flag
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _who
       (write-byte _who s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _flag
       (write-word _flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _who
     (setq _who (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _who 127) (setq _who (- _who 256)))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _flag
     (setq _flag (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get cone_detector::positionFromDetectRGB :md5sum-) "876ca217fcc53faec876347db09a50ba")
(setf (get cone_detector::positionFromDetectRGB :datatype-) "cone_detector/positionFromDetectRGB")
(setf (get cone_detector::positionFromDetectRGB :definition-)
      "int8 who
float32 x
float32 y
float32 z
int16 flag

")



(provide :cone_detector/positionFromDetectRGB "876ca217fcc53faec876347db09a50ba")


