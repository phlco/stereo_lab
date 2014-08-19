class Vinyl
  attr_reader   :band, :album, :speed
  attr_accessor :side

  def initialize(band, album, speed)
    @band  = band
    @album = album
    @speed = speed.to_s
    @side  = 'A'
  end

  def name
    "'#{band} - #{album}'"
  end

  def play
    "♩♪♫♪ ::#{name} (Side #{side}) plays:: ♪♫♪♩"
  end

  def flip
    side == 'A' ? self.side = 'B' : self.side = 'A'
    self
  end

end
