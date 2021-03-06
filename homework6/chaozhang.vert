#version 330 compatibility


out vec3  vMCposition;
out vec4  vColor;
out float vLightIntensity;
out vec2  vST;
out float z;

const vec3 LIGHTPOS = vec3( -2., 0., 10. );

void
main( )
{

	vec3 tnorm = normalize( gl_NormalMatrix * gl_Normal );
	vec3 ECposition = vec3( gl_ModelViewMatrix * gl_Vertex ).xyz;
	vLightIntensity  = abs( dot( normalize(LIGHTPOS - ECposition), tnorm )  );
	z = ECposition.z;
	vMCposition = gl_Vertex.xyz;
	vColor = gl_Color;
	vST = gl_MultiTexCoord0.st;
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
