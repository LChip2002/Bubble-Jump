extends Node2D

# Preload sprite texture
var bubble_texture = preload("res://icon.svg") # TODO - Change to bubble sprite later

# Number of bubbles that must be generated on screen at a time
var bubble_no = 3

# Radius for each bubble
var bubble_rad = 20

# Get location of walls

func _ready() -> void:
	
	# TODO - Check number of bubbles on screen (always run)
	
	# Iterates through bubble num
	for i in range(bubble_no):
		gen_bubbles(i)
	
	pass
	
# This function generates bubbles
func gen_bubbles(index: int):
	
	# Create a new node for the bubble
	var bub_node = Node2D.new()
	add_child(bub_node)
	
	# Create a new sprite for the bubble
	var sprite = Sprite2D.new()
	sprite.texture = bubble_texture
	sprite.scale = Vector2(bubble_rad * 2 / sprite.texture.get_width(), bubble_rad * 2 / sprite.texture.get_height())  # Adjust scale to match radius
	bub_node.add_child(sprite)
	
	# Create collision for bubble
	var collision_bubble = CollisionShape2D.new()
	var circle_shape = CircleShape2D.new()
	
	circle_shape.radius = bubble_rad
	collision_bubble = circle_shape
	
	bub_node.add_child(collision_bubble)
		
	# Draws bubble to add to scene at a random position
	var random_x = randf_range($Wall_2 + bubble_rad, $Wall_1 - bubble_rad)
	#var random_y = randf_range(wall_top + bubble_rad, wall_bottom - bubble_rad)
	var random_y = randf_range(0,600)
	bub_node.position = Vector2(random_x, random_y)
	
	
