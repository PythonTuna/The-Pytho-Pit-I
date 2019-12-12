#STARTmenu.gd
extends Control

func _ready():
	get_node("/root/bgmusic").stop()
	inventory.reset()

func _on_Start_game_pressed():
	get_tree().change_scene("res://worlds/world1.tscn")
	get_node("/root/bgmusic").play()
	pass # Replace with function body.
	
	
func _on_Exit_game_pressed():
	get_tree().quit()
	
	pass # Replace with function body.
	
	#hello