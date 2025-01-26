extends StaticBody2D

func _on_bubble_hit(body):
	if body.is_in_group("Player"):
		queue_free()
