shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise;
uniform float alpha = 0.0;

void fragment() {
	float y = clamp(UV.y*0.9,0.0,1.0);
	vec4 tex = round( texture(noise,UV)*8.0 )/8.0;
	COLOR = mix( vec4(0.56, 0.0, 1.0, alpha),vec4(0.0, 0.0, 0.0, alpha), tex.x );
	
}