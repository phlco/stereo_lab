# Let's Play Some Tunes!

## Vinyl (Prologue)

### Here is an example set of feature descriptions:

Create a class `Vinyl` for records that allows one to:

- It has a name and two sides, A and B, and three possible speeds (33, 45, 78).
- You can play a side, and the music plays!
- You can flip the record to play the other side.

To show you how this is done, there is an [example Rspec test suite](spec/vinyl_spec.rb) and the [requisite class](lib/vinyl.rb). Check them out to get an idea of how the finished products should look.

*Now, let's make some beautiful music together!*

## Cassette (Part I)

### Take ambiguous feature descriptions, annotations, and code examples, and turn them in to tests.

Of highest importance here is to see how ambiguous directions for *features*, **highlighted like this**, can be translated into code examples. Think about what is necessary to complete the behaviors as they are described or access attributes either described or *implied*. Once you have code examples, you can write Rspec tests by cutting and pasting your code into the Rspec syntax.

After the part below, you will have to turn the descriptions in to code examples as well as turn the code examples in to Rspec, so think about how it's done! Note: all behaviors should be called on *objects*, not on classes -- in general we will shy away from class methods as good programmers.

### Use Rspec to write a spec file for the following description of a `Cassette` class and its features.

- **Contains multiple songs that can be accessed.**
  - Let's think of a real-world example we can model with our object, and a way to structure the basic parts of our object to fulfill this need. For example:
```ruby
annielennox_diva.songs
# => [ "Why", "Walking on Broken Glass", "Precious",
#      "Legend in My Living Room", "Cold",
#      "Money Can't Buy It", "Little Bird", "Primitive",
#      "Stay by Me", "The Gift" ]
annielennox_diva.songs[6]
# => "Little Bird"
```
  - Then you must think: *How will I create this object*??? If we have a songs attribute that works like an array, it might make sense to pass the class an array when you instantiate it, like:
```ruby
annielennox_diva = Cassette.new([ "Why", ... "The Gift" ])
```
  - Now we can create the objects that we are going to test, and get our *workflow* going!
- **Plays in order.**
  - "Plays" is an action, ie a behavior (as opposed to an attribute, as the songs were above). So let's imagine how that might work -- not just once, but a few times (things change with actions):
```ruby
annielennox_diva.play_song
# => "♩♪♫♪ ::'Why' plays:: ♪♫♪♩"
annielennox_diva.play_song
# => "♩♪♫♪ ::'Walking on Broken Glass' plays:: ♪♫♪♩"
```
- **Has a playhead that can be moved forward and backward.**
  - Now, is a "playhead" a behavior or an attribute? [What is a playhead](https://www.google.com/search?q=playhead&oq=playhead&aqs=chrome..69i57j0l5.1301j0j4&sourceid=chrome&es_sm=91&ie=UTF-8#q=what+is+a+playhead&safe=off&spell=1)? (*Note: please don't ever complain that you don't know what something is in this time of the ubiquitous Internet -- you can ask for clarification, but not simply "What is this..." Look it up!*) If a playhead shows what song you will play next, then our examples need to include the use of `#play_song`. But is playhead all that's implied here? "moved forward and backward" also implies action, ie behaviors. How can we implement these? Here is one example (I just dreamed it up!):
```ruby
annielennox_diva.play_song
# => "♩♪♫♪ ::'Why' plays:: ♪♫♪♩"
annielennox_diva.playhead
# => 1
annielennox_diva.fast_forward(2)
# => 3 # having this return the playhead position could be helpful!
annielennox_diva.playhead
# => 3
annielennox_diva.play_song
# => "♩♪♫♪ ::'Legend in My Living Room' plays:: ♪♫♪♩"
annielennox_diva.rewind(1)
# => 3 # having this return the playhead position could be helpful!
annielennox_diva.play_song
# => "♩♪♫♪ ::'Legend in My Living Room' plays:: ♪♫♪♩"
```
- **When it's reached the end of the tape it must be rewound to play again.**
  - So, is this a new behavior? If we've already written and tested a `#rewind` behavior, what if we decided to just say calling that behavior with zero would make us reset to the beginning of the tape, like:
```ruby
annielennox_diva.fast_forward(4)
annielennox_diva.rewind(0)
# => 0
annielennox_diva.playhead
# => 0
```

## Mixtape (Part II)

### Take annotated descriptions and starter code and turn them in to tests.

Given the class created as such:

```ruby
song_list = [
    "Moribund the Burgermeister - Peter Gabriel",
    "Theme from Jurassic Park - John Williams",
    "Walking in Memphis - Marc Cohn",
    "You Can Call me Al - Paul Simon",
    "Free Fallin' - Tom Petty",
    "some dan fogelberg song - Dan Fogelberg",
    "Graceland - Paul Simon",
    "Sledgehammer - Peter Gabriel",
    "Heathcliff's Haiku Warriors - DMB",
    "Night Moves - Bob Seger"
]

middle_school_mix_01 = Mixtape.new(song_list)
```

Think about how you might craft a class that implements the behaviors and attributes described in the **highlighted ambiguous directions.** There will be helpful guidance as to how to read the directions and prompts you to write specific code examples to implement them.

### Use Rspec to write a spec file for the following description of a `Mixtape` class that inherits from `Cassette`.

- **When you play a song, it includes the name of the song and the artist.**
  - Is this something new? Will it work given the tests that already exist (for `Cassette`)? Experiment! Your new class will need access to the `Cassette` class's code, correct?
- **You can seek for the next song by a given artist.**
  - Ah! Here is a behavior! It can be called `#seek` and it needs to be "given" an artist. Then it will set the playhead (this is how we are identifying where we are in the tape, after all) to the right spot. Hmmmm, does this mean that we need to know where the playhead is when we call this method? And wait: what if that artist doesn't exist, or has no more songs on the tape? How should that method act?
- **You can ask for a list of songs organized by artist.**
  - This suggests that there should be a method that returns a certain value, but doesn't really *change* anything. Ie, this should be used *like* and attribute, even tho it does not access some value directly. We can trnasform our song list into another list, this time where artists can be keys and the list of their songs can be arrays that those keys point to... A nice name might be `#songs_by_artist`.
- **We can label the mixtape with a message or explanation.**
  - And this is easy: all we want is to add another attribute, with the name (possibly) of `label`.

## Stereo (Part III)

### Take annotated feature descriptions and turn them in to tests.

Now we will work without starter code. In order to think broadly about what the class looks like, read all of the descriptions and think about them before  starting to implement the code examples / tests.

### Use Rspec to write a spec file for a `Stereo` class with the following features.

- **Must be on before operating.**
  - If something `#is_on?`, then it can also be off, right? There is an assumed binary there -- a description of the object (ie, an attribute). Any further operations (actions, right? ... behaviors?) must be contingent upon this stereo "being on." How can we test this?
- **Volume can be raised and lowered from 1 to 10.**
  - This sounds like both an attribute (volume) and behaviors that act on it...
- **Must have a cassette tape inserted before playing it.**
  - Again there is a binary here: the stereo can either have `#tape?` or not, right? That sounds like an attribute. Also suggested is that you can `#play_tape`, but also `#insert_tape` or `#remove_tape`, right? And what is a "cassette tape"? Do we an implementation of cassette objects we can use?
- **Play will play a song and move the cassette's playhead forward one.**
  - Aha! Well, we already wrote this, right? How can we add this *interface* to the object, but write the method in such a way as to ensure that it simply performs that action on the associated object that itself implements this behavior?
- **Rewind moves the cassette's playhead back to the beginning.**
  - It looks like another behavior for the stereo that should act upon (and mirror) a similar action in the associated cassette.

## Sweet Boombox! (Part IV)

### Take ambiguous feature descriptions with a data structure and turn them in to tests.

Our stereo is going to add a radio that we can tune to different stations! Use the list of stations below (in a suggested format) to think about how you can structure your growing class.

```ruby
radio_stations = {
    :fm => {
        "88.5"  => "I'm Terry Gross and this is is WHYY",
        "100.3" => "Barsky in the Mornings on Y100!",
        "100.7" => "WMMS The Buzzard! SPORTS!",
        "102.1" => "NEW ROCK MILROCK"
    },
    :am => {
        "1650.0" => "Traffic Reports with Curtis Tarver",
        "1450.5" => "Coast to Coast with Art Bell",
        "1250.0" => "It's Oprah"
    }
}
```

### Use Rspec to continue to write the spec file for the `Stereo` class, integrating in these descriptions of features.

- **Stereo will only play cassettes when switched to cassette mode.**
- **Stereo will only play the radio when switched to radio mode.**
- **It can play AM and FM stations.**
- **Scan brings up the next station.**
- **Tune will move the station by 0.2 MHz, stopping on the odd-numbered tens-places (88.7, 88.9, 89.1, 89.3 eg) between 87.8 and 108 MHz for FM Stations. It will move AM frequencies by 0.5 kHz on the 535 - 1700 kHz band.**
- **When the radio is within 1 frequency (MHz or kHz respectively) we can hear a station but it contains static...**
  - **Static is represented by "%20" instead of spaces, like:**
```ruby
# => "You%20are%20now%20listening%20to%20'Coast%20to%20Coast%20with%20Art%20Bell'%20on%20AM%201450.5!"
```
- **When directly on a station we can hear the station call just fine.**

# Bonus!

Hey buddy, ***do this*** (get used to seeing this instruction! :)...

- Add a CD player functionality to the Stereo that takes CDs
- CDs are similar to Cassettes except they don't need to be rewound
- CDs can be played in order, skipped to a particular song or shuffled.

And then, if you're nuts, ***do this***:

- Return to the `Cassette` class, and change it!
  - Make sure it has two sides, Side A and Side B.
  - Make it so that you can flip your tape (in the stereo as well).
  - The number of songs on each side needn't be the same, but the playhead on one side counts up and the other counts down.
    - No matter what, when the tape finishes a side, you can flip it and have the playhead on the opposite side at its first song.
  - You can label both sides of a mixtape, like "Wrestling Jog Mix" on one and "I Hate Laurie Forever" on the other.
