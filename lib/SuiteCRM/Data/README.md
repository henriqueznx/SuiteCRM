Data
====

Data enforces the same data structure as the json api specification http://jsonapi.org/ which offers a well defined data structure to communicate information across the application.

All data types offers two ways to access and modify the encapsulated data. You can access them using the interfaces or access them like an array. The access via array is only for legacy support purposes. It is recommended that you use the interfaces as much as possible.

Beware when using the encapsulated data via the array operator, you can only access the properties defined in the class.