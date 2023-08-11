#version 150
precision highp float;

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec3 xyzPos;

out vec4 fragColor;

vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;


void main() {
    if (color.a < 0.1) {
        discard;
    }

    /* xp text*/
    if(color.r <= 126.50/255.0 && color.r > 126.49/255.0 && color.g == 252/255.0 && color.b <= 31.63/255.0 && color.b > 31.62/255.0){
        color = vec4(0.498, 1, 0.001, color.a); /* < < Your custom colour goes here */
    }
    /* xp text shadow */
    if(color.r <= 31.7/255.0 && color.r > 31.6/255.0 && color.g <= 62.3/255.0 && color.g > 62.25/255.0 && color.b <= 8.0/255.0 && color.b > 7.9/255.0){
        color = vec4(0.1255, 0.251, 0.001, color.a); /* < < Your custom colour goes here */
    }

    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
