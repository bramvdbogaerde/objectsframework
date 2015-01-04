class Todo < ObjectsFramework::Object
  include MongoMapper::Document
  key :content

  def post_save
    data = JSON.parse(request.body.read)
    response.write Todo.create({:content => data["content"]}).to_json
  end

  def get_all
    response.write Todo.all.to_json
  end
end
