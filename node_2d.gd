extends Node2D

var bubble_scene = preload("res://Bubble.tscn")
var width

var active_platforms = []
var time_left = 30

# Define signal
signal timer_countdown(time_left)
signal display_score(high_score, new_score)

func _ready() -> void:
	
	# Hide overlay
	$FinalScoreDisplay.visible = false
	
	width = get_viewport().size.x
	randomize()
	
	var y = 0
	
	while y > -800000:
		var new_bubble = bubble_scene.instantiate() # Instantiate scene
		
		var bubble_x = randf_range(-width / 2, width / 2)
		
		new_bubble.position = Vector2(bubble_x * 1.5,y)
		add_child(new_bubble)
		y -= randf_range(10,30)
	
	pass
	
func _process(delta):
	var player = $Player
	var player_y = player.position.y
	
	time_left -= delta
	
	# Countdown timer and signals to ui metric
	if time_left > 0:
		# Sends signal to update visual timer
		await emit_signal("timer_countdown", time_left)
			
		# Delay time reduction
		await get_tree().create_timer(1.0).timeout
	else:
		end_game()
		
# Checks high score and signals end screen
func end_game():
	
	# Pauses elements of the game
	set_process(false)
	$Player/Sprite2D.set_physics_process(false)
	
	# Hides player when scores come up
	$Player.visible = false
	
	# High Score File text retrieved
	var content = FileAccess.open("res://HighScore.txt", FileAccess.READ)
	var high_score = content.get_as_text()
	
	if int(high_score) < $HUD.height_distance:
		var file = FileAccess.open("res://HighScore.txt", FileAccess.WRITE)
		file.store_string(str($HUD.height_distance))
	
	$FinalScoreDisplay.visible = true
	$FinalScoreDisplay.inGame = false
	
	# Final Score screen displayed with score	
	$Player/Sprite2D.set_process(false)
	emit_signal("display_score", high_score, $HUD.height_distance)
		
