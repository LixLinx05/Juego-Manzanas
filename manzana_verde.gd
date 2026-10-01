extends CharacterBody2D



const JUMP_VELOCITY = 0

var random = RandomNumberGenerator.new()

func _ready() -> void:
	var rand = random.randf_range(100, 500)
	velocity.y = rand

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	move_and_slide()
