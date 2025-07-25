extends CharacterBody2D

# used to change the player speed 
@export var move_speed: int = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
		
	elif velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
		
	elif velocity.y > 0:
		$AnimatedSprite2D.play("move_down")
		
	elif velocity.y < 0:
		$AnimatedSprite2D.play("move_up")
		
	else:
		$AnimatedSprite2D.stop()
	
	move_and_slide()
