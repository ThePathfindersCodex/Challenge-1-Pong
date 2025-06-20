extends CharacterBody2D

@export var paddleID: int =1
var speed: int =10
@onready var paddleSprite :Sprite2D = $Sprite2D

func _ready():
	if(paddleID == 1):
		paddleSprite.texture = load("res://Sprites/Paddle 1.png")
	elif(paddleID == 2):
		paddleSprite.texture = load("res://Sprites/Paddle 2.png")
	else:
		printerr("The paddleID has been assigned to something other that 1 or 2, whoops!")

func _process(_delta):
	if(Input.is_action_pressed("Up_" + str(paddleID))):
		global_position.y -= speed
		
	if(Input.is_action_pressed("Down_" + str(paddleID))):
		global_position.y += speed
		
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -80)

func reset():
	global_position.y = get_viewport_rect().size.y /2
