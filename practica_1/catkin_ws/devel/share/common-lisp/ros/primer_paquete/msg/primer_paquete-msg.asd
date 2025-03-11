
(cl:in-package :asdf)

(defsystem "primer_paquete-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "miMensaje" :depends-on ("_package_miMensaje"))
    (:file "_package_miMensaje" :depends-on ("_package"))
  ))