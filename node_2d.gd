extends Node2D

var bubble_scene = preload("res://Bubble.tscn")
var width

var active_platforms = []
var time_left = 30

# Define signal
signal timer_countdown(time_left)

func on_player_died():
	show_game_over()
	
func show_game_over():
	get_tree().paused
	pass

# This function will be called every time the spawn timer times out
func _on_timer_timeout() -> void:
	#if not is_player_alive():
		#return  # Don't spawn if the player is dead
		pass
	


func _ready() -> void:
	
	width = get_viewport().size.x
	randomize()
	
	 # Get reference to the player node
	# player = get_node(player_path)
	
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
	
	if time_left > 0:
		# Countdown timer and signals to ui metric
		# Sends signal to update visual timer
		await emit_signal("timer_countdown", time_left)
			
		# Delay time reduction
		await get_tree().create_timer(1.0).timeout
		

		
