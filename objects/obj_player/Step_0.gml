var _x_direction  = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _jump = keyboard_check(ord("W"));
var _on_ground = place_meeting(x, y + 1, obj_wall);
var _shoot = mouse_check_button_pressed(mb_left);
var _bullet;

if( _x_direction != 0) image_xscale = _x_direction;

x_vel = _x_direction * vel;
y_vel++; 
       
if(_on_ground){
	if(_x_direction != 0){
		sprite_index = spr_player_walk
	}else{ 
		sprite_index = spr_player_idle
	}
	if(_jump){
		y_vel = -15;
	}
}else{
	sprite_index = spr_player_jump
}

if(_shoot){
	_bullet = instance_create_layer(x, y, "instances", obj_bullet);
	audio_play_sound(snd_bulet, 2, false);
	_bullet.speed = 12;
	_bullet.direction = point_direction(x, y, mouse_x, mouse_y)
}

if(place_meeting(x + x_vel, y, obj_wall)){
	x_vel = 0;
}

x += x_vel;

if(place_meeting(x, y + y_vel, obj_wall)){
	y_vel = 0;
}

y += y_vel

