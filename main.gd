extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false

func _on_area_2d_body_entered(body):
	$Label.visible = true


func _on_area_2d_2_body_entered(body):
	print("woosh!")
	if $Player/CharacterBody2D/AnimatedSprite2D.animation == "duck":
		get_tree().change_scene_to_file("res://tunnel_A.tscn")


func _on_area_2d_3_body_entered(body):
	get_tree().change_scene_to_file("res://1-1.5.tscn")


func _on_fallzone_body_entered(body):
	get_tree().change_scene_to_file("res://main.tscn")
