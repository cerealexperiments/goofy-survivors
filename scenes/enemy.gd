extends CharacterBody2D

@onready var player = get_node("/root/Main/Player")
signal hit_player

var alive: bool
var speed = 250
var player_position
var target_position

func _ready():
	alive = true
	
func _physics_process(delta):
	if alive:
		player_position = player.position
		target_position = (player_position - position).normalized()
		velocity = target_position * speed
		
		move_and_slide()
		
		if velocity.length() != 0:
			$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("idle")
			
		if player_position.x > position.x:
			$AnimatedSprite2D.flip_h = false
		elif player_position.x < position.x:
			$AnimatedSprite2D.flip_h = true
	else:
		pass

func die():
	alive = false
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.animation = "dead"
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	
	
func _on_area_2d_body_entered(body):
	hit_player.emit()
