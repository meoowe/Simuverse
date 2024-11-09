extends Label
@onready var line_end: AudioStreamPlayer = $"../lineEnd"


@onready var type: AudioStreamPlayer = $"../type"
@onready var label: Label = $"."
@export var between_time: float = 0.6
@export var start_delay:float = 2

var maxSize = 15
@export var sizeIncerement = 1
func wait() -> void:
	await get_tree().create_timer(between_time).timeout
func addText(appendtext:String) -> void:
	label.text = label.text + appendtext

func _ready() -> void:
	await get_tree().create_timer(start_delay).timeout
	addText("H")
	 
	await wait()
	addText("e")
	 
	await wait()
	addText("l")
	 
	await wait()
	addText("l")
	 
	await wait()
	addText("o")
	 
	await wait()
	addText(".")
