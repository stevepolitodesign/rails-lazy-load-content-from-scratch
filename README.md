# Lazy Load Content in Rails from Scratch

![Demo](./public./demo.png)

## Step 1: Create Endpoints

1. Generate namespaced controllers.

```bash
rails g controller lazy_load/posts
rails g controller lazy_load/users
```

2. Add namespaced routes.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  ...
  namespace :lazy_load do
    defaults layout: false do
      resources :posts, only: [:index]
      resources :users, only: [:index]
    end
  end
end
```

3. Build controller actions.

```ruby
# app/controllers/lazy_load/posts_controller.rb
class LazyLoad::PostsController < ApplicationController
  def index
    @posts = Post.all
    render partial: "lazy_load/posts/post", collection: @posts
  end
end
```

```ruby
# app/controllers/lazy_load/posts_controller.rb
class LazyLoad::UsersController < ApplicationController
  def index
    @users = User.all
    render partial: "lazy_load/users/user", collection: @users
  end
end
```

4. Build views.

```html+ruby
# app/views/lazy_load/posts/_post.html.erb
<%= render partial: "shared/card", locals: { title: post.title, body: post.body, timestamp: time_ago_in_words(post.updated_at) } %>
```

```html+ruby
# app/views/lazy_load/users/_user.html.erb
<%= render partial: "shared/list_group", locals: { name: user.name, email: user.email, tooltip: pluralize(user.posts.size, 'Post')  } %>
```

> **What's Going On Here?**
> 
> - We create a [namespaced route and controller](https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing). This isn't required, but it helps keep our 
endpoints organized. We're also not limited to just `index` actions.
> - We set a [default](https://guides.rubyonrails.org/routing.html#defining-defaults) for those endpoints to [not render a layout](https://guides.rubyonrails.org/layouts_and_rendering.html#options-for-render). This means that just the raw HTML for the partials will be returned.
> - We choose to create custom views for each end point, but we could use the existing views or partials is we wanted. 
