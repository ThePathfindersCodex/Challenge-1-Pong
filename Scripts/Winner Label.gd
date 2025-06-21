extends Label

#Called when the winner label is loaded into the scene
func _ready():
	if(Global.P1_Score > Global.P2_Score):
		text= "Red Wins!"
		label_settings.outline_color=Color.RED
	else:
		text= "Blue Wins!"
		label_settings.outline_color=Color.BLUE
