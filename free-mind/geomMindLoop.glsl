void mainImage(out vec4 O, vec2 F) {
  vec2 C = iResolution.xy,
    u = abs(F + F - C) / C.y;
  float r = length(u),
    v = iTime,
    e;
  for (O *= e; e++ < 8.;) {
    C = fract(u * mat2(cos(vec4(0, 11, 33, 0) - v / 8.))
      * (1.5 + e * (sin(u * .5) * .5 + .5) / 4.)) - .5;
    O += pow(.004 / abs(sin(length(C)
          * exp(length(C / 1.5) - r * 1.1) * 8. + v + .5
          * cos(v / 4.) * e) / 8.
        - smoothstep(0., .8, r - .8)), 1.07)
      * (1. + cos(v + e * .5 + r * 6. + vec4(0, 1, 2, 0)));
  }
}
