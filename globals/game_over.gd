extends CanvasLayer

@onready var current_score = $VBoxContainer/current_score
@onready var highest_score = $VBoxContainer/highest_score

@onready var medal_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
var golden_medal_sprite = preload("res://assets/sprites/medal_gold.png")
var silver_medal_sprite = preload("res://assets/sprites/medal_silver.png")
var platinum_medal_sprite = preload("res://assets/sprites/medal_platinum.png")
var bronze_medal_sprite = preload("res://assets/sprites/medal_bronze.png")
@onready var h_box_container = $HBoxContainer

func _process(delta):
	if score_manager.last_score < 10:
		h_box_container.visible = false
	else:
		h_box_container.visible = true
		if score_manager.last_score >= 10 and score_manager.last_score < 20:
			medal_sprite.texture = bronze_medal_sprite
		elif score_manager.last_score >= 20 and score_manager.last_score < 30 :
			medal_sprite.texture = silver_medal_sprite
		elif score_manager.last_score >= 30 and score_manager.last_score < 40 :
			medal_sprite.texture = platinum_medal_sprite
		elif score_manager.last_score >= 40:
			medal_sprite.texture = golden_medal_sprite
		
func _on_button_pressed():
	get_tree().reload_current_scene()
