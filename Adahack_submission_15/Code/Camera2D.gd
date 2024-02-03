extends Camera2D
@onready var background = %Background


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = 0
	limit_top = 0
	limit_right = background.texture.get_width() * background.scale.x
	limit_bottom = background.texture.get_height() + background.scale.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
