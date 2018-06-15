Controller
Two models users and currencies

Models

Users has many currencies and currencies belong to users
Model gives us the associations meaning we have method such as currencies.

The instance method is used in Controller so that is available to us in the erb form view.

We use render when we dont want to send user to another page for example we would render the index page instead of redirect user to index page. Another advantage with render is that we are able to use instance method when rendering the form as opposed to redirect where we have to find the object.

When a user first comes to the site they are going to use a get request to get to the site.

User will us a post request when they enter data and get redirect to another page.
