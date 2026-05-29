extends CharacterBody2D
class_name PlayerBody2D

const playerSpeed : int = 150
const jumpSpeed : int = -300

var coinCount : int = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("playerJump") and is_on_floor():
		velocity.y = jumpSpeed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("playerLeft", "playerRight")
	if direction:
		velocity.x = direction * playerSpeed
		
	else:
		velocity.x = move_toward(velocity.x, 0, playerSpeed)

	move_and_slide()
