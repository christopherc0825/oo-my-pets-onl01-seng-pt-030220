class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def say_species
    "I am a #{species}."
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats_to_feed = cats
    cats.each {|dog| dog.mood = "happy"}
  end
end
