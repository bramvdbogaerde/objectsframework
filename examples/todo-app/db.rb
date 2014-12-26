MongoMapper.connection = Mongo::Connection.new
MongoMapper.database = "objectsframework-todo-example"

module Models
  class Todo
    include MongoMapper::Document
    key :content
  end
end
