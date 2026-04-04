class_name PlayerStateCrouch extends PlayerState

@export var deceleration_rate : float = 10


# What Happenes when this state is initialized?
func _init() -> void:
	pass



#What Happens When We Enter This State?
func enter() -> void:
	#Play Animation
	player.animation_player.play( "crouch" )
	player.collision_stand.disabled = true
	player.collision_crouch.disabled = false
	#player.sprite.scale.y = 0.6
	pass
	
	
#What Happens When We Exit This State?
func exit() -> void:
	player.collision_stand.disabled = false
	player.collision_crouch.disabled = true
	#player.sprite.scale.y = 1
	pass





#What Happenes When An Input Is Pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	#Handles Input
	if _event.is_action_pressed( "jump"):
		player.one_way_platform_shape_cast.force_shapecast_update()
		if player.one_way_platform_shape_cast.is_colliding() == true:
			player.position.y += 4
			return fall
		return jump
	return next_state
	
	
	
	
	
	
#What Happens each process tick in This State
func process( _delta: float ) -> PlayerState:
	if player.direction.y <= 0.5:
		return idle
	return next_state 
	
	
	
#What Happens each physics_process tick in This State
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x -= player.velocity.x * deceleration_rate * _delta
	if player.is_on_floor() == false:
		return fall
	return next_state 
	
	
