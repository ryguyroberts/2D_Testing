extends CharacterBody2D

var can_laser: bool = true;
var can_grenade: bool = true;

signal laser(position)
signal grenade

func _process(_delta):
	
	# input for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary ability") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		# Laser shoot delay
		can_laser = false
		$LaserDelay.start()
		laser.emit(selected_laser.global_position)
		# Emit the position
		
	
	# grenade shooting input
	if Input.is_action_pressed("secondary ability") and can_grenade:
		# Grenade shoot delay
		can_grenade = false
		$GrenadeDelay.start()
		grenade.emit()


func _on_laser_delay_timeout():
	can_laser = true


func _on_grenade_delay_timeout():
	can_grenade = true
