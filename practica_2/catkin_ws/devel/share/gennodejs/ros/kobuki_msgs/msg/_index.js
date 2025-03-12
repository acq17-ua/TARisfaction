
"use strict";

let DigitalOutput = require('./DigitalOutput.js');
let Sound = require('./Sound.js');
let VersionInfo = require('./VersionInfo.js');
let Led = require('./Led.js');
let DockInfraRed = require('./DockInfraRed.js');
let ButtonEvent = require('./ButtonEvent.js');
let BumperEvent = require('./BumperEvent.js');
let WheelDropEvent = require('./WheelDropEvent.js');
let MotorPower = require('./MotorPower.js');
let DigitalInputEvent = require('./DigitalInputEvent.js');
let CliffEvent = require('./CliffEvent.js');
let KeyboardInput = require('./KeyboardInput.js');
let RobotStateEvent = require('./RobotStateEvent.js');
let ControllerInfo = require('./ControllerInfo.js');
let SensorState = require('./SensorState.js');
let ExternalPower = require('./ExternalPower.js');
let ScanAngle = require('./ScanAngle.js');
let PowerSystemEvent = require('./PowerSystemEvent.js');
let AutoDockingActionResult = require('./AutoDockingActionResult.js');
let AutoDockingAction = require('./AutoDockingAction.js');
let AutoDockingActionFeedback = require('./AutoDockingActionFeedback.js');
let AutoDockingFeedback = require('./AutoDockingFeedback.js');
let AutoDockingResult = require('./AutoDockingResult.js');
let AutoDockingGoal = require('./AutoDockingGoal.js');
let AutoDockingActionGoal = require('./AutoDockingActionGoal.js');

module.exports = {
  DigitalOutput: DigitalOutput,
  Sound: Sound,
  VersionInfo: VersionInfo,
  Led: Led,
  DockInfraRed: DockInfraRed,
  ButtonEvent: ButtonEvent,
  BumperEvent: BumperEvent,
  WheelDropEvent: WheelDropEvent,
  MotorPower: MotorPower,
  DigitalInputEvent: DigitalInputEvent,
  CliffEvent: CliffEvent,
  KeyboardInput: KeyboardInput,
  RobotStateEvent: RobotStateEvent,
  ControllerInfo: ControllerInfo,
  SensorState: SensorState,
  ExternalPower: ExternalPower,
  ScanAngle: ScanAngle,
  PowerSystemEvent: PowerSystemEvent,
  AutoDockingActionResult: AutoDockingActionResult,
  AutoDockingAction: AutoDockingAction,
  AutoDockingActionFeedback: AutoDockingActionFeedback,
  AutoDockingFeedback: AutoDockingFeedback,
  AutoDockingResult: AutoDockingResult,
  AutoDockingGoal: AutoDockingGoal,
  AutoDockingActionGoal: AutoDockingActionGoal,
};
