![Logo](images/logo.png)

<br/>
ObjectsFramework is a HTTP application framework based around objects.
The idea is that you don't think in pure routes but in objects.

I will give you an example to make the idea a bit clearer:

Imagine you have this request:
```
GET /profile/picture?profileid=100
```

In Rails you would define something like this in your routes.rb:

```
Rails::Routes.define do
  get "/profile/picture" => "profile#get_picture"
end
```

With ObjectsFramework you only have to define the object called "Profile" and the method "get_picture" (post_picture if it is a POST request, update_picture if it is an UPDATE request, and so on).

So your code would look like this:
```
class Profile < ObjectsFramework::Object
  def get_picture
    # Your code to get the profile picture
  end
end
```

## Getting Started
ObjectsFramework uses rack under the hood. So I recommend to create a standard "config.ru" (or whatever name you like) and initialize your app there.

How would this work? Let's take a look:

_config.ru_
```
# In config.ru
require 'objectsframework'

# Require your other classes (like profile.rb) here too
# For example:
require './profile'

run ObjectsFramework::Server.new
```

Then you could have an object called "Profile" in a separate file:

_profile.rb_
```
class Profile < ObjectsFramework::Object
  def get_picture
    # etc...
  end
end
```

Now if you would make the following request:
```
GET /profile/picture
```

the code in get_picture would be executed. The standard rack, request and response objects are available in a ObjectsFramework::Object, object.


## What do you think?

ObjectsFramework is still work in progress, there is a lot that can be made better. I would really like to hear your ideas and opinion.

If you've found some bug, please report via an issue.

Have fun!
