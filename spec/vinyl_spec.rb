require_relative '../lib/vinyl.rb'

describe(Vinyl) do
  it('has a name') do
    pet_sounds = Vinyl.new('Beach Boys','Pet Sounds', 33)
    expect(pet_sounds.name).to eq("'Beach Boys - Pet Sounds'")
  end

  it('has an A side and a B side') do
    pet_sounds = Vinyl.new('Beach Boys','Pet Sounds', 33)
    expect(pet_sounds.side).to eq('A')
    pet_sounds.side = 'B'
    expect(pet_sounds.side).to eq('B')
  end

  it('has a speed') do
    pet_sounds = Vinyl.new('Beach Boys','Pet Sounds', 33)
    expect(pet_sounds.speed).to eq('33')
  end

  it('can be played') do
    pet_sounds = Vinyl.new('Beach Boys','Pet Sounds', 33)
    expect(pet_sounds.play).to eq("♩♪♫♪ ::'Beach Boys - Pet Sounds' (Side A) plays:: ♪♫♪♩")
  end
  
  it('can be flipped') do
    pet_sounds = Vinyl.new('Beach Boys','Pet Sounds', 33)
    expect(pet_sounds.flip.play).to eq("♩♪♫♪ ::'Beach Boys - Pet Sounds' (Side B) plays:: ♪♫♪♩")
  end
end
