extends Camera2D

#export(NodePath) var player_path
@export var player_path: NodePath
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)
	set_process(true)
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var player_y = player.position.y
	if player_y < position.y:
		position.y = player_y
	pass
