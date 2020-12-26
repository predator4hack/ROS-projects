; Auto-generated. Do not edit!


(cl:in-package path_navigation_msgs-msg)


;//! \htmlinclude TransformPathExecutionActionGoal.msg.html

(cl:defclass <TransformPathExecutionActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type path_navigation_msgs-msg:TransformPathExecutionGoal
    :initform (cl:make-instance 'path_navigation_msgs-msg:TransformPathExecutionGoal)))
)

(cl:defclass TransformPathExecutionActionGoal (<TransformPathExecutionActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TransformPathExecutionActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TransformPathExecutionActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_navigation_msgs-msg:<TransformPathExecutionActionGoal> is deprecated: use path_navigation_msgs-msg:TransformPathExecutionActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TransformPathExecutionActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_navigation_msgs-msg:header-val is deprecated.  Use path_navigation_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <TransformPathExecutionActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_navigation_msgs-msg:goal_id-val is deprecated.  Use path_navigation_msgs-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <TransformPathExecutionActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_navigation_msgs-msg:goal-val is deprecated.  Use path_navigation_msgs-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TransformPathExecutionActionGoal>) ostream)
  "Serializes a message object of type '<TransformPathExecutionActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TransformPathExecutionActionGoal>) istream)
  "Deserializes a message object of type '<TransformPathExecutionActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TransformPathExecutionActionGoal>)))
  "Returns string type for a message object of type '<TransformPathExecutionActionGoal>"
  "path_navigation_msgs/TransformPathExecutionActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TransformPathExecutionActionGoal)))
  "Returns string type for a message object of type 'TransformPathExecutionActionGoal"
  "path_navigation_msgs/TransformPathExecutionActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TransformPathExecutionActionGoal>)))
  "Returns md5sum for a message object of type '<TransformPathExecutionActionGoal>"
  "f079496ab3986808d6711b0673b28cb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TransformPathExecutionActionGoal)))
  "Returns md5sum for a message object of type 'TransformPathExecutionActionGoal"
  "f079496ab3986808d6711b0673b28cb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TransformPathExecutionActionGoal>)))
  "Returns full string definition for message of type '<TransformPathExecutionActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%TransformPathExecutionGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: path_navigation_msgs/TransformPathExecutionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Execute a series of geometry_msgs/Transform points instead of~%# using a nav_msgs/Path.~% ~%Header header~%~%geometry_msgs/Transform[] transforms~%~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TransformPathExecutionActionGoal)))
  "Returns full string definition for message of type 'TransformPathExecutionActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%TransformPathExecutionGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: path_navigation_msgs/TransformPathExecutionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Execute a series of geometry_msgs/Transform points instead of~%# using a nav_msgs/Path.~% ~%Header header~%~%geometry_msgs/Transform[] transforms~%~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TransformPathExecutionActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TransformPathExecutionActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TransformPathExecutionActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
