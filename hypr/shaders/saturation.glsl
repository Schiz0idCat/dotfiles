precision mediump float;

varying vec2 v_texcoord;
uniform sampler2D tex;

const float SATURATION_FACTOR = 2.0; // The factor must be an explicit float (use 2.0, not 2)
const vec3 LUMINANCE_WEIGHTS = vec3(0.299, 0.587, 0.114);

void main() {
    vec4 originalColor = texture2D(tex, v_texcoord);
    float luminance = dot(originalColor.rgb, LUMINANCE_WEIGHTS);
    vec3 saturatedColor = mix(vec3(luminance), originalColor.rgb, SATURATION_FACTOR);
    gl_FragColor = vec4(saturatedColor, originalColor.a);
}
