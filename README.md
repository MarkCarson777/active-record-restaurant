Restaurant App
==============

The two main user stories for the app are:

1. As a user we want to be able to list all the restaurants
2. As a user we want to be able to click on that restaurant and see some details

Before you get started we need to make sure that the list of gemfiles that were stored in our Gemfile are installed into our application, so you need to run bundle install in the terminal.

Next you need to create your database for the application which you can do by simply executing rake db:create in the terminal

Migration
========

Now you need to create your first migration to be able to create restaurants.

It’s important to give our migration a timestamp in the filename so that it is unique. 

We can do this by setting a variable in the terminal like so:

TIMESTAMP=`rake db:timestamp`

and then creating a new file while interpolating the TIMESTAMP variable:

touch db/migrate/${TIMESTAMP}_create_restaurants.rb

This will have created a new file in your db directory.

You can then go into the new file and add the migration.

You want each of the new restaurants to be created with a name column and a city column which we can set as the string data type and then we just want to add in the timestamp when it is created.

With that set up, you can now run rake db:migrate to make these changes to our database

In your terminal you can see that the migration has run successfully. If it fails, rake will abort.


Model
=====

Next you need to create your model and you can do that by simply creating a file in our models directory called restaurant.rb and adding some the following to it

touch models/restaurant.rb

# models/restaurant.rb
class Restaurant < ActiveRecord::Base
end

You can now test the model you’ve created in the rake console which you can open with rake console and then try to create some instances. **rake console**

You’ll see if you don’t put the correct datatypes, a new restaurant won’t be created but with the right ones, they are all there. Notice that the timestamps are also automatically generated thanks to our migration.


Seed
====

So here we can just create a simple loop that will be executed when we run the seed file with rake db:seed


Start the app
==========

Start the app with:

ruby app.rb

Then thanks to Sinatra, we have a server listening on port 4567 which we can now access in the browser.

In the terminal, we can also our HTTP requests when they are being made.

Displayed in the browser is the default placeholder that we had in GET request in the app.rb. This can be changed and then refresh the page to see those changes.


HTML
=====

However you don’t want to use the default. You want to use HTML. To connect your HTTP request to a specific HTML page that you want to build, you use the erb syntax which stands for embedded ruby and point it to a page:

erb :index

You won’t have an index page yet so create one in our views directory

<h1>My Restaurant App</h1>
<p>The list of my favorite restaurants</p>**

HTML is the backbone of all front end development. It’s the language that all browsers understand and it’s what we use to build our web pages.

The content we have at the moment is static. We want to make it dynamic.

The syntax for this in erb is like follows:

<% %> is only computed
<%= %> is computed and injected


Display Restaurants
===============

You need to display your list of restaurants. To do this, in your app.rb, you want to fetch all the restaurants from your database and assign it to an instance variable. A local variable would not be available in our view file.

@restaurants = Restaurant.all

Now you can make use of that instance variable in your view file and create a loop to display your restaurants


Display restaurant details
====================

You want to be able to click on each restaurant and display some details about it.

If you take a look at our restaurants in the console again, you can see each restaurant has an id. This is what you’re going to use to route to the specific page for each of the restaurants.

get '/restaurants/:id' do
end

This is another HTTP GET request that will run the block that you provide it when you make a request to the url that you provide it.

Before you add the block, you need to make some adjustments to the HTML to make the restaurants clickable.

We need to wrap it in an a tag and in the href attribute we provide it with the route we want it to go to when we click on it.

You can see in the browser that you are going to the correct url, you just haven’t put anything inside the HTTP request for it display yet.

So Sinatra, has a very useful feature that allows you to access the id from the URL params.

You can see what params are available by using a useful debugging tool called prybye bug and putting it inside your HTTP request.

require 'pry-byebug'; binding.pry

This will stop the execution of the code and allow you to inspect the params.

If you type params into the terminal, you should see our id.

You can use the params method from Sinatra to assign our id param to a local variable

restaurant_id = params[:id]

This by itself won’t do anything so you need to find the matching restaurant and assign it to an instance variable that you can use in a new show view page.

@restaurant = Restaurant.find(restaurant_id)

Now create your show page and add some basic HTML to display your restaurant details

<h1><%= @restaurant.name %></h1>
<p><%= @restaurant.city %></p>

And that’s user journey number two!


Add Back Button
=============

One final little finishing touch would be to add a back button. It’s considered very bad user experience if you have to use the browser to navigate through your app.

It’s as simple as adding a new little a tag that routes back to your first HTTP request like so:

<a href="/">back</a>


Enjoy!