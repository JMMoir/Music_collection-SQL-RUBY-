require_relative('../db/sql_runner.rb')


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
end
