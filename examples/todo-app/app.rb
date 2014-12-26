class App < ObjectsFramework::Object
  def get_index
    response.send "./public/index.html"
  end
end
