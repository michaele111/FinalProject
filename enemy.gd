extends CharacterBody2D

var speed = 50
@export var direction = -1
@export var detects_cliffs = true

func _ready():
	$AnimatedSprite2D.play("walk")
	$floor_checker.position.x = $CollisionShape2D.shape.get_size().x * direction
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction = direction * -1
	$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	$floor_checker.position.x = $CollisionShape2D.shape.get_size().x * direction
	velocity.y += 15
	
	velocity.x = speed * direction
	
	move_and_slide()


func _on_top_checker_body_entered(body):
	$AnimatedSprite2D.play("dead")
	speed = 0
	set_collision_layer_value(4,false)
	set_collision_mask_value(0,false)
	$top_checker.set_collision_layer_value(4,false)
	$top_checker.set_collision_mask_value(0,false)
	$Timer.start()

func _on_timer_timeout():
	queue_free()
