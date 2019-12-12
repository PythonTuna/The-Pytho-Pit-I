extends Area2D

onready var tween = get_node("Tween")



func _ready():
	set_physics_process(false)
	$AudioStreamPlayer.stop()
	
	tween.interpolate_property($Sprite, "scale", $Sprite.get_scale(), Vector2(0,0), 1.5, Tween.TRANS_EXPO, Tween.TRANS_LINEAR)
func _physics_process(delta):

	rotation +=4*delta
	
	

	pass



func _on_gunget_body_entered(body):
	
	if body.name == "player":
		
		set_physics_process(true)
		
		tween.start()
		
		inventory.hasgun = true
		
		$AudioStreamPlayer.play()
		
		yield(get_tree().create_timer(1.5),"timeout")
		
		$CollisionShape2D.set_disabled(true)
		
		$Sprite.visible = false
	pass # Replace with function body.
