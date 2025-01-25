extends StaticBody2D

# Signal to notify game over
signal player_died

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("player_died")
