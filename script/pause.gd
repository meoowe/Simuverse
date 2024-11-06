extends Node2D
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = true
		show()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()
