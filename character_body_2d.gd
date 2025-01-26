extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_z") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Handles bubble jump
	var collision = move_and_collide(velocity * delta)
	if collision:
		
		## Check if the object collided with is a StaticBody2D named "Bubble"
		#if collision.collider.is_in_group("Bubble"):
			#collision.collider.queue_free()  # Remove the Bubble StaticBody2D
		
		#velocity = velocity.bounce(collision.get_normal())
		velocity.y = JUMP_VELOCITY
		#$Bubble.queue_free()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
