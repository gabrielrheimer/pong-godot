extends CharacterBody2D

const SPEED = 700

func _physics_process(delta: float) -> void:	
	velocity = Vector2.ZERO
	
	# In game engines, origin is on the top-left corner.
	# That is why you subtract to go up and add to go down.
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	move_and_collide(velocity * SPEED * delta)
