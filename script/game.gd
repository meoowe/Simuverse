extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var pause_screen: Control = $PauseScreen

signal PlayMission
signal StopMission
func _ready() -> void:
	if Global.newGame:
		PlayMission.connect(Global._startMission)
		StopMission.connect(Global._stopMission)
		await get_tree().create_timer(1).timeout
		PlayMission.emit()
		animation_player.play("fade")
		Global.newGame = false
func _on_computer_pressed() -> void:
	StopMission.emit()
	get_tree().change_scene_to_file("res://terminal.tscn")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_screen.show()
		get_tree().paused = true
