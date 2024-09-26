extends CharacterBody2D


const MAX_VELOCIDAD = 400.0
const ACCELERACION = 15000.0
const FRICION = 600.0


var input = Vector2.ZERO

func _physics_process(delta):
	
	input = Vector2.ZERO

	
	input.x = Input.get_action_strength("Derecha") - Input.get_action_strength("Izquierda")
	input.y = Input.get_action_strength("Abajo") - Input.get_action_strength("Arriba")
	input = input.normalized()

	
	if input == Vector2.ZERO:
		
		if velocity.length() > FRICION * delta:
			velocity -= velocity.normalized() * FRICION * delta
		else:
			velocity = Vector2.ZERO
	else:
		
		velocity += input * ACCELERACION * delta

	  
		velocity = velocity.limit_length(MAX_VELOCIDAD)

	move_and_slide()
