# Grape Example with Rails

This is a repo with a crud application showing how to use Rails with Grape API.

The repository has two main branches, one use ActiveRecord extensively making direct calls on Grape API, 
the other one use an architecture using services as domain logic hub using repositories to access data using ActiveRecord.
Also we transform all incoming data to Request Objects for future validations and request logic.

The main advantage of doing this is that you can separate the layers of your application and start to use more PORO's and
less frameworks on your main layer application.

To do:

* Create domain objects and use then instead of ActiveRecord. Keep ActiveRecord only on repository layer.
* Create more validation logic on Request Objects
