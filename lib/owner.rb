class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    
  end

end