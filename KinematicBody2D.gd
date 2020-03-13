extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 200
export var gravity = 40
export var jump_force = -400
export var health = 100
export var score = 0

signal health_changed
signal score_changed

func _ready():
	emit_signal("health_changed")
	emit_signal("score_changed")

func change_health(h):
	health += h
	emit_signal("health_changed")
	if health <= 0:
		queue_free()

func change_score(s):
	score += s
	emit_signal("score_changed")

func _physics_process(delta):
	motion.y += gravity
	if Input .is_action_pressed("ui_right"):
		motion.x = speed
		
	elif Input .is_action_pressed("ui_left"):
		motion.x = -speed
		
	else: 
		motion.x = 0
		
	if is_on_floor():
		if Input .is_action_pressed("ui_up"):
			motion.y = jump_force
	
	motion = move_and_slide(motion, UP)
