extends Node2D

var score = 0
var game_over_scene = preload("res://globals/game_over.tscn")
var highest_score = score_manager.highest_score 
var golden_medal_sprite = preload("res://assets/sprites/medal_gold.png")
var silver_medal_sprite = preload("res://assets/sprites/medal_silver.png")
var platinum_medal_sprite = preload("res://assets/sprites/medal_platinum.png")
var bronze_medal_sprite = preload("res://assets/sprites/medal_bronze.png")
var game_over_check:bool
var game_over = game_over_scene.instantiate()

func _ready():
	game_over_check = true
	$Spawner.change_score.connect(add_score)
	
func _process(_delta):
	$HUD.update_score(score)
	score_manager.last_score = score
	if %Player.alive == false:
		$HUD.visible = false
		if game_over_check == true:
			game_over_check = false
			add_child(game_over)
		
		if score > highest_score and score != 1:
			score_manager.highest_score = score
			highest_score = score_manager.highest_score
		game_over.current_score.text = "Current Score : "+str(score)
		game_over.highest_score.text = "Best Score : "+str(score_manager.highest_score)
			
func add_score():
	score +=1
	
func _on_destroy_body_entered(body):
	body.queue_free()
