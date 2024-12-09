void mainImage(out vec4 O, vec2 F) {
  vec2 W = iResolution.xy;
  vec2 a = (F + F - W) / W.y;
  float v = length(a);
  float e, s = iTime / 1.1;

  for (O *= e; e++ < 8.;)
    O += pow(.004 / abs(sin(length(a = fract(a
              + sin(s * .45) * .04 - .5) - .5)
          * exp(length(a) - v * 1.2) * 8. + s + e * .35) / 7.
        - smoothstep(0., .4, v - .8)), 1.1)
      * (cos(v * 6. + .5 * e + s + vec4(6.42, 2.3, 2.9, 0)) + 1.);
}
