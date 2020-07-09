extends Area2D






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
		
