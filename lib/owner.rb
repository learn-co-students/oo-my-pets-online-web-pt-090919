class Owner
  # code goes here
  attr_reader :name, :species
  
  @@all = [] 
  
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
  def species
    @species = "human"
  end 
  
  def say_species
    "I am a human."
  end 
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end 
  
  def self.reset_all
    self.all.clear
  end
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end 
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end 
  
  def buy_cat(cat)
    cats << Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    dogs << Dog.new(dog, self)
  end 
  
  def walk_dogs
    dogs.collect{|dog| dog.mood = "happy"}
  end 
  
  def feed_cats
    cats.collect{|cat| cat.mood = "happy"}
  end 
  
  def sell_pets
    (cats + dogs).collect do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end 
  end   
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
end