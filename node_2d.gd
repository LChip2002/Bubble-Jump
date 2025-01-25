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
		
		## Assuming the root node of the scene is a Sprite2D
		#var sprite = new_bubble.get_node("Sprite2D")  # Get the Sprite2D node inside the scene
		#if sprite:
			#sprite.texture = preload("res://icon.svg")  # Set the texture for the bubble sprite
		
		#new_bubble.texture = bubble_texture
		new_bubble.position = Vector2(randf_range(-width/2, width/2),y)
		add_child(new_bubble)
		y -= randf_range(0,210)

	pass
