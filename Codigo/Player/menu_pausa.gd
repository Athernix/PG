extends Control
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("Blur")

func pausa():
	get_tree().paused = true
	$AnimationPlayer.play("Blur")
	
func testEsc():
	if Input.is_action_just_pressed("Esc") and get_tree().paused == false:
		pausa()
	elif Input.is_action_just_pressed("Esc") and get_tree().paused == true:
		resume()


func _on_button_pressed() -> void:
	resume()


func _on_button_2_pressed() -> void:
	get_tree().reload_current_scene()


func _on_button_3_pressed() -> void:
	get_tree().quit()
	
func _process(delta):
	testEsc()
