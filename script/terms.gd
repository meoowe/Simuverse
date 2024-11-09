extends Panel

@onready var pause_screen: Control = $"../PauseScreen"

signal PlayTerms
signal StopTerms
signal PlayAccept

func _ready() -> void:
	PlayTerms.connect(Global._startTerms)
	StopTerms.connect(Global._stopTerms)
	PlayAccept.connect(Global._startAccept)
	PlayTerms.emit()
	await get_tree().create_timer(1).timeout
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_screen.show()
		get_tree().paused = true

func _on_agree_pressed():
	StopTerms.emit()
	PlayAccept.emit()
	await get_tree().create_timer(7).timeout
	get_tree().change_scene_to_file("res://game.tscn")
