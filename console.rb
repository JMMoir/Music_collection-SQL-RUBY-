require('pry-byebug')
require_relative('models/artist.rb')

artist1 = Artist.new({
  'artist_name' => 'The Gaslight Anthem'
  })

  artist1.save()
