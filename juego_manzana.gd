extends Node2D

@onready var detector_canasta: Area2D = $CharacterBody2D/Area2D
@onready var contador: Label = $CanvasLayer/Label
@onready var detector: Area2D = $Detector
@onready var sprites: Array = [$CanvasLayer/Sprite2D5, $CanvasLayer/Sprite2D6, $CanvasLayer/Sprite2D7]
@onready var sprites2: Array = [$CanvasLayer/Sprite2D, $CanvasLayer/Sprite2D2, $CanvasLayer/Sprite2D3]
@onready var Win: CanvasLayer = $Win
@onready var Game_Over: CanvasLayer = $Game_Over

var puntos: int = -1

func _ready() -> void:
	detector_canasta.body_entered.connect(_on_area_body_entered)
	contador.text = "0"
	detector_canasta.body_entered.connect(_on_area_entered)
	detector.body_entered.connect(on_area_entred_roja)
	
func _on_area_body_entered(_body: Node2D) -> void:
	puntos += 1
	contador.text = "%d" % puntos
	
	if puntos >= 50:
		Win.mostrar()
func _on_area_entered(body: Node2D) -> void:
	if not body.is_in_group("ManVer"):
		return
	body.queue_free()
	
	if sprites.is_empty():
		return
		
	var sprite = sprites.pop_back()
	sprite.queue_free()
	
	if sprites.is_empty():
		Game_Over.mostrar()
		
func on_area_entred_roja(body: Node2D) -> void:
	if not body.is_in_group("ManRo"):
		return
	body.queue_free()
	
	if sprites2.is_empty():
		return
		
	var sprite = sprites2.pop_back()
	sprite.queue_free()
	
	if sprites2.is_empty():
		Game_Over.mostrar()
		
