extends RigidBody2D


func _ready():
	$bulletsprite.play("shot")
	if inventory.flipped == false:
		$bulletsprite.flip_h = false
		$CPUParticles2D.set_gravity(Vector2(-98.8,0))
	else:
		$bulletsprite.flip_h = true
		$CPUParticles2D.set_gravity(Vector2(98.8,0))
		
	pass # Replace with function body.



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
	pass # Replace with function body.


func _on_bullet_body_entered(body):
	if body.has_method("shot"):
		body.call("shot")
		
	else:
		queue_free()
	pass # Replace with function body.
