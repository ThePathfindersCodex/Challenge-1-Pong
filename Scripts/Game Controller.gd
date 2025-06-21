extends Node2D

var countdownAnim: AnimationPlayer
var ball:PackedScene = load("res://Scenes/ball.tscn")
signal resetPaddle

func _ready():
	ShowControls()
	StartGame()

func _process(delta):
	%ColorRect.material.set_shader_parameter("time",%ColorRect.material.get_shader_parameter("time") + delta) 
	
func StartGame():
	countdownAnim = get_tree().get_first_node_in_group("countdown animation")
	var paddles = get_tree().get_nodes_in_group("paddle")
	
	for paddle in paddles:
		connect("resetPaddle",paddle.reset)

	Global.P1_Score = 0
	Global.P2_Score = 0
	resetPaddle.emit()
	
	startNextRound()
	
func startNextRound():
	if(Global.P1_Score==5 or Global.P2_Score ==5):
		call_deferred("endGame")
		return
	countdownAnim.play("countdown")
	await countdownAnim.animation_finished
	spawnBall()
	

func endGame():
	get_tree().change_scene_to_file("res://Scenes/end screen.tscn")
	
func spawnBall():
	var newBall= ball.instantiate()
	newBall.global_position = get_viewport().get_visible_rect().size/2
	var direction = Vector2.from_angle(randf_range(0,359))
	newBall.launch(direction)
	get_tree().root.get_child(1).add_child(newBall)
	newBall.connect_speed_mon(self)
	ShowBallSpeed()

func ShowControls():
	var action_p1_up = OS.get_keycode_string(InputMap.action_get_events( "Up_1" )[0].physical_keycode)
	var action_p1_down = OS.get_keycode_string(InputMap.action_get_events( "Down_1" )[0].physical_keycode)
	var action_p2_up = OS.get_keycode_string(InputMap.action_get_events( "Up_2" )[0].physical_keycode)
	var action_p2_down = OS.get_keycode_string(InputMap.action_get_events( "Down_2" )[0].physical_keycode)

	%P1Controls.text = "Player 1\nPaddle Up ("+action_p1_up+")\nPaddle Down ("+action_p1_down+")"
	%P2Controls.text = "Player 2\nPaddle Up ("+action_p2_up+")\nPaddle Down ("+action_p2_down+")"

func ShowBallSpeed():
	var current_ball = get_tree().get_nodes_in_group("ball")[0]
	var cur_vel :float= current_ball.velocity.length()
	var def_vel :float= current_ball.speed
	var visual_size :float= cur_vel - def_vel + 1
	%BallSpeed.size.x = 20 + visual_size
	
