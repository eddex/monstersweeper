extends Camera2D


const MOTION_SPEED = 20 # Pixels/second.


func _physics_process(_delta):
	var motion = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	position += motion
	var max_pos = 2500
	if position.x > max_pos:
		position.x = max_pos
	if position.x < -max_pos:
		position.x = -max_pos
	if position.y < 0:
		position.y = 0
	if position.y > max_pos:
		position.y = max_pos



func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and event.pressed:
			print("Wheel up")
			print(zoom)
			if zoom.x >= 1:
				zoom += Vector2(-0.1, -0.1)
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
			print("Wheel down")
			if zoom.x <= 5.3:
				zoom += Vector2(0.1, 0.1)
			print(zoom)
