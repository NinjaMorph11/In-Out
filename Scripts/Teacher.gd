extends Node2D

@onready var interaction_area = $InteractionArea
@onready var animated_sprite_2d = $AnimatedSprite2D


const lines: Array[String] = ["Hey There!"]
			
# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "on_interact")


func  _on_interact():
	DialogueManager.start_dialog(global_position, lines)
	await DialogueManager.dialog_finished
	 
