extends StaticBody2D

@onready var animation = $AnimationPlayer

func _on_death_zone_body_entered(body):
	if body is player:
		
		body.die()
