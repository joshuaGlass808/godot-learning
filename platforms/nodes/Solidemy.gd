extends StaticBody2D

var player_inside: bool = false

func _on_Area2D_body_entered(body: KinematicBody2D) -> void:
	if body != null:
		player_inside = true

func _on_Area2D_body_exited(body: KinematicBody2D) -> void:
	if body != null:
		player_inside = false
	
func _process(delta: float) -> void:
	if player_inside and Input.is_action_pressed("attack"):
		queue_free()
