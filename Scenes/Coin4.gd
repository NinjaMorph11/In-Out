extends Area2D


@onready var self_awareness_rate = $"../../Self-Awareness Rate"
@onready var self_awareness_rate_label = $"../../Self-Awareness Rate/Self-Awareness Rate Label"


func _on_body_entered(body):
	self_awareness_rate.add_self_awarenessprogressbar()
	self_awareness_rate_label.text = "Where attention goes, energy flows."
	queue_free()
