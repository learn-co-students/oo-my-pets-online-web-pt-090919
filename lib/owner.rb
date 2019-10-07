class Owner

  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats
    Cat.all.select { |catto| catto.owner == self }
  end
  
  def dogs
    Dog.all.select { |doggo| doggo.owner == self }
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def feed_cats
    self.cats.map { |catto| catto.mood = "happy" }
  end
  
  def walk_dogs
    self.dogs.map { |doggo| doggo.mood = "happy" }
  end
  
  def sell_pets
    self.cats.map { |catto| catto.mood = "nervous" }
    self.cats.map { |catto| catto.owner = nil }
    self.dogs.map { |doggo| doggo.mood = "nervous" }
    self.dogs.map { |doggo| doggo.owner = nil }
  end
  
  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end