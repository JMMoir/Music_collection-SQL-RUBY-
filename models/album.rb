require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id
  attr_accessor :album_name, :artist_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @album_name = options['album_name']
    @artist_id = options['artist_id'].to_i()
  end

  def save()

    sql = "INSERT INTO albums (album_name, artist_id)
           VALUES ($1, $2) RETURNING id"

    values = [@album_name, @artist_id]

    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end
end
