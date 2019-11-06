#STARTmenu.gd
extends Control


func _on_Start_game_pressed():
	get_tree().change_scene("res://world.tscn")
	
	pass # Replace with function body.
	
	
func _on_Exit_game_pressed():
	get_tree().quit()
	
	pass # Replace with function body.
	
	