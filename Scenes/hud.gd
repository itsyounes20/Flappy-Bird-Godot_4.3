extends CanvasLayer

@onready var score_label = $Score

func update_score(score):
	score_label.text = str(score)
