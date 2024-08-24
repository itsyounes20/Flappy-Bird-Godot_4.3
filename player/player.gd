extends RigidBody2D
class_name player
var started = false
@export var flap_force = -400
@onready var animation = $AnimationPlayer
var max_rotation_degree = -30
signal die_signal()
var alive = true
@onready var die_sound = $sound_effects/die
@onready var swoosh_sound = $sound_effects/swoosh
@onready var wing_sound = $sound_effects/wing
@onready var hit_sound = $sound_effects/hit
@onready var point_sound = $sound_effects/point
@onready var collision_shape_2d = $CollisionShape2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Flap") and alive:
		if !started:
			start()
		flap()
	if rotation_degrees <= -30 :
		angular_velocity = 0
		rotation_degrees = max_rotation_degree
	if linear_velocity.y > 0 and alive :
		if rotation_degrees <= 0 :
			angular_velocity = 3
		else : 
			angular_velocity = 0
		
func start():
	if started: return
	started = true
	score_manager.obstacle_move = true
	gravity_scale = 1.0
	animation.play("Flap")
	$"../starter".queue_free()
	swoosh_sound.play()

func flap():
	linear_velocity.y = flap_force
	angular_velocity = -5
	wing_sound.play()
	
func die():
	if not alive:return
	alive = false
	if rotation_degrees <= 90 :
		angular_velocity = 3
	else : 
		angular_velocity = 0
	score_manager.obstacle_move = false
	$"../Floor".animation.stop()
	hit_sound.play()
	die_sound.play()
	animation.stop()
	die_signal.emit()
	

	
