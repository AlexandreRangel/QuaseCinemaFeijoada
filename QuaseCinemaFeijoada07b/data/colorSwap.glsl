uniform sampler2D src_tex_unit0;

void main(void){
  // get the location of the current pixel
  // in the input texture
  vec2 tex_coord = gl_TexCoord[0].st;

  // read the color of the current pixel out of the
  // input texture
  vec4 src_color = texture2D(src_tex_unit0, tex_coord).rgba;

  // output:
  // set color of the fragment
  gl_FragColor = vec4(src_color.g, src_color.r, src_color.b, src_color.a);
}