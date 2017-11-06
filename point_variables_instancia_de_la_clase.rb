# Variables de instancia de la clase 

class Point
  attr_reader :x, :y

  #las variables de instancia de la clase 
  @number_of_points = 0
  @sum_of_x = 0
  @sum_of_y = 0
  
  def initialize(x,y)
    @x, @y = x, y

    #no se pueden usar en un método de instancia
    #@number_of_points += 1
    #@sum_of_x += x
    #@sum_of_y += y
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
    attr_accessor :number_of_points, :sum_of_x, :sum_of_y
    def new(x,y)
      #se usan las variables de instancia de la clase
      @number_of_points +=1
      @sum_of_x += x
      @sum_of_y += y

      super  #se invoca a la definición real de new para crear un punto
    end
    def report
      puts "nro. puntos #{@number_of_points}"
      puts "suma x #{@sum_of_x}"
      puts "suma y #{@sum_of_y}"
    end
  end

  def no_se_puede
    # se usan las variables de instancia de la clase en un método de instancia
    puts "nro. puntos #{@number_of_points}"
    puts "suma x #{@sum_of_x}"
    puts "suma y #{@sum_of_y}"
  end

  #constante
  ORIGIN = Point.new(0,0)
  
end


p0 = Point::ORIGIN
p1 = Point.new(1,1)
p2 = Point.new(2,2)

puts p0,p1,p2
puts p1 + p2

Point.report

puts "=======================\n"

p1.no_se_puede
