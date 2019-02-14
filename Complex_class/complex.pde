class Complex
{
  float re;
  float im;

  Complex(float r, float i)
  {
    re = r;
    im = i;
  }

  Complex()
  {
    re = 0;
    im = 0;
  }

  Complex add(Complex other) 
  {
    return new Complex(re + other.re, im + other.im);
  }

  Complex sub(Complex other) 
  {
    return new Complex(re - other.re, im - other.im);
  }

  Complex mult(Complex other)
  {
    float rea = re * other.re - im * other.im;
    float ima = re * other.im + im * other.re;
    return new Complex(rea, ima);
  }

  Complex div(Complex other)
  {
    float sq = other.magSq();
    Complex result = mult(other.conjugate());
    result.div(sq);
    return result;
  }

  Complex power(float n)
  {
    float r = mag();
    float angle = heading();
    Complex result = new ComplexFromAngle(pow(r, n), n * angle);
    return result;
  }

  Complex copy()
  {
    float r = re;
    float i = im;
    return new Complex(r, i);
  }

  void mult(float mult)
  {
    re *= mult;
    im *= mult;
  }

  void div(float divisor)
  {
    re /= divisor;
    im /= divisor;
  }

  Complex conjugate()
  {
    return new Complex(re, -im);
  }

  void normalize()
  {
    div(mag());
  }

  float heading()
  {
    return atan2(re, im);
  }

  void setMag(float r)
  {
    this.normalize();
    this.mult(r);
  }

  float mag()
  {
    return sqrt(re * re + im * im);
  }

  float magSq()
  {
    return re * re + im * im;
  }

  void rotate(float theta)
  {
    re += cos(theta);
    im += sin(theta);
  }
}

class ComplexFromAngle extends Complex
{
  ComplexFromAngle(float r, float theta)
  {
    re = r * sin(theta);
    im = r * cos(theta);
  }
}

class RandomComplex extends Complex
{
  RandomComplex()
  {
    re = random(-1, 1);
    im = random(-1, 1);
    normalize();
  }
}

class Epicycle extends Complex
{

  float amp;
  float freq;
  float phase;
  
  Epicycle(float r, float i, float f, float a, float ph)
  {
    re = r;
    im = i;
    amp = a;
    freq = f;
    phase = ph;
  }

}
