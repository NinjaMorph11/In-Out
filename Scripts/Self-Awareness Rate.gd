extends Node

var score = 0 # Setting the variable of our score (Self-Awareness Rate)
@onready var self_awareness_rate_label = $"Self-Awareness Rate Label"
@onready var progress_bar = $ProgressBar

func add_self_awarenessprogressbar():
	progress_bar.value += 25
	
