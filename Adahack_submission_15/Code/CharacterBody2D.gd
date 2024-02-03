extends CharacterBody2D
@onready var background = %Background
@onready var dialogue_box = %DialogueBox
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var win_screen = %win_screen

var speed = 400  # speed in pixels/sec
var vertical_speed = 300 

var dialogue_area = 0
@export var suspicion_level = 0

signal game_over()

@onready var start_screen = %start_screen


func _ready():
	game_over_screen.visible = false
	start_screen.visible = true
	win_screen.visible = false



func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	velocity.y  = int(velocity.y / (speed / vertical_speed))
	move_and_slide()
	
	if velocity != Vector2(0,0):
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.stop()
	if Input.is_action_pressed("right"):
		animated_sprite_2d.flip_h = 0
	if Input.is_action_pressed("left"):
		animated_sprite_2d.flip_h = 1

	if suspicion_level == 100:
		game_over.emit()

func _input(event):
	if event.is_action_pressed("enter"):
		if dialogue_area != 0:
			dialogue_box.start_dialogue(dialogue_area)
	start_screen.visible = false
			
func _on_npc_ready_for_chat(num):
	dialogue_area = num

func _on_npc_not_ready_for_chat():
	dialogue_area = 0



func _on_dialogue_box_best_chosen():
	suspicion_level = max(0, suspicion_level - 10)

func _on_dialogue_box_mid_chosen():
	suspicion_level = min(100, suspicion_level + 20)

func _on_dialogue_box_worst_chosen():
	suspicion_level = min(100, suspicion_level + 45)
	

@onready var game_over_screen = %Game_over_screen

func _on_game_over():
	game_over_screen.visible = true


func _on_finish_body_entered(body):
	win_screen.visible = true


func _on_dialogue_box_dialogue_finished():
	pass
