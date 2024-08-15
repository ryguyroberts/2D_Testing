extends Node2D


# Preload Scene

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate():
	print("player has entered gate")


func _on_player_grenade():
	print("Grenade from player")


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	
	laser.position = pos
	# Update laser position
	
	# Move the laser
	
	# Add laser instance to a Node2D
	add_child(laser)
