#version 320 es

precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

const float SATURATION_FACTOR = 2.0; // The factor must be an explicit float (e.g. 2.0, not 2)
const vec3 LUMINANCE_WEIGHTS = vec3(0.299, 0.587, 0.114);

void main() {
    vec4 originalColor = texture(tex, v_texcoord);
    float luminance = dot(originalColor.rgb, LUMINANCE_WEIGHTS);
    vec3 saturatedColor = mix(vec3(luminance), originalColor.rgb, SATURATION_FACTOR);
    fragColor = vec4(saturatedColor, originalColor.a);
}
