class Owner
  
  attr_reader :name, :species
  
  @@all_owners = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all_owners << self
    @my_pets = {cats: [], dogs: []}
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all_owners
  end
  
  def self.count
    @@all_owners.count
  end
  
  def self.reset_all
    @@all_owners.clear
  end
  
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = self.Cat.new(name)
    @my_pets[:cats] << new_cat
  end 
   #cat.owner = self
  
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
end