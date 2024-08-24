extends Node2D
var obstacle_scene = preload("res://Scenes/Obstacle.tscn")
signal obstacle_created
signal change_score
var spawn_check : bool = true
var highest_point:int
var lowest_point:int
var track_score = 0
@onready var world = $".."
func _process(delta):
	var obstacle = obstacle_scene.instantiate()
	if %Player.started == true and %Player.alive == true :
		if spawn_check == true:
			add_child(obstacle)
			highest_point = %Player.position.y+50
			obstacle.global_position.y = randi()%410 + 130
			obstacle.global_position.x = 500
			obstacle.player_pass.connect(con)
			spawn_check = false
			$Timer.start()
	elif %Player.alive == false:
		spawn_check = false
	if world.score == track_score+1 and world.score < 25:
		$Timer.wait_time -= 0.015
		track_score += 1
		
func _on_timer_timeout():
	spawn_check = true
	
func con():
	print("succed")
	change_score.emit()
	
