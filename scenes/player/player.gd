extends CharacterBody2D

func _process(delta):
	
	# input for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary ability"):
		print("Shoot laser")
		
	
	# grenade shooting input
	if Input.is_action_pressed("secondary ability"):
		print("shoot grenade")
