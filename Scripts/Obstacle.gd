extends Node2D

var rot_speed: float = .03
var move_speed: float = 1.0

var default_pos: Vector2 = Vector2(0,0)
var move_dir: int = 1

func _ready() -> void:
	default_pos = global_position
	
func _process(_delta: float) -> void:
	rotation += rot_speed
	if (rotation >= 360):
		rotation==0
		
	global_position.y += move_speed * move_dir
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -60)
	if (global_position.y == 80 || global_position.y == get_viewport_rect().size.y - 60):
		move_dir *= -1

func reset():
	rotation = 0
	global_position = default_pos
	move_dir = 1
