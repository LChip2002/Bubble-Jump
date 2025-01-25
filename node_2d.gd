extends Node2D

var bubble_scene = preload("res://Bubble.tscn")
var width

func _ready() -> void:
	
	width = get_viewport().size.x
	randomize()
	var y = 0
	
	# TODO - Loop until player death
	while y > -3000:
		var new_bubble = bubble_scene.instantiate() # Instantiate scene
		
		# TODO - For bigger aspect ratio
		#var wall_1_len = $Wall_1/CollisionShape2D.shape.size.x
		#var wall_2_len = $Wall_2/CollisionShape2D.shape.size.x
		
		## Avoid spawning the bubble within the wall regions
		#while (bubble_x >= (width - wall_1_len)) or (bubble_x <= (-width + wall_2_len)):
			#bubble_x = randf_range(-width / 2, width / 2)  # Re-generate the X position
		
		var bubble_x = randf_range(-width / 2, width / 2)
		
		new_bubble.position = Vector2(bubble_x,y)
		add_child(new_bubble)
		y -= randf_range(10,60)
		

	pass
