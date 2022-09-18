extends Camera2D

onready var player = get_node("/root/Main/FighterKnight/Area2D/KinematicBody2D")
	
func _process(delta):
	#return
	position.x = player.position.x + 77
	position.y = player.position.y + 400
	
