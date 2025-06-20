extends Label

#Called when the winner label is loaded into the scene
func _ready():
	if(Global.P1_Score > Global.P2_Score):
		text= "Red Wins!"
	else:
		text= "Blue Wins!"
