vec3 cosGradient(float t) {
  vec3 a = vec3(0.713, 0.590, 0.583);
  vec3 b = vec3(0.452, 0.281, 0.005);
  vec3 c = vec3(0.695, 1.521, 1.441);
  vec3 d = vec3(1.563, 5.521, 1.801);
  return a + b * cos(6.28318 * (c * t + d));
}

void mainImage(out vec4 OC, in vec2 crd)
{
  crd.y = abs(crd.y);
  vec2 uv = (crd * 2.0 - iResolution.xy) / iResolution.y;

  for (float i = 0.; i < 2.; i++) {
    uv = abs(uv - i * .01);
    uv = sin(uv / .95) + 0.025 * cos(uv) + pow(cos(iTime / 2.9) * .45 + .75, 5.) * .05;
    float d = length(uv) / .95 - sqrt(uv.y) - cos(iTime) * .05;
    d *= 4.1;
    vec3 col = cosGradient(d + iTime * 1.2);
    d = 0.04 / d;
    col += col * d;
    OC = vec4(col, 1.);
  }
}
