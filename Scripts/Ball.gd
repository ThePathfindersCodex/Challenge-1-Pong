extends CharacterBody2D

var speed:int = 500
signal velocityChanged

func launch(direction:Vector2):
	velocity = direction * speed

func connect_speed_mon(n):
	connect("velocityChanged",n.ShowBallSpeed)

func _process(delta):
	var collision = move_and_collide(velocity*delta)
	if (collision):
		if !%AudioStreamPlayer.playing:
			%AudioStreamPlayer.play()
		
		velocity = velocity.bounce(collision.get_normal()) * 1.01
		velocityChanged.emit()
		
