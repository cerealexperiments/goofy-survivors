extends Node

func _on_enemy_spawner_hit_p():
	get_tree().quit()
	print("hit player")
