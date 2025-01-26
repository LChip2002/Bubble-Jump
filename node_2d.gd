extends Node2D

var bubble_scene = preload("res://Bubble.tscn")
var width
var spawn_timer: Timer
var game_countdown: Timer
var active_platforms = []
var spawn_y = 0 # Tracks highest y coordinate where platforms are spawned

func on_player_died():
	show_game_over()
	
func show_game_over():
	get_tree().paused
	pass

# This function will be called every time the spawn timer times out
func _on_timer_timeout() -> void:
	#if not is_player_alive():
		#return  # Don't spawn if the player is dead
	
	spawn_bubble()

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
	
	# Spawn platforms above player if necessary
	while spawn_y > player_y - 800:
		spawn_bubble()
		spawn_y -= 150
		
	# Remove platforms below the screen
	for platform in active_platforms:
		if platform.position.y > player_y + 600: # If off screen
			active_platforms.erase(platform)
			platform.queue_free()
	
# Function to spawn a bubble
func spawn_bubble():
	
	var death = false
		
	while death == false:
	
		# TODO - Check player condition and exit
		
		await get_tree().create_timer(1.0).timeout # waits for 1 second
		var r = 0
		# Adds new set of bubbles
		while r > -2000:
			var new_bubble = bubble_scene.instantiate()  # Instantiate the bubble scene
			var bubble_x = randf_range(-width / 2, width / 2)  # Random x position
			new_bubble.position = Vector2(bubble_x, 600)  # Spawn at a fixed y position (change as needed)
			add_child(new_bubble)
			r -= randf_range(10,60)
			active_platforms.append(new_bubble)
		
