# Las varialbles de instancia NO son definidas por la clase del objeto
# por lo tanto, no tienen nada que ver con la herencia

class Point
  attr_reader :x, :y
  
  def initialize(x,y)
    @x, @y = x, y
  end
  
  #metodos de instancia
  def *(value)
    Point.new(@x * value, @y * value)
  end
  
  def -@
    Point.new(-@x, -@y)
  end
  
  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end
  
  #constante
  ORIGIN = Point.new(0,0)

  def to_s
    "(#{@x}, #{@y})"
  end
  
end

#Herencia
class Point3D < Point
  attr_reader :z
  def initialize(x,y,z)
    super(x,y)
    @x = 'invalidada'
    @y = 'invalidada'
    @z = z
  end

  def to_s
    "(#{@x}, #{@y}, #{@z})"
  end
  
  #constante
  ORIGIN = Point3D.new(0,0,0)
end

p0 = Point::ORIGIN
p1 = Point.new(1,1)
p2 = Point.new(2,2)

puts p0,p1,p2
puts p1 + p2

p03d = Point3D::ORIGIN
p13d = Point3D.new(1,1,1)
p23d = Point3D.new(2,2,2)

puts p03d, p13d, p23d
puts p13d + p23d
