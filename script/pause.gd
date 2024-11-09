extends Control

func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_options_pressed() -> void:
	pass 
