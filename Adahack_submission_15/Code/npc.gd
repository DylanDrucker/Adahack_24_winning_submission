extends Node2D

@onready var chat = %Chat
@export var dialogue_number = 4
@export var texture : Texture2D

signal ready_for_chat(num)
signal not_ready_for_chat()

func _ready():
	chat.visible = false




func _on_area_2d_body_entered(body):
	chat.visible = true
	ready_for_chat.emit(dialogue_number)


func _on_area_2d_body_exited(body):
	chat.visible = false
	not_ready_for_chat.emit()
