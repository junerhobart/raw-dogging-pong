extends AnimatableBody2D


var BoundOne: float = 100
var BoundTwo: float = 1050
var MousePositoion


func _ready():
	pass

func _process(_delta):
	MousePositoion = get_global_mouse_position()

	var NewPosition = position
	NewPosition.x = MousePositoion.x

	NewPosition.y = 600

	if NewPosition.x < BoundOne:
		NewPosition.x = BoundOne
	elif NewPosition.x > BoundTwo:
		NewPosition.x = BoundTwo

	position = NewPosition
