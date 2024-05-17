extends Area2D

@onready var player = get_node("/root/Main/Player")

func _process(delta):
	look_at(get_global_mouse_position())
	var mouse_position = get_global_mouse_position()
	var player_position = player.position
	if mouse_position.x > player_position.x:
		$WeaponPivot/GunSprite.flip_v = false
	else:
		$WeaponPivot/GunSprite.flip_v = true
