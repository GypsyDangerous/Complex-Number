Complex c;
void setup()
{
  size(640, 480);
  c = new RandomComplex();
  println(c.heading(), c.mag());
}

void draw()
{
  background(51);
}
