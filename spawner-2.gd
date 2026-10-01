extends Area2D

@onready var ManVer_Scene = load("res://Manzana-Verde.tscn") 
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _reaady() -> void:
	random.randomize()
	
func _process(_delta: float) -> void:
	spawn()
	
func spawn():
	if bool_spawn:
		$CoolDown.start()
		bool_spawn = false
		var ManVer_instance = ManVer_Scene.instantiate()
		ManVer_instance.position = Vector2(random.randi_range(150, 890), random.randi_range(363, 383))
		add_child(ManVer_instance)
		


func _on_cool_down_timeout() -> void:
	bool_spawn = true


func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("Manzana"):
		body.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ManVer"):
		body.queue_free()
