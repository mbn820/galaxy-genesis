shader_type canvas_item;

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	COLOR = vec4(1.0, 0, 0.25, input_color.a);
}
