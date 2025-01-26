extends Camera2D

#export(NodePath) var player_path
@export var player_path: NodePath
@export var wall_1_path: NodePath
@export var wall_2_path: NodePath
@export var death_floor_path: NodePath
@export var background_path: NodePath

var player: Node2D
var wall_1
var wall_2
var death_floor
var background

# Define signal
signal y_position_changed(player_y)

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)
	set_process(true)
	
	# Get Walls and floor
	wall_1 = get_node(wall_1_path)
	wall_2 = get_node(wall_2_path)
	death_floor = get_node(death_floor_path)
	background = get_node(background_path)
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var player_y = player.position.y
	var player_x = player.position.x
	
	# Sends signal of y coordinate for distance calculation
	emit_signal("y_position_changed", player_y)
	
	#if player_y < position.y:
	position.y = player_y
	
	# Adjust the walls based on the camera's position
	wall_1.position = Vector2(wall_1.position.x, player_y)
	wall_2.position = Vector2(wall_2.position.x, player_y)
	background.position = Vector2(player_x, background.position.x)
	
	pass
	
	
