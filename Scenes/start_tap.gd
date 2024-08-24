extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween().set_loops()
	tween.tween_property(self,"position",Vector2(position.x,position.y+5),1)
	tween.tween_property(self,"position",Vector2(position.x,position.y-5),1)
	
