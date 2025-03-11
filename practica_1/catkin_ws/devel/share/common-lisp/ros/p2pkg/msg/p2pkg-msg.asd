
(cl:in-package :asdf)

(defsystem "p2pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "p2mensaje" :depends-on ("_package_p2mensaje"))
    (:file "_package_p2mensaje" :depends-on ("_package"))
  ))