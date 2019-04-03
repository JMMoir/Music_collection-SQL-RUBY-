require_relative('../db/sql_runner.rb')

class Artist

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
end
