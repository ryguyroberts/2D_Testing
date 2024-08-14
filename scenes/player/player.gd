extends CharacterBody2D

var can_laser: bool = true;
var can_grenade: bool = true;

signal laser
signal grenade

func _process(_delta):
	
	# input for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary ability") and can_laser:
		print("Shoot laser")
		laser.emit()
		# Laser shoot delay
		can_laser = false
		$LaserDelay.start()
		
	
	# grenade shooting input
	if Input.is_action_pressed("secondary ability") and can_grenade:
		print("shoot grenade")
		grenade.emit()
		# Grenade shoot delay
		$GrenadeDelay.start()
		can_grenade = false


func _on_laser_delay_timeout():
	can_laser = true


func _on_grenade_delay_timeout():
	can_grenade = true
