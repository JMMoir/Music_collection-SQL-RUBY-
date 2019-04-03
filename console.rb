require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

artist1 = Artist.new({
  'artist_name' => 'The Gaslight Anthem'
  })

  artist1.save()

  album1 = Album.new({
    'album_name' => 'The 59th Sound',
    'genre' => 'Rock',
    'artist_id' => "#{artist1.id}"
    })

  album1.save()

  album2 = Album.new({
    'album_name' => 'American Slang',
    'genre' => 'Rock',
    'artist_id' => "#{artist1.id}"
    })

  album2.save()

  

  binding.pry


  nil
