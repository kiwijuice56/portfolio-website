class_name DisableButton
extends Button

const fractal_scene: PackedScene = preload("res://main/FractalNavigation.tscn")
onready var fractal: FractalNavigation = get_node("../FractalNavigation")
var fractal_disabled: bool = false

func _ready() -> void:
	connect("pressed", self, "_on_pressed")

func _on_pressed() -> void:
	if not fractal_disabled:
		fractal.queue_free()
		text = "enable background"
	else:
		var new_fractal = fractal_scene.instance()
		get_parent().add_child(new_fractal)
		get_parent().move_child(new_fractal, 0)
		fractal = new_fractal
		text = "disable background"
	fractal_disabled = not fractal_disabled
