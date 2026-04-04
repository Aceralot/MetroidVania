@icon("res://MetroidVania/state.svg")
class_name PlayerState extends Node2D

var player : Player
var next_state : PlayerState


#region /// state reference 
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
@onready var crouch: PlayerStateCrouch = %Crouch
#endregion

# What Happenes when this state is initialized?
func _init() -> void:
	pass



#What Happens When We Enter This State?
func enter() -> void:
	pass
	
	
#What Happens When We Exit This State?
func exit() -> void:
	pass





#What Happenes When An Input Is Pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	return next_state
	
	
	
	
	
	
#What Happens each process tick in This State
func process( _delta: float ) -> PlayerState:
	
	return next_state 
	
	
	
#What Happens each physics_process tick in This State
func physics_process( _delta: float ) -> PlayerState:
	return next_state 
	
	