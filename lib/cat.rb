class Cat
  
  @@all = []
  attr_reader :name, :owner, :mood
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all.push(self)
  end
  
  def owner=(owner)
    @owner = owner
  end
  
  def mood=(mood)
    @mood = mood
  end
  
  def self.all
    @@all
  end
  
end