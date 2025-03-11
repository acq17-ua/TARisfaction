;; Auto-generated. Do not edit!


(when (boundp 'servicio_suma::AddTwoInts)
  (if (not (find-package "SERVICIO_SUMA"))
    (make-package "SERVICIO_SUMA"))
  (shadow 'AddTwoInts (find-package "SERVICIO_SUMA")))
(unless (find-package "SERVICIO_SUMA::ADDTWOINTS")
  (make-package "SERVICIO_SUMA::ADDTWOINTS"))
(unless (find-package "SERVICIO_SUMA::ADDTWOINTSREQUEST")
  (make-package "SERVICIO_SUMA::ADDTWOINTSREQUEST"))
(unless (find-package "SERVICIO_SUMA::ADDTWOINTSRESPONSE")
  (make-package "SERVICIO_SUMA::ADDTWOINTSRESPONSE"))

(in-package "ROS")





(defclass servicio_suma::AddTwoIntsRequest
  :super ros::object
  :slots (_a _b _c _d _e ))

(defmethod servicio_suma::AddTwoIntsRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    ((:c __c) 0)
    ((:d __d) 0)
    ((:e __e) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   (setq _c (round __c))
   (setq _d (round __d))
   (setq _e (round __e))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:e
   (&optional __e)
   (if __e (setq _e __e)) _e)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ;; int64 _b
    8
    ;; int64 _c
    8
    ;; int64 _d
    8
    ;; int64 _e
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;; int64 _b
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _b (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _b) (= (length (_b . bv)) 2)) ;; bignum
              (write-long (ash (elt (_b . bv) 0) 0) s)
              (write-long (ash (elt (_b . bv) 1) -1) s))
             ((and (class _b) (= (length (_b . bv)) 1)) ;; big1
              (write-long (elt (_b . bv) 0) s)
              (write-long (if (>= _b 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _b s)(write-long (if (>= _b 0) 0 #xffffffff) s)))
     ;; int64 _c
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _c (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _c) (= (length (_c . bv)) 2)) ;; bignum
              (write-long (ash (elt (_c . bv) 0) 0) s)
              (write-long (ash (elt (_c . bv) 1) -1) s))
             ((and (class _c) (= (length (_c . bv)) 1)) ;; big1
              (write-long (elt (_c . bv) 0) s)
              (write-long (if (>= _c 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _c s)(write-long (if (>= _c 0) 0 #xffffffff) s)))
     ;; int64 _d
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _d (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _d) (= (length (_d . bv)) 2)) ;; bignum
              (write-long (ash (elt (_d . bv) 0) 0) s)
              (write-long (ash (elt (_d . bv) 1) -1) s))
             ((and (class _d) (= (length (_d . bv)) 1)) ;; big1
              (write-long (elt (_d . bv) 0) s)
              (write-long (if (>= _d 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _d s)(write-long (if (>= _d 0) 0 #xffffffff) s)))
     ;; int64 _e
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _e (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _e) (= (length (_e . bv)) 2)) ;; bignum
              (write-long (ash (elt (_e . bv) 0) 0) s)
              (write-long (ash (elt (_e . bv) 1) -1) s))
             ((and (class _e) (= (length (_e . bv)) 1)) ;; big1
              (write-long (elt (_e . bv) 0) s)
              (write-long (if (>= _e 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _e s)(write-long (if (>= _e 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _b
#+(or :alpha :irix6 :x86_64)
      (setf _b (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _b (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _c
#+(or :alpha :irix6 :x86_64)
      (setf _c (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _c (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _d
#+(or :alpha :irix6 :x86_64)
      (setf _d (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _d (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _e
#+(or :alpha :irix6 :x86_64)
      (setf _e (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _e (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass servicio_suma::AddTwoIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod servicio_suma::AddTwoIntsResponse
  (:init
   (&key
    ((:sum __sum) 0.0)
    )
   (send-super :init)
   (setq _sum (float __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; float64 _sum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _sum
       (sys::poke _sum (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _sum
     (setq _sum (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass servicio_suma::AddTwoInts
  :super ros::object
  :slots ())

(setf (get servicio_suma::AddTwoInts :md5sum-) "cbd4a8c6946e5d7f55cf33359fe5fbdf")
(setf (get servicio_suma::AddTwoInts :datatype-) "servicio_suma/AddTwoInts")
(setf (get servicio_suma::AddTwoInts :request) servicio_suma::AddTwoIntsRequest)
(setf (get servicio_suma::AddTwoInts :response) servicio_suma::AddTwoIntsResponse)

(defmethod servicio_suma::AddTwoIntsRequest
  (:response () (instance servicio_suma::AddTwoIntsResponse :init)))

(setf (get servicio_suma::AddTwoIntsRequest :md5sum-) "cbd4a8c6946e5d7f55cf33359fe5fbdf")
(setf (get servicio_suma::AddTwoIntsRequest :datatype-) "servicio_suma/AddTwoIntsRequest")
(setf (get servicio_suma::AddTwoIntsRequest :definition-)
      "int64 a
int64 b
int64 c
int64 d
int64 e
---
float64 sum

")

(setf (get servicio_suma::AddTwoIntsResponse :md5sum-) "cbd4a8c6946e5d7f55cf33359fe5fbdf")
(setf (get servicio_suma::AddTwoIntsResponse :datatype-) "servicio_suma/AddTwoIntsResponse")
(setf (get servicio_suma::AddTwoIntsResponse :definition-)
      "int64 a
int64 b
int64 c
int64 d
int64 e
---
float64 sum

")



(provide :servicio_suma/AddTwoInts "cbd4a8c6946e5d7f55cf33359fe5fbdf")


