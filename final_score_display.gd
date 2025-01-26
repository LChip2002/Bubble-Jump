extends CanvasLayer


var new_score = 0
var high_score = 0
var inGame = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Score.text = "Your Score: " + str(new_score) + "m"
	$HighScore.text = "High Score: " + str(new_score) + "m"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if !inGame:
		# Start new game
		if Input.is_action_pressed("ui_c"):
			# Starts the game on button press
			get_tree().change_scene_to_file("res://Game.tscn")
			
		elif Input.is_action_just_pressed("ui_x"):
			# Back to main menu
			get_tree().change_scene_to_file("res://title_screen.tscn")

func display_score(high_sc, new_sc):
	
	new_score = new_sc
	high_score = high_sc
	
	$Score.text = "Your Score: " + str(new_score) + "m"
	$HighScore.text = "High Score: " + str(high_score) + "m"
	
