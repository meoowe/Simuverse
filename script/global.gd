extends Node
var terminalNew:bool = true
var newGame:bool = true
var helpUsed = false
@export var version:String = "0.0.1-DEV-8.11.24"
@export var debug:bool = false
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

var music = load("res://assets/music/track1.wav")
var music2  = load("res://assets/music/otherTrack.mp3")
var musicAudio = AudioStreamPlaylist
var musicPlayer = AudioStreamPlayer.new()
var helpAudio = load("res://assets/narration/5help.mp3")
var helpPlayer = AudioStreamPlayer.new()
func _ready():
	_musicSetup()
	add_child(termsPlayer) 
	add_child(acceptPlayer) 
	add_child(missionPlayer)
	add_child(terminalPlayer)
	add_child(musicPlayer)
	add_child(helpPlayer)
	musicPlayer.play()
func _musicSetup():
	termsPlayer.stream = termsAudio
	termsPlayer.bus = "Narration"
	acceptPlayer.stream = acceptAudio
	acceptPlayer.bus = "Narration"
	missionPlayer.stream = missionAudio
	missionPlayer.bus = "Narration"
	terminalPlayer.stream = terminalAudio
	terminalPlayer.bus = "Narration"
	musicPlayer.stream = music
	musicPlayer.bus = "Music"
	helpPlayer.stream = helpAudio
	helpPlayer.bus = "Narration"
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
func _stopMission():
	missionPlayer.stop()
func _startHelp():
	helpPlayer.play()
func _wait(delay:float):
	await get_tree().create_timer(delay).timeout
