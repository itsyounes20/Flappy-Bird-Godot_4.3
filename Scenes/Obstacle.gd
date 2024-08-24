extends Node2D
signal player_pass()
const speed = 215


func _physics_process(delta):
	if score_manager.obstacle_move == true:
		position.x += -speed * delta
	if global_position.x <= -400:
		queue_free()

func _on_pipe_body_entered(body):
	print("player entered")
	if body.has_method("die"):
		body.die()

func _on_score_area_body_exited(body):
	body.point_sound.play()
	player_pass.emit()
