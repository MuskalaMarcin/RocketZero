extends RigidBody2D

const _rock_img = "res://images/rock.png";

func _ready():
	print("New rock generation...");
	#_generate_rock_from_top();
	#_generate_rock_from_bottom();
	

func init(direction):
	if (direction == "bottom"):
		_generate_rock_from_bottom();
	elif (direction == "top"):
		_generate_rock_from_top();
	
func _generate_rock_from_top():
	print("rock generated from top");
	var sprite = Sprite.new();
	var rockImage = load(_rock_img);
	sprite.set_texture(rockImage);
	sprite.set_scale(Vector2(0.1, 0.1));
	sprite.position.x = rand_range(480, 960);
	sprite.position.y = -300;
	self.gravity_scale = 10.0;
	add_child(sprite);
	
func _generate_rock_from_bottom():
	print("rock generated from bottom");
	var sprite = Sprite.new();
	var rockImage = load(_rock_img);
	sprite.set_texture(rockImage);
	sprite.set_scale(Vector2(0.1, 0.1));
	sprite.position.x = rand_range(480, 960);
	sprite.position.y = 800;
	self.gravity_scale = -10.0;
	add_child(sprite);
