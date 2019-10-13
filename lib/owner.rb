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

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    @my_pets[:cats] << new_cat
  end 
  
  def buy_dog(name)
    new_dog = Dog.new(name, self)
    @my_pets[:dogs] << new_dog
  end 
  
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
  def sell_pets
    @my_pets.each {|pet| pet.mood = "nervous"}
		 	
  end

	def list_pets 
  "I have #{@my_pets[:dogs].count} dog(s), and #{@my_pets[:cats].count} cat(s)."
	end 
  
end