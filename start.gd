extends Control


@onready var animation_player: AnimationPlayer = $HBoxContainer/VBoxContainer/AnimationPlayer

@onready var skip: Label = $skip

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://terms.tscn")
func _ready() -> void:
	animation_player.play("fade")
	if Global.debug:
		get_tree().change_scene_to_file("res://game.tscn")
func _input(event):
	if event.is_action_pressed("click"):
		get_tree().change_scene_to_file("res://terms.tscn")
