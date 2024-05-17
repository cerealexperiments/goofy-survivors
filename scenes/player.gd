extends CharacterBody2D

signal shoot

var speed: int
var screen_size: Vector2
var can_shoot: bool
var player_location: Vector2

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	speed = 200
	can_shoot = true
	player_location = position
	
func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir = get_global_mouse_position() - position
		shoot.emit(position, dir)
		can_shoot = false
		$ShotTimer.start()
		
func _physics_process(delta):
	# player movement
	get_input()
	move_and_slide()
	
	# player rotation
	var mouse = get_global_mouse_position()
	var angle = snappedf(mouse.angle(), PI / 4) / (PI / 4)
	angle = wrapi(int(angle), 0, 8)
	var mouse_position = get_global_mouse_position()

	if mouse_position.x > position.x:
		$AnimatedSprite2D.flip_h = false
	elif mouse_position.x < position.x:
		$AnimatedSprite2D.flip_h = true
	
	# player animation
	if velocity.length() != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

func _on_shot_timer_timeout():
	can_shoot = true
