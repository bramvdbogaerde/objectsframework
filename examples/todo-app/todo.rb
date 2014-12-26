class Todo < ObjectsFramework::Object
  def post_save
    data = JSON.parse(request.body.read)
    response.write Models::Todo.create({:content => data["content"]}).to_json
  end

  def get_all
    response.write Models::Todo.all.to_json
  end
end
