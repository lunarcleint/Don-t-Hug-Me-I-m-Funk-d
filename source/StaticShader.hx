package;

import flixel.system.FlxAssets.FlxShader;

class StaticShader extends FlxShader
{
	@:glFragmentSource('
	#pragma header

    uniform float iTime;
    uniform vec3 iResolution; 
    
    float Noise21 (vec2 p, float ta, float tb) {
        return fract(sin(p.x*ta+p.y*tb)*5678.);
    }

    void main()
    {
        vec2 uv = openfl_TextureCoordv.xy;

        float t = iTime+123.;
        float ta = t*.654321;
        float tb = t*(ta*.123456);
        
        float c = Noise21(uv, ta, tb);
        vec3 col = vec3(c);

        gl_FragColor = vec4(col,1.0);
    }
	')
	public function new()
	{
		super();
	}

	public function update() {}
}