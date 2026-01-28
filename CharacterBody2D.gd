extends CharacterBody2D

@export var speed = 230
@export var jump_speed = -350
@export var acceleration = 5
@export var friction = 10

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func get_input(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = lerp(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
#if player presses spacebar or W and is on the floor, character jumps.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_speed
# If A is pressed, it runs 
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("run")
# If D is pressed, it runs 
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("run")
# If Z is pressed, it plays a dying animation.
	elif Input.is_key_pressed(KEY_S):
		$AnimatedSprite2D.play("duck")
	else:
		$AnimatedSprite2D.play("idle")
# If sprite is jumping or falling it will play jump animation.
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
# Makes character flip by moving left.
	if Input.is_key_pressed(KEY_SHIFT):
		speed = 280
		jump_speed = -400
	else:
		speed = 230
		jump_speed = -350
	if(velocity.x > 0):
		scale.x = scale.y * 1
	elif(velocity.x < 0):
		scale.x = scale.y * -1
# Gravity.
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input(delta)
	move_and_slide()
	print(position)
	
