extends Area2D

func _process(delta):
	look_at(get_global_mouse_position())
	var mouse_position = get_global_mouse_position()
	if mouse_position.x > position.x:
		$WeaponPivot/GunSprite.flip_v = false
	else:
		$WeaponPivot/GunSprite.flip_v = true
