class Owner
  
  @@all = []
  
  attr_reader :name   
  
  def initialize(name)
    @name = name
    @cats = []
    @dogs = []
    @@all << self 
  end 
  
  def name
    @name 
  end 
  
  def species(species = "human")
    species
  end
  
  def say_species 
    "I am a #{species}."
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
  
  def cats
    Cat.all.select { |pet|pet.owner == self }
  end 
  
  def dogs 
    Dog.all.select { |pet|pet.owner == self }
  end
  
  def buy_cat(name) 
    @cats << Cat.new(name, self)
  end 
  
  def buy_dog(name) 
    @dogs << Dog.new(name, self)
  end 
   
   def walk_dogs
     self.dogs.each do |pet|
      pet.mood = "happy"
    end
  end
  
  def feed_cats
     self.cats.each do |pet|
      pet.mood = "happy"
    end
  end
  
  def sell_pets
    self.cats.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    self.dogs.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    self.cats.clear
    self.dogs.clear
  end
  
  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
end