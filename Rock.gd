extends RigidBody2D

const _rock_img = "res://images/rock.png";

func _ready():
	pass;
	
func init(direction):
	randomize()
	if (direction == "bottom"):
		_generate_rock_from_bottom();
	elif (direction == "top"):
		_generate_rock_from_top();
	
func _generate_rock_from_top():
	_generateRock(-300, _getGravityScaleFromTop());
	
func _generate_rock_from_bottom():
	_generateRock(1000, _getGravityScaleFromBottom());

func _generateRock(yPosition, gravityScale):
	var sprite = Sprite.new();
	var rockImage = load(_rock_img);
	sprite.set_texture(rockImage);
	var rockSize = _getRockSize();
	sprite.set_scale(Vector2(rockSize, rockSize));
	add_child(sprite);
	self.position.x = rand_range(900, 1500);
	self.position.y = yPosition;
	self.gravity_scale = gravityScale;
	self.contact_monitor = true;
	self.contacts_reported = 5;
	self.linear_velocity = Vector2(_getRockVelocity(), 0);

func _getGravityScaleFromBottom():
	return rand_range(-10,-2);

func _getGravityScaleFromTop():
	return rand_range(2, 10);

func _getRockSize():
	return (rand_range(0.5,22))/100;
	
func _getRockVelocity():
	return rand_range(-100,-300);
