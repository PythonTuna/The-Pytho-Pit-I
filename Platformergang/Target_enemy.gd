extends RigidBody2D

var enemy = true

var shot = false

func _ready():
	mode = RigidBody2D.MODE_STATIC


func _physics_process(delta):
	#var hit = get_overlapping_bodies()
	
	#for body in hit:
	#	if body.name == "bullet":
	#		var shot = true
			
	pass

func shot():
		$HitBox.disabled = true
		$stand.disabled = true
		$Sprite.visible = false