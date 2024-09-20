# Project: Post Ur Blog

This is a learning project on `Ruby on Rails`. 

# Instructions

Create a rails project from terminal
```bash
rails new project-name
```

Boot the project from `localhost:3000`
```bash
rails s
```
Create first database model `blog`
```bash
rails generate model BlogPost title:string body:text
```

Now create tables from the database migration file
```bash
rails db:migrate
```

**Note:** By default, migration tables are created at `/storage/development.sqlite3`. 

Create a controller "BlogPostsController"
```bash
rails generate controller BlogPosts index --skip-routes
```
Creating the controller also creates views at `views/blog_posts/` directory.



```
Model Name: BlogPost
DB_table Name: blog_posts
Controller Name: blog_posts_controller | BlogPostsController
```

