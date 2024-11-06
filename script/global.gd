extends Node
var terminalNew:bool = true
var newGame:bool = true
# Autoload for music
# Music controller
var termsAudio = load("res://assets/narration/1Terms.mp3")
var termsPlayer = AudioStreamPlayer.new()

var acceptAudio = load("res://assets/narration/2accept.mp3")
var acceptPlayer = AudioStreamPlayer.new()

var missionAudio = load("res://assets/narration/3mission.mp3")
var missionPlayer = AudioStreamPlayer.new()

var terminalAudio = load("res://assets/narration/4terminal.mp3")
var terminalPlayer = AudioStreamPlayer.new()
func _ready():
	_musicSetup()
	add_child(termsPlayer) 
	add_child(acceptPlayer) 
	add_child(missionPlayer)
	add_child(terminalPlayer)
func _musicSetup():
	termsPlayer.stream = termsAudio
	acceptPlayer.stream = acceptAudio
	missionPlayer.stream = missionAudio
	terminalPlayer.stream = terminalAudio
func _startTerms():
	termsPlayer.play()
func _startAccept():
	acceptPlayer.play()
func _startMission():
	missionPlayer.play()
func _stopTerms():
	termsPlayer.stop()
func _startTerminal():
	print("c")
	terminalPlayer.play()
