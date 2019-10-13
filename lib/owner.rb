require 'pry'

class Owner
  attr_reader :name, :species #cannot change owner's name and species
  attr_accessor :cats # an owner has many cats: one-to-many relationship
  attr_accessor :dogs # an owner has many dogs: one-to-many relationship
  
  @@all = []
  
  def initialize(name) 
    @name = name
    @species = "human"
    @@all << self
    self.cats = []
    self.dogs = []
  end
  
  # Puts owner's species
  def say_species
    "I am a #{@species}."
  end
  
  # Returns all instances of Owenr created
  def self.all 
    @@all
  end
  
   # Returns num of owners created
   def self.count
    self.all.length
  end
  
  # Reset all owners created 
  def self.reset_all 
    self.all.clear
  end
  
  def buy_cat(cat_name)
    #.find operates on an actual found reference 
    cat = Cat.all.find {|cat| cat.name == cat_name}
    cat = Cat.new(cat_name, self) if cat.nil?
    
    cat.owner = self
    self.cats << cat
    self.cats.uniq!
  end
  
  def buy_dog(dog_name)
    #.find operates on an actual found reference 
    dog = Dog.all.find {|dog| dog.name == dog_name}
    
    if dog # exists
      dog.owner = self
      self.dogs << dog
    else
      dog = Dog.new(dog_name, self)  
    end
    # self.dogs.uniq!
  end
  
  # Walks the dogs which makes the dogs' moods happy
  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    cats.map { |cat| cat.mood = "happy"}
  end
  
  def sell_pets
    # can sell all its pets, which makes them nervous
    [self.cats, self.dogs].flatten.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    # can sell all its pets, which leaves them without an owner
    self.cats = []
    self.dogs = []
  end
  
  # Can list off its pets 
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

