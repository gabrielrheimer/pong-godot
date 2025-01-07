extends CharacterBody2D

const INITIAL_SPEED = 500

var speed
var timerHasTriggered
var counter

func setup():
	speed = INITIAL_SPEED
	resetPosition()
	
	# Randomize starting direction
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]
	
	timerHasTriggered = false
	$Timer.start()
	$Timer/Counter.text = str($Timer.wait_time)
	
func resetPosition():
	var viewport_size = get_viewport().get_visible_rect().size
	position = viewport_size / 2

func _ready() -> void:
	setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if timerHasTriggered:
		$Timer.stop()
		var collisionObject = move_and_collide(velocity * speed * delta)
		if collisionObject:
			speed += 50
			var normal = collisionObject.get_normal()
			velocity = velocity.bounce(normal)
	else:
		$Timer/Counter.text = str(int($Timer.time_left))
		

func _on_left_goal_body_entered(_body: Node2D) -> void:
	setup()
	get_parent().opponentScore += 1

func _on_right_goal_body_entered(_body: Node2D) -> void:
	setup()
	get_parent().playerScore += 1

func _on_timer_timeout() -> void:
	timerHasTriggered = true
	$Timer/Counter.text = ""
