extends Area2D

var direction: Vector2
var speed = 500

func _process(delta):
	position += speed * direction * delta


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.name == "World":
		queue_free()
	else:
		if body.alive:
			body.die()
			queue_free()
