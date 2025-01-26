extends CanvasLayer


var new_score = 0
var high_score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Score.text = "Your Score: " + str(new_score) + "m"
	$HighScore.text = "High Score: " + str(new_score) + "m"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display_score(high_sc, new_sc):
	
	$Score.text = "Your Score: " + str(new_sc) + "m"
	$HighScore.text = "High Score: " + str(high_sc) + "m"
	
	pass
