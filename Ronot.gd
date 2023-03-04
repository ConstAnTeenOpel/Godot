extends KinematicBody2D

const YSCORENIE = 2000
const MAX_SPEED = 500
const TORMOZHENIE = 0.1
const GRAVITY = 200
const JUMP_FORCE = 200

var motion = Vector2.ZERO

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, TORMOZHENIE)
		else:
			motion.x += x_input * YSCORENIE * delta
			motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
			
		if Input.is_action_just_pressed("ui_up"):
			motion.y = - JUMP_FORCE
		
	motion = move_and_slide(motion, Vector2.UP)
