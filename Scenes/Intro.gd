extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Faded")
	await(get_tree().create_timer(6))
	$AnimationPlayer.play("Fade Out")
	await(get_tree().create_timer(3))
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
