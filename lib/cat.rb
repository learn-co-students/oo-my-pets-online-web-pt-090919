class Cat
  attr_reader :name
  attr_accessor :mood
  attr_accessor :owner # cat belongs to one owner, many-to-one relationship
  
  @@all = []
  
  #Initialized with a name and an Owner object
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous" #initialize with nervous mood
    @@all << self
    self.owner.cats << self
  end
  
  def self.all #display all the cats
    @@all
  end
  
end