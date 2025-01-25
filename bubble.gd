extends StaticBody2D

func _on_bubble_hit(body):
	if body.is_in_group("Player"):
		queue_free()

#func _on_visible_screen() -> void:
	#var newBubble = self.duplicate()
	#newbubble.position.x = position.x
	#newbubble.position.y = position.y
	#
#func _on_visible_exit() -> void:
	#queue.free()
