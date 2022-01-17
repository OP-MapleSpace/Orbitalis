extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const G = 6.67*(10^-11);
var pos = Vector2(0,0);

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mass(1.9885*(10^30));
	print(pos);
	set_position(pos);
func _draw():
	draw_circle(Vector2(0,0), 50, Color(1.0, 1.0, 0.0));


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
