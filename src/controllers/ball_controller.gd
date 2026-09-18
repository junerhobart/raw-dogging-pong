extends CharacterBody2D

var SPEED: float = 200.0
var Velocity: Vector2 = Vector2(1, 1)
var BOUNDS_OFFSET: float = 25.0

var Bounds: Rect2

func _ready() -> void:
	Bounds = get_viewport_rect()


func bounce() -> void:
	Velocity.y = - Velocity.y


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(Velocity * SPEED * delta)
	if collision:
		Velocity = Velocity.bounce(collision.get_normal())

	var NewPosition = position
	if NewPosition.y <= Bounds.position.y + BOUNDS_OFFSET:
		NewPosition.y = Bounds.position.y + BOUNDS_OFFSET
		if Velocity.y < 0:
			bounce()
	elif NewPosition.y >= Bounds.end.y - BOUNDS_OFFSET:
		NewPosition.y = Bounds.end.y - BOUNDS_OFFSET
		if Velocity.y > 0:
			bounce()

	if NewPosition.x <= Bounds.position.x + BOUNDS_OFFSET:
		NewPosition.x = Bounds.position.x + BOUNDS_OFFSET
		if Velocity.x < 0:
			Velocity.x = - Velocity.x
	elif NewPosition.x >= Bounds.end.x - BOUNDS_OFFSET:
		NewPosition.x = Bounds.end.x - BOUNDS_OFFSET
		if Velocity.x > 0:
			Velocity.x = - Velocity.x

	position = NewPosition
