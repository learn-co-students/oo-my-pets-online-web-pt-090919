class Dog
  # code goes here
  attr_reader :name
  attr_accessor :mood

  def initialize(name, mood = "nervous")
    @mood = mood
    @name = name
  end
end