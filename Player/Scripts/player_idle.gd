class_name PlayerStateIdle extends PlayerState




# What Happenes when this state is initialized?
func _init() -> void:
	pass



#What Happens When We Enter This State?
func enter() -> void:
	#Play Animation
	player.animation_player.play("idle")
	pass
	
	
#What Happens When We Exit This State?
func exit() -> void:
	
	pass





#What Happenes When An Input Is Pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	#Handles Input
	if _event.is_action_pressed( "jump"):
		return jump
	return next_state
	
	
	
	
	
	
#What Happens each process tick in This State
func process( _delta: float ) -> PlayerState:
	if player.direction.x !=0:
		return run
	elif player.direction.y >0.5:
		return crouch
	return next_state 
	
	
	
#What Happens each physics_process tick in This State
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x = 0
	if player.is_on_floor() == false:
		return fall
	return next_state 
	
	