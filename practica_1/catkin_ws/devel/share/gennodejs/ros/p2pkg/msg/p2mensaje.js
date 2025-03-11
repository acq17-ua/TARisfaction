// Auto-generated. Do not edit!

// (in-package p2pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class p2mensaje {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.numero = null;
      this.posicion = null;
      this.fecha = null;
    }
    else {
      if (initObj.hasOwnProperty('numero')) {
        this.numero = initObj.numero
      }
      else {
        this.numero = 0;
      }
      if (initObj.hasOwnProperty('posicion')) {
        this.posicion = initObj.posicion
      }
      else {
        this.posicion = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('fecha')) {
        this.fecha = initObj.fecha
      }
      else {
        this.fecha = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type p2mensaje
    // Serialize message field [numero]
    bufferOffset = _serializer.int32(obj.numero, buffer, bufferOffset);
    // Serialize message field [posicion]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.posicion, buffer, bufferOffset);
    // Serialize message field [fecha]
    bufferOffset = _serializer.string(obj.fecha, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type p2mensaje
    let len;
    let data = new p2mensaje(null);
    // Deserialize message field [numero]
    data.numero = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [posicion]
    data.posicion = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [fecha]
    data.fecha = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.fecha);
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'p2pkg/p2mensaje';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1e76c1ca9ea3c78b71e71cf7428e9560';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 numero
    geometry_msgs/Pose posicion
    string fecha
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new p2mensaje(null);
    if (msg.numero !== undefined) {
      resolved.numero = msg.numero;
    }
    else {
      resolved.numero = 0
    }

    if (msg.posicion !== undefined) {
      resolved.posicion = geometry_msgs.msg.Pose.Resolve(msg.posicion)
    }
    else {
      resolved.posicion = new geometry_msgs.msg.Pose()
    }

    if (msg.fecha !== undefined) {
      resolved.fecha = msg.fecha;
    }
    else {
      resolved.fecha = ''
    }

    return resolved;
    }
};

module.exports = p2mensaje;
