#define rot(a) mat2(cos(a + vec4(0,33,11,0)))

#define pos3D(dst, v) dst * normalize(vec3(2.4, v));

#define nextD(col, dst, v) length(col) - .1*(.75 + dst*.1 + v)*.8;

# define colFn(dst, v) exp(-dst*.15 - .25*length(v)) * (tan(dst*(8.+0.2*vec3(0,1,2)))*1.5+1.2);

void mainImage (out vec4 O, vec2 F) {
    float dst, i, j, k, step = 4.,
        t = iTime*.4+ 1.5;
    vec2 r = iResolution.xy,
         v = (F*2.-r)/r.y;
    for (i = 0.; i < 200. && dst < 50.; i++) {
        vec3 o = pos3D(dst, v);
        k = cos(2.*t+dst)*cos(4.*t+dst)*.5 + cos(4.*t+dst)*sin(2.*t+dst)*.25;
        j = k + .15;
        o.x += 10.;
        o.y = abs(o.y);
        o = fract(o) - .5;
        o.xy *= rot(t);
        o.y += j/2.;
        o.y -= clamp(o.y, 0., j);
        dst += step = nextD(o,dst,k);
    }
    O.rgb = colFn(dst, v);
}