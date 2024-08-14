extends CharacterBody2D

func _process(_delta):
	# Move right only
	var direction = Vector2.RIGHT
	velocity = direction * 500
	move_and_slide()
