extends Node2D

@onready var main = get_node("/root/Main")
signal hit_p

var goblin_scene := preload("res://scenes/enemy.tscn")
var spawn_points := []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
			

func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var enemy = goblin_scene.instantiate()
	enemy.position = spawn.position
	enemy.hit_player.connect(hit)
	main.add_child(enemy)
	
func hit():
	hit_p.emit()
