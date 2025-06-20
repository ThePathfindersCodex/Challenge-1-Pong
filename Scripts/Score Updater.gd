extends Label

@export var playerID:int = 1

# This function is called every frame, many times a second.
func _process(_delta):
	if(playerID ==1):
		text = "Red: " + str(Global.P1_Score)
	elif(playerID == 2):
		text = "Blue: "+ str(Global.P2_Score)
	else:
		printerr("The playerID of ", name, " is incorrect.")
		
		
