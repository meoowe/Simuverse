extends Panel

signal PlayTerms
signal StopTerms
signal PlayAccept

func _ready() -> void:
	PlayTerms.connect(Global._startTerms)
	StopTerms.connect(Global._stopTerms)
	PlayAccept.connect(Global._startAccept)
	PlayTerms.emit()
	await get_tree().create_timer(1).timeout


func _on_agree_pressed():
	StopTerms.emit()
	PlayAccept.emit()
	await get_tree().create_timer(7).timeout
	get_tree().change_scene_to_file("res://game.tscn")
