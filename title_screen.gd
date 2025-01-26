extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Displays High score on main menu
	var content = FileAccess.open("res://HighScore.txt", FileAccess.READ)
	var high_score = content.get_as_text()
	
	$High_Score.text = "High Score:  " + high_score
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_z"):
		
		# Starts the game on button press
		get_tree().change_scene_to_file("res://Game.tscn")
		pass
