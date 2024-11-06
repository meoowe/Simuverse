extends Node2D
signal PlayTerminal
@onready var out: Label = $out

func _ready() -> void:
	PlayTerminal.connect(Global._startTerminal)
	if !Global.terminalNew:
		print("g")
	else:
		PlayTerminal.emit()

var commands = ["hello", "exit", "help"]

func _on_text_edit_text_submitted(new_text: String) -> void:
	var command = new_text.to_lower()
	if commands.has(command):
		if command == "hello":
			out.text = "Hello There! It looks as if you've already learnt how to use the terminal. Good For You!"
		elif command == "exit":
			out.text = "Goodbye!"
			get_tree().change_scene_to_file("res://game.tscn")
		elif command == "help":
			out.text = "You ain't getting no help round these lands. You only SUFFER."
	else: 
		out.text = "I'm sorry, I don't know that command"
