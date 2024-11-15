extends CharacterBody2D
var speed = 500
var rotation_speed = 5

const BULLET = preload("res://Scene/bullet.tscn")
@onready var shooting_point: Marker2D = $shooting_point

func _physics_process(delta):
	# Add the gravity.
	var rotation_direction = Input.get_axis("p1_left","p1_right")
	
	rotation += rotation_direction * rotation_speed * delta
	
	var direction = Input.get_axis("p1_down","p1_up")
	
	velocity = direction * speed* transform.x
	move_and_slide()
	
	if Input.is_action_just_pressed("p1_shoot"):
		shoot()
	
func shoot():
	var bullet = BULLET.instantiate()
	bullet.global_position = shooting_point.global_position
	bullet.rotation = rotation
	get_parent().add_child(bullet)
	
func take_damage():
	queue_free()
	get_parent().increment_p2_score()
	get_parent().respawn_p1()
