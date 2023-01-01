shader_type canvas_item;

uniform sampler2D noise;

void fragment() {
	float y = clamp(UV.y*0.9,0.0,1.0);
	vec4 tex = round( texture(noise,UV)*4.0 )/4.0;
	COLOR = mix( vec4(0.56, 0.0, 1.0, 1.0),vec4(0.0, 0.0, 0.0, 1.0), tex );
//	COLOR = texture(noise, sin(UV+y));
}