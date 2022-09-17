extends RigidBody2D

# @todo - Fix, not working. Could be in wrong place or used incorrectly
func hit(body: Node) -> void:
	if Input.is_action_just_pressed("attack") or Input.is_action_pressed("attack"):
		queue_free()

