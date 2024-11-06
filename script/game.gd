extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var pause_screen: Node2D = $PauseScreen

signal PlayMission
func _ready() -> void:
	PlayMission.connect(Global._startMission)
	await get_tree().create_timer(1).timeout
	PlayMission.emit()
	animation_player.play("fade")


func _on_computer_pressed() -> void:
	get_tree().change_scene_to_file("res://terminal.tscn")
