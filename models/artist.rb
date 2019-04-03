require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist

  attr_reader :id
  attr_accessor :artist_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_name = options['artist_name']
  end

  def save()
    sql = "INSERT INTO artists (artist_name)
            VALUES ($1) RETURNING id"

    values = [@artist_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map { |artist| Artist.new(artist)  }
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |album| Album.new(album)  }
  end

  def update()
    sql = "UPDATE artists SET artist_name = $1 WHERE id = $2"
    values = [@artist_name, @id]
    SqlRunner.run(sql, values)
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
