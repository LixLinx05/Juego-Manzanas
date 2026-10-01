extends Area2D

@onready var ManRo_Scene = load("res://Manzana-Roja.tscn") 
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()
	
func _process(_delta: float) -> void:
	spawn()
	
func spawn():
	if bool_spawn:
		$CoolDown.start()
		bool_spawn = false
		var ManRo_instance = ManRo_Scene.instantiate()
		ManRo_instance.position = Vector2(random.randi_range(200, 750), random.randi_range(363, 383))
		add_child(ManRo_instance)
		
 

func _on_cool_down_timeout() -> void:
	bool_spawn = true



	


func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Manzana"):
		body.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ManRo"):
		body.queue_free()
