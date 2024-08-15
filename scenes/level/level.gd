extends Node2D


# Preload Scene

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate():
	print("player has entered gate")


func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# Add laser instance to a Node2D
	$Projectiles.add_child(laser)
