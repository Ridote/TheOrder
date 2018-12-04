extends Node2D

const WALK_SPEED = 250
const FLOOR_NORMAL = Vector2(0, 1)
const SLOPE_SLIDE_STOP = 25.0
const STOP_FACTOR = 25


var linear_vel = Vector2()
var prevAnim = ""

func _ready():
	add_to_group(Constants.G_CHARACTER)

func move(_delta : float, direction : Vector2, looking_at : Vector2):
	$body.look_at(looking_at)
	linear_vel = direction*WALK_SPEED
	#linear_vel.x = lerp(linear_vel.x, target_vel.x + externalImpulse.x, 0.1)
	#linear_vel.y = lerp(linear_vel.y, target_vel.y + externalImpulse.y, 0.1)
	linear_vel = $body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)

func animate():
	#We need to stop
	if(linear_vel.length_squared() < STOP_FACTOR and prevAnim != "Idle"):
		$AnimationPlayer.play("Idle")
	#We need to move
	elif(prevAnim != "Moving"):
		$AnimationPlayer.play("Moving")
		
func getGlobalPosition() -> Vector2:
	return $body.global_position
	
func getOrientation() -> float:
	return $body.rotation

func attack() -> void:
	OS.alert(get_name() + " attack not implemented", "Implementation error")

func die() -> void:
	OS.alert(get_name() + " die not implemented", "Implementation error")