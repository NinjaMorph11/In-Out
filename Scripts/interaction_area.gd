extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@onready var label = $"../Label"

var interact: Callable = func():
	pass
	
func _on_body_entered(body):
	print("Is it working?")
	label.visible = true
	get_tree().change_scene_to_file("res://Scenes/Quiz.tscn")
	#InteractionManager.register_area(self)
	pass


func _on_body_exited(body):
	print("THe body is out")
	label.visible = false
	pass
	#InteractionManager.unregister_area(self)
