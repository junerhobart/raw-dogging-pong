extends CollisionShape2D

@onready var parent: Node2D = get_parent()
@onready var sprite: Sprite2D = parent.get_node("Sprite")

func _physics_process(_delta: float) -> void:
	if sprite.position != position:
		position = sprite.position
