extends Node2D

func _process(delta: float) -> void:
	# 13 is what the count equals currently. This is not the way to go about it.
	if get_tree().get_node_count() == 13:
		queue_free()
