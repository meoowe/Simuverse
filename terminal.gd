extends Control
signal PlayTerminal
signal StopTerminal
signal PlayHelp
@onready var pause_screen: Control = $PauseScreen
@onready var line: LineEdit = $Panel/line
@onready var out: Label = $Panel/out
@onready var history: Label = $Panel/history
@onready var past_command: Label = $Panel/pastCommand

var first = true
func _ready() -> void:
	PlayTerminal.connect(Global._startTerminal)
	PlayHelp.connect(Global._startHelp)
	if !Global.terminalNew:
		print("g")
	else:
		PlayTerminal.emit()
var commands = ["hello", "exit", "help", "version", "volume"]

func _on_text_edit_text_submitted(new_text: String) -> void:
	line.clear()
	var command = new_text.to_lower()
	command = command.strip_edges(true,true)
	var splitCommand = command.split(" ")
	print(splitCommand[0])
	if commands.has(splitCommand[0]):
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
		elif splitCommand[0] == "volume":
			var bus_name = splitCommand[1]
			if splitCommand[1] == null:
				out.text = "Possible Options: Master, Music or Narration"
			elif bus_name == "master":
				bus_name = "Master"
			elif bus_name == "music":
				bus_name = "Music"
			var bus_index: int = AudioServer.get_bus_index(bus_name)
			var volume = splitCommand[2]
			if volume == null:
				out.text = "Volume of " + bus_name + " is " + db_to_linear(AudioServer.get_bus_volume_db(bus_index)) / 100
			volume = float(volume) / 100
			AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume))
			out.text = bus_name + " volume has been changed to " + str(volume * 100) + "%(" + str(linear_to_db(volume)) + " db)."
	else: 
		out.text = "I'm sorry, I don't know that command"
	first = false
	past_command.text = command
	history.text = out.text
	out.text = ""
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_screen.show()
		get_tree().paused = true
