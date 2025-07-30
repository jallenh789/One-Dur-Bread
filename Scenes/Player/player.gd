extends CharacterBody2D

# used to change the player speed 
@export var move_speed: int = 50
var start_dialogue: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_dialogue = true
	$CanvasLayer.visible = true
	Global.paused_movement = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("interact"):
		if start_dialogue == true:
			$CanvasLayer.visible = false
			Global.paused_movement = false
			start_dialogue = false
	
	movement(Global.paused_movement)
	
	move_and_slide()
	
	
func movement(paused_movement):
	
	if paused_movement == true:
		pass
	elif paused_movement == false:
		var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = move_vector * move_speed
		if velocity.x > 0:
			$AnimatedSprite2D.play("move_right")
			$"Player#interacting component/interactrange/CollisionShape2D".position = Vector2(16,5)
			
		elif velocity.x < 0:
			$AnimatedSprite2D.play("move_left")
			$"Player#interacting component/interactrange/CollisionShape2D".position = Vector2(-16,5)
			
		elif velocity.y > 0:
			$AnimatedSprite2D.play("move_down")
			$"Player#interacting component/interactrange/CollisionShape2D".position = Vector2(0,30)
			
		elif velocity.y < 0:
			$AnimatedSprite2D.play("move_up")
			$"Player#interacting component/interactrange/CollisionShape2D".position = Vector2(0,-7)
			
		else:
			$AnimatedSprite2D.stop()
	
