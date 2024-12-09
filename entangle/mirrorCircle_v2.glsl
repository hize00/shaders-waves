void mainImage(out vec4 O, in vec2 u)
{
  vec2 r = iResolution.xy;
  u += u - r;
  u.x = abs(u.x);
  O *= 0.;

  for (float i = 0., t = iTime * .5;
      i++ < 50.;
      O += .0025 / abs(length(u.yx / r.y - vec2(sin(i / 55. * 6.2 + t * 2.),
            cos(t + i / 35. * 6.3)) * .45)
        - (sin(i * .3 + t) * .5 + .5) + .5)
      * (cos(i + vec4(2, 1, 0, 0)) + 1.)
    );
}
