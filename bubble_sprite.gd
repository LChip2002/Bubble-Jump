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
	for i in range(num_circles):
		gen_bubbles(i)
	
	pass
	
# This function generates bubbles
func gen_bubbles(index: int):
	pass
	
