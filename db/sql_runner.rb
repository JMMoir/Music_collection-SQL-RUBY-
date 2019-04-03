require('pg')

class SqlRunner

  def SqlRunner.run(sql, values =[])
    #connect to db
      begin
      db = PG.connect({dbname: 'music_collection',
                       host: 'localhost'})
    #prepare statement
    db.prepare("query", sql)
    #exec prepare statement
    result = db.exec_prepared("query", values)
    #close db connection
  ensure
    db.close()
  end
  return result
  end
end
