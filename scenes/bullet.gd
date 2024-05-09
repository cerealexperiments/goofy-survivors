extends Area2D

var direction: Vector2
var speed = 700

func _process(delta):
	position += speed * direction * delta


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.name == "World" or body.name == "TileMap":
		queue_free()
	else:
		if body.alive:
			body.die()
			queue_free()
