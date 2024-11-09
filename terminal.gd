extends Node2D
signal PlayTerminal
signal StopTerminal
signal PlayHelp
@onready var pause_screen: Node2D = $PauseScreen

@onready var out: Label = $out

func _ready() -> void:
	PlayTerminal.connect(Global._startTerminal)
	PlayHelp.connect(Global._startHelp)
	if !Global.terminalNew:
		print("g")
	else:
		PlayTerminal.emit()

var commands = ["hello", "exit", "help", "version"]

func _on_text_edit_text_submitted(new_text: String) -> void:
	var command = new_text.to_lower()
	command = command.strip_edges(true,true)
	if commands.has(command):
		if command == "hello":
			out.text = "Hello There! It looks as if you've already learnt how to use the terminal. Good For You! To find out more commands, try typing help"
		elif command == "exit":
			out.text = "Goodbye!"
			StopTerminal.emit()
			get_tree().change_scene_to_file("res://game.tscn")
		elif command == "help":
			out.text = "Possible commands are: " + str(commands) + "."
			PlayHelp.emit()
		elif command == "version":
			out.text = Global.version
	else: 
		out.text = "I'm sorry, I don't know that command"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_screen.show()
		get_tree().paused = true
