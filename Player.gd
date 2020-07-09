extends Area2D


var mouse_inside = false

var follow_mouse = false

func _ready():
	
	#automatically updates the labels with the collision mask and layers so they are visible in-game
	
	var layer_text = "Layers: "
	for i in 20:
		if get_collision_layer_bit(i):
			layer_text = str(layer_text,i+1,", ")
		
	var mask_text = "Masks: "
	for i in 20:
		if get_collision_mask_bit(i):
			mask_text = str(mask_text,i+1,", ")
	
	$Layers.text = layer_text
	$Masks.text = mask_text








func _physics_process(delta):
	if Input.is_action_pressed("click") and mouse_inside:
		follow_mouse = true
		
	if follow_mouse:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("click"):
		follow_mouse = false


	$Detection.text = str("Detected: ",detected_area_name)








func _on_Player_mouse_entered():
	mouse_inside = true
	pass # Replace with function body.


func _on_Player_mouse_exited():
	mouse_inside = false
	pass # Replace with function body.



var detected_area_name = ""


func _on_Player_area_entered(area):
	detected_area_name = area.name
	pass # Replace with function body.

func _on_Player_area_exited(area):
	detected_area_name = ""
	pass # Replace with function body.
