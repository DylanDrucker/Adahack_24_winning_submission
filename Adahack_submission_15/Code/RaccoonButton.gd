extends Button

@export var option = "Best"
@export var button_num : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("1"):
		if button_num == 1:
			pressed.emit()
			print(1)
	if event.is_action_pressed("2"):
		if button_num == 2:
			pressed.emit()
			print(2)
	if event.is_action_pressed("3"):
		if button_num == 3:
			pressed.emit()
			print(3)
	
func set_option(new_option):
	option = new_option
