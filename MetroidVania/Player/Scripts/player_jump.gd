class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450






# What Happenes when this state is initialized?
func _init() -> void:
	pass



#What Happens When We Enter This State?
func enter() -> void:
	#Play Animation
	player.animation_player.play( "jump" )
	player.animation_player.pause()
	player.add_debug_indicator( Color.LIME_GREEN )
	player.velocity.y = -jump_velocity
	
	
	# Check If This Is A Buffer Jump
	# If It Is, Handle Jumo Button Condition retroactively
	if player.previous_state == fall and not Input.is_action_pressed( "jump" ):
		await get_tree().physics_frame
		player.velocity.y *= 0.5
		player.change_state( fall )
	
	pass
	
	
#What Happens When We Exit This State?
func exit() -> void:
	player.add_debug_indicator( Color.YELLOW )
	pass





#What Happenes When An Input Is Pressed?
func handle_input( event : InputEvent ) -> PlayerState:
	#Handles Input
	if event.is_action_released( "jump" ):
		player.velocity.y *= 0.5
		return fall
	return next_state
	
	
	
	
	
	
#What Happens each process tick in This State
func process( _delta: float ) -> PlayerState:
	set_jump_frame()
	return next_state 
	
	
	
#What Happens each physics_process tick in This State
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		return idle
	elif player.velocity.y >= 0:
		return fall
	player.velocity.x = player.direction.x * player.move_speed
	return next_state 
	
	
	
	
	
	
func set_jump_frame() -> void:
	var frame : float = remap( player.velocity.y, -jump_velocity, 0.0, 0.0, 0.5 )
	player.animation_player.seek( frame, true )
	pass
