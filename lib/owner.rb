require "pry"

class Owner
  
  @@all = []
  @@count = 0
  
  attr_reader :name, :species
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all.push(self)
    @@count += 1
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@all.clear
    @@count = 0
  end
  
  def cats
    Cat.all.select do |cats|
      cats.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end
  
  def buy_cat(cat) 
    Cat.new(cat, self)
  end
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  
  def walk_dogs
    self.dogs.each do |dogs|
      dogs.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cats|
      cats.mood = "happy"
    end
  end
  
  def sell_pets
    self.dogs.each do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
    
    self.cats.each do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  
  
end