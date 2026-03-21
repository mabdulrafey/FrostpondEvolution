//
// Simple, default passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Controls whether the flash is normal or red, with values 0 (normal) and 1 (fully red)
uniform float damage_flash; 

void main()
{
	vec4 base_sprite_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Red color version
	vec4 red_sprite_version = base_sprite_color  + vec4(0.5, 0.0, 0.0, 0.0);
    gl_FragColor = mix(base_sprite_color , red_sprite_version, damage_flash);
}