uniform sampler2D textureSampler;

varying vec4 vertColor;
varying vec4 vertTexcoord;

//uniform float imgWidth;
//uniform float imgHeight;
uniform float contrast;
uniform float saturation;

float step_w = 1.0/640.0;
float step_h = 1.0/480.0;
//float contrast = 2.9;


void main() {
	vec3 color = vec3(texture2D(textureSampler, vertTexcoord.st));
	const vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);

	vec3 AvgLumin = vec3(0.5, 0.5, 0.5);

	vec3 intensity = vec3(dot(color, LumCoeff));

	// could substitute a uniform for this 1. and have variable saturation
	vec3 satColor = mix(intensity, color, saturation); 
	vec3 conColor = mix(AvgLumin, satColor, contrast);

	gl_FragColor = vec4(conColor, 1);
}