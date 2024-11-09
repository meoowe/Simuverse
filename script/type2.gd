extends Label
@onready var line_end: AudioStreamPlayer = $"../lineEnd"
@onready var type: AudioStreamPlayer = $"../type"
@onready var label: Label = $"."
@onready var label2: Label = $"../Label"
@onready var simulation: Label = $"../simulation"
@onready var button: Button = $"../Button"

@export var between_time: float = 0.6
@export var start_delay:float = 9
var maxSize = 15
@export var sizeIncerement = 1
func wait() -> void:
	await get_tree().create_timer(between_time).timeout
func addText(text:String) -> void:
	label.text = label.text + text
	type.play()
	await wait()

func _ready() -> void:
	await get_tree().create_timer(start_delay).timeout
	await addText("I ")
	await addText("h")
	await addText("a")
	await addText("v")
	await addText("e")
	await addText(" t")
	await addText("o ")
	await addText("s")
	await addText("a")
	await addText("y ")
	await addText("s")
	await addText("o")
	await addText("m")
	await addText("e")
	await addText("t")
	await addText("h")
	await addText("i")
	await addText("n")
	await addText("g")
	await addText(".")
	line_end.play()
	label.hide()
	label2.hide()
	await get_tree().create_timer(2).timeout
	simulation.show()
	await get_tree().create_timer(2).timeout
	button.show()
	
