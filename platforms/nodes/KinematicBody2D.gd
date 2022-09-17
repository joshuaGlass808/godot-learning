extends KinematicBody2D

const GRAVITY: float = 400.0
const GRAVITY_MAX: float = 1000.0
const WALK_SPEED: float = 200.0
const MAX_JUMPS: int = 2
const JUMP_HEIGHT: int = 150

var velocity: Vector2 = Vector2()
var direction: int = 1
var jump_count: int = 0

func handle_inputs(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite.flip_h = true
		velocity.x = -WALK_SPEED
		if !Input.is_action_pressed("attack") and is_on_wall():
			$AnimatedSprite.animation = "run"

	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite.flip_h = false
		velocity.x = WALK_SPEED
		if !Input.is_action_pressed("attack") and is_on_wall():
			$AnimatedSprite.animation = "run"

	else:
		velocity.x = 0
		if is_on_wall() and (!Input.is_action_just_pressed("attack") or !Input.is_action_just_released("attack")):
			$AnimatedSprite.animation = "idle"
		
	if Input.is_action_just_pressed("jump"):
		if jump_count == MAX_JUMPS:
			return
			
		jump_count += 1
		velocity.y = -(250)
		$AnimatedSprite.animation = "jump"
		
	if Input.is_action_pressed("attack"):
		#$AnimatedSprite.animation = "attack"
		$AnimatedSprite.play("attack")

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if velocity.y > GRAVITY_MAX:
		velocity	.y = 100

	if is_on_wall():
		jump_count = 0
	else:
		$AnimatedSprite.animation = "jump"
		
	handle_inputs(delta)
	move_and_slide(velocity)
