class Dog
  
  attr_reader :name, :owner, :mood
  
  @@all = []
  
  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end
  
  def owner=(name)
    @owner = name
  end
  
  def mood=(feel)
    @mood = feel
  end
  
  def self.all
    @@all
  end
  
end