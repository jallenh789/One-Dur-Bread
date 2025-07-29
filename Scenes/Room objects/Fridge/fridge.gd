extends StaticBody2D

@onready var interactable: Area2D = $interactable


func _ready() -> void:
	interactable.interact = _on_interact
	
	
func _on_interact():
	print("That is a fridge")
	interactable.is_interactable = true
	if Input.is_action_just_pressed("interact"):
		if $CanvasLayer.visible:
			$CanvasLayer.visible = false
			Global.paused_movement = false
		else:
			$CanvasLayer.visible = true
			Global.paused_movement = true
			
