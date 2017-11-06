# Las variables de instancia se evaluan siempre en referencia a self.
# Las variables de clase     se evaluan en referencia al objeto Class que se crea.

class Point
  attr_reader :x, :y

  #las variables de clase se inicializan en la propia clase
  @@number_of_points = 0
  @@sum_of_x = 0
  @@sum_of_y = 0
  
  def initialize(x,y)
    @x, @y = x, y

    #se pueden usar las variables de clase en un método de instancia
    @@number_of_points += 1
    @@sum_of_x += x
    @@sum_of_y += y
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
  
  def to_s
    "(#{@x}, #{@y})"
  end

  # métodos de clase
  # variables de clase usadas en métodos de clase
  def self.count
    @@number_of_points
  end

  #def self.report
  #def Point.report
  class << self
    def report
      puts "nro. puntos #{@@number_of_points}"
      puts "suma x #{@@sum_of_x}"
      puts "suma y #{@@sum_of_y}"
    end
  end

  #constante
  ORIGIN = Point.new(0,0)
  
end

#Herencia
class Point3D < Point
  attr_reader :z

  #variable de clase
  @@sum_of_z = 0

  def initialize(x,y,z)
    super(x,y)
    @z = z

    #se usa en un método de instancia
    @@sum_of_z += z
  end

  def to_s
    "(#{@x}, #{@y}, #{@z})"
  end
  
  #constante
  ORIGIN = Point3D.new(0,0,0)

  class << self
    def report
      self.superclass.report
      puts "suma z #{@@sum_of_z}"
    end
  end
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

#Point.report
Point3D.report
