extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -400
var motion = Vector2()
var startjump_playing = false


# warning-ignore:unused_argument
#warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y += GRAVITY
	
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	
	else:
		$Sprite.play("idle")
		friction = true
		
	
	
	
	if is_on_floor():
		
		
		
		if Input.is_action_pressed("ui_up"):
			$Sprite.play("crouch")
			#var startjump_playing = true
			#if startjump_playing == true:
				
			yield(get_tree().create_timer(0.1),"timeout")

			motion.y = JUMP_HEIGHT
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
		
	else:
		
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
			
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	# warning-ignore:return_value_discarded
	
	
	motion = move_and_slide(motion, UP)
	
	pass