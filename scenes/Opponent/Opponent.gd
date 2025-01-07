extends CharacterBody2D

const SPEED = 700

var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta: float) -> void:	
	velocity = Vector2.ZERO
	
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			velocity.y += 1
			
		if ball.position.y < position.y:
			velocity.y -= 1

		move_and_collide(velocity * SPEED * delta)
