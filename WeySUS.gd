extends RigidBody2D
# Declare member variables here.
const multiplier = 200
const period = 0.7; # years it takes for the planet to complete one orbit
const smAxis = pow(period,2.0/3.0); # length of semi-major axis in AU, uses Kepler's 3rd Law, which states that the square of the period = cube of the length of the semi-major axis
const radius = smAxis*multiplier; # converts AU to pixels for this game to scale properly; we are pretending the orbit is a perfect circle for simplicity because the difference between reality and this is negligible
var pos; # position
var angVel = (2*PI*smAxis)/period; # angular velocity, in radians/second
const G = 6.67 * pow(10, -11); # gravitational constant
var v;
export var theta = 0 # rad

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mass(4.3479*(10^24)) #mass in kg
	set_angular_velocity(angVel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	# Orbital angle
	theta -= delta * sqrt(G / pow(radius, 3.0))*200 * pow(10,5.5) # radians, scaled up to make it practical for the game
	# Revert orbital angle back after 2 * PI
	if (abs(theta) > 2 * PI):
		theta += 2 * PI
	# Find the planet's new position.

	pos = Vector2(cos(theta)*radius, sin(theta)*radius)
	# Set the new position.
	# print(pos, 'WeySUS')
	set_position(pos)
func _draw():
	draw_circle(Vector2(0,0), 10, Color(1.0, 0.0, 0.5));
	
