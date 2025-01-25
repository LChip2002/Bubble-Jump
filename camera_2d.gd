extends Camera2D

#export(NodePath) var player_path
@export var player_path: NodePath
@export var wall_1_path: NodePath
@export var wall_2_path: NodePath

var player: Node2D
var wall_1
var wall_2

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)
	set_process(true)
	
	# Get Walls
	wall_1 = get_node(wall_1_path)
	wall_2 = get_node(wall_2_path)
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var player_y = player.position.y
	if player_y < position.y:
		position.y = player_y
	
	# Adjust the walls based on the camera's position
	wall_1.position = Vector2(wall_1.position.x, player_y)
	wall_2.position = Vector2(wall_2.position.x, player_y)
	
	pass
	
	
