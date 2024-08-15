extends CharacterBody2D

var can_laser: bool = true;
var can_grenade: bool = true;

signal laser(position, direction)
signal grenade(position, direction)

func _process(_delta):
	
	# Variables
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# input for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	#laser shooting input
	if Input.is_action_pressed("primary ability") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		# Laser shoot delay
		can_laser = false
		$LaserDelay.start()
		laser.emit(selected_laser.global_position, player_direction)
		# Emit the position
		
	
	# grenade shooting input
	if Input.is_action_pressed("secondary ability") and can_grenade:
		var pos = $LaserStartPositions.get_children()[0].global_position
		# Grenade shoot delay
		can_grenade = false
		$GrenadeDelay.start()
		grenade.emit(pos, player_direction)


func _on_laser_delay_timeout():
	can_laser = true


func _on_grenade_delay_timeout():
	can_grenade = true
