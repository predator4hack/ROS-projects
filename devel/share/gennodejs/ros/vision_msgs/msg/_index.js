
"use strict";

let ObjectHypothesis = require('./ObjectHypothesis.js');
let Detection3D = require('./Detection3D.js');
let VisionInfo = require('./VisionInfo.js');
let Classification3D = require('./Classification3D.js');
let BoundingBox3D = require('./BoundingBox3D.js');
let BoundingBox3DArray = require('./BoundingBox3DArray.js');
let Detection3DArray = require('./Detection3DArray.js');
let Detection2D = require('./Detection2D.js');
let BoundingBox2D = require('./BoundingBox2D.js');
let Classification2D = require('./Classification2D.js');
let Detection2DArray = require('./Detection2DArray.js');
let ObjectHypothesisWithPose = require('./ObjectHypothesisWithPose.js');

module.exports = {
  ObjectHypothesis: ObjectHypothesis,
  Detection3D: Detection3D,
  VisionInfo: VisionInfo,
  Classification3D: Classification3D,
  BoundingBox3D: BoundingBox3D,
  BoundingBox3DArray: BoundingBox3DArray,
  Detection3DArray: Detection3DArray,
  Detection2D: Detection2D,
  BoundingBox2D: BoundingBox2D,
  Classification2D: Classification2D,
  Detection2DArray: Detection2DArray,
  ObjectHypothesisWithPose: ObjectHypothesisWithPose,
};
