require 'pry'

class Owner
  
 attr_reader :name, :species
 
 @@all = []
 
 def initialize(name)
   @name = name
   @species = "human"
   @@all << self
 end
 
 def self.all
   @@all
 end
 
 def self.count
   @@all.size
 end
 
 def self.reset_all
   @@all.clear
 end
 
 def say_species
   "I am a #{@species}."
 end
 
  def cats
    Cat.all.select do |x|
      x.owner == self
    end
  end

  def dogs
    Dog.all.select do |x|
      x.owner == self
    end
  end
  
  def buy_cat(name)
    Cat.new(name,self)
  end
  
  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.select do |x|
      x.mood=("happy")
    end
  end

  def feed_cats
    Cat.all.select do |x|
      x.mood=("happy")
    end
  end
  
  def sell_pets
    Cat.all.select do |x|
      x.mood=("nervous") and x.owner=()
    end
    Dog.all.select do |x|
      x.mood=("nervous") and x.owner=()
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end