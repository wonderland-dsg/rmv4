
(cl:in-package :asdf)

(defsystem "cone_detector-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "positionFromDetectRGB" :depends-on ("_package_positionFromDetectRGB"))
    (:file "_package_positionFromDetectRGB" :depends-on ("_package"))
  ))