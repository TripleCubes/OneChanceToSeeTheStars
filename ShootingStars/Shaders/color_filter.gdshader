shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D color_texture: filter_nearest;
uniform float at_night_float;

bool color_equals(vec4 color0, vec4 color1) {
	return abs(color0.r - color1.r) < 0.01f
				&& abs(color0.g - color1.g) < 0.01f
				&& abs(color0.b - color1.b) < 0.01f
				&& abs(color0.a - color1.a) < 0.01f;
}

void fragment() {
	vec4 scr_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR = scr_color;

	bool end_loop = false;
	for (float x = 0.0f; x < 2.0f; x += 1.0f) {
		if (end_loop) {
			break;
		}

		for (float y = 0.0f; y < 3.0f; y += 1.0f) {
			if (end_loop) {
				break;
			}

			vec2 sample_pos_green = vec2(x/2.0f + 0.1f, y/9.0f + 0.1f);
			vec2 sample_pos_red = vec2(x/2.0f + 0.1f, y/9.0f + 0.33f + 0.1f);
			vec2 sample_pos_blue = vec2(x/2.0f + 0.1f, y/9.0f + 0.66f + 0.1f);

			vec4 color_comp = texture(color_texture, sample_pos_green);
			vec4 color_replace_red = texture(color_texture, sample_pos_red);
			vec4 color_replace_blue = texture(color_texture, sample_pos_blue);

			if (!color_equals(scr_color, color_comp)) {
				continue;
			}

			if (at_night_float <= 1.0f) {
				COLOR = mix(color_comp, color_replace_red, at_night_float);
			} else if (at_night_float <= 2.0f) {
				COLOR = mix(color_replace_red, color_replace_blue, at_night_float - 1.0f);
			} else {
				COLOR = color_replace_blue;
			}
			end_loop = true;
		}
	}
}
