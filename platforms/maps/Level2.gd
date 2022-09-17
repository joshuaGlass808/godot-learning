extends Node2D

func _process(delta: float) -> void:
	if get_tree().get_node_count() == 13:
		queue_free()
