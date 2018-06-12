extends RigidBody2D

const _rock_img = "res://images/rock.png";

func _ready():
	pass;
	
func init():
	var sprite = Sprite.new();
	var rockImage = load(_rock_img);
	sprite.set_texture(rockImage);
	var rock_size = _get_huge_rock_size();
	sprite.set_scale(Vector2(rock_size, rock_size));
	add_child(sprite);
	self.position.x = 2000;
	self.position.y = randi()%720;
	self.gravity_scale = 0;
	self.contact_monitor = true;
	self.contacts_reported = 5;
	self.linear_velocity = Vector2(-650, 0);
	
func _get_huge_rock_size():
	return (rand_range(20,30))/100;
