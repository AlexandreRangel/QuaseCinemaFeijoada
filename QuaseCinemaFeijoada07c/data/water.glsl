

uniform sampler2D tex0;
precision highp float;
uniform float time;
uniform vec2 resolution;
const float PI = 3.1415926535897932;

//speed
const float speed = 0.2;
const float speed_x = 0.3;
const float speed_y = 0.3;

// geometry
const float intensity = 3.;
const int steps = 8;
const float frequency = 4.0;
const int angle = 7; // better when a prime

// reflection and emboss
const float delta = 20.;
const float intence = 400.;
const float emboss = 0.3;

//---------- crystals effect

  float col(vec2 coord)
  {
    float delta_theta = 2.0 * PI / float(angle);
    float col = 0.0;
    float theta = 0.0;
    for (int i = 0; i < steps; i++)
    {
      vec2 adjc = coord;
      theta = delta_theta*float(i);
      adjc.x += cos(theta)*time*speed + time * speed_x;
      adjc.y -= sin(theta)*time*speed - time * speed_y;
      col = col + cos( (adjc.x*cos(theta) - adjc.y*sin(theta))*frequency)*intensity;
    }

    return cos(col);
  }

//---------- main

void main(void)
{
vec2 p = (gl_FragCoord.xy) / resolution.xy, c1 = p, c2 = p;
float cc1 = col(c1);

c2.x += resolution.x/delta;
float dx = emboss*(cc1-col(c2))/delta;

c2.x = p.x;
c2.y += resolution.y/delta;
float dy = emboss*(cc1-col(c2))/delta;

c1.x += dx;
c1.y = -(c1.y+dy);

float alpha = 1.+dot(dx,dy)*intence;
gl_FragColor = texture2D(tex0,c1)*(alpha);
}