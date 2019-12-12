extends KinematicBody2D

const UP = Vector2(0,-1)
const BULLET_VELOCITY = 600
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -400
var motion = Vector2()
var startjump_playing = false
var is_standing = 1


onready var Collision2D = get_node("CollisionShape2D")
onready var bullet = preload("bullet.tscn")
func _physics_process(delta):      
	
	motion.y += GRAVITY
	
	var friction = false
	
	if Input.is_action_pressed("ui_right") && not Input.is_action_pressed("ui_down"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		inventory.flipped = false
		$Sprite.play("run")
		#Collision2D.get_shape().set_extents(Vector2(13,24))
		$Sprite.set_offset(Vector2(0,0))
		$BarrelEnd.set_position(Vector2(23,10.5))
		
	elif Input.is_action_pressed("ui_left") && not Input.is_action_pressed("ui_down"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		inventory.flipped = true
		$Sprite.set_offset(Vector2(-4,0))
		$BarrelEnd.set_position(Vector2(-23,10.5))
		
		$Sprite.play("run")
		
	elif Input.is_action_pressed("ui_down"):
		Collision2D.get_shape().set_extents(Vector2(13,18))
		#
		#var current_location = 
		#$Sprite.get_transform().set_transform(Vector2(-2,7))
		motion.x = 0
		$Sprite.play("crouch")
		
		if Input.is_action_just_pressed("ui_down"):
			Collision2D.global_translate(Vector2(0,8))
	#idle
	else:
		friction = true
		Collision2D.get_shape().set_extents(Vector2(13,24))
		if inventory.hasgun == true and Input.is_action_pressed("shoot"):
			$Sprite.play("shoot_idle")
		elif inventory.hasgun == true and not Input.is_action_pressed("shoot"):
			$Sprite.play("gun_idle")
		else:
			$Sprite.play("idle")
		
	if Input.is_action_just_released("ui_down"):
			Collision2D.global_translate(Vector2(0,-8))
	
	#jump
	if is_on_floor():
		
		
		
		if Input.is_action_pressed("ui_up"):
			$Sprite.play("prejump")
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

	if Input.is_action_just_pressed("shoot"):
		if inventory.hasgun == true:
			#shoot left
			var newbullet = bullet.instance()
			var flipped = $Sprite.flip_h
			var dir = 1 if flipped else -1
			
			get_parent().add_child(newbullet)
			newbullet.set_position($BarrelEnd.global_position) # use node for shoot position
			newbullet.linear_velocity = Vector2(BULLET_VELOCITY * -dir, 0)
		
			newbullet.add_collision_exception_with(self) # don't want player to collide with bullet
			
				
				
				
		pass
