require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id
  attr_accessor :album_name, :artist_id, :genre

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()

    sql = "INSERT INTO albums (album_name, genre, artist_id)
           VALUES ($1, $2, $3) RETURNING id"

    values = [@album_name, @genre, @artist_id]

    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album)  }
  end

  def artist()
    sql = "SELECT * from artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end


end
