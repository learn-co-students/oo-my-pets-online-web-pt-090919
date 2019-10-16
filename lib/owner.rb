require "pry"

class Owner
  # code goes here	
 attr_reader :name

  @@all = [ ]

  @@all_pets = [ ]

  def initialize(name)
    @name = name 
    @cats = []
    @dogs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length 
  end

  def self.reset_all
    @@all.clear
  end

  def species(species = "human")
    species
  end

  def say_species
    #binding.pry
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|item| item.owner == self}
  end

  def dogs
    Dog.all.select {|item| item.owner == self}
  end

  def buy_cat(name)
    @cats << Cat.new(name, self)
  end

  def buy_dog(name)
    @dogs << Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |item|
      item.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |item|
      item.mood = "happy"
    end
  end

  def sell_pets
    #binding.pry
    self.cats.each do |item|
      item.mood = "nervous"
      item.owner = nil
    end
    self.dogs.each do |item|
      item.mood = "nervous"
      item.owner = nil
    end
    self.cats.clear
    self.dogs.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end



      #{|item| item.mood == "happy"}
   # binding.pry
  #def buy_cat(name = @name)
    #@cat << Cat.new(name)
    #binding.pry
  #end
#end