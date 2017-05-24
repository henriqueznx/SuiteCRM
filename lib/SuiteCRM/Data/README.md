Data
====

The Data namespace is a collection of Interfaces and classes whicch enforces the same data structure as the json api specification (http://jsonapi.org/). This specification offers a well defined data structure to communicate information across the application.

All data types offers two ways to access and modify the encapsulated data. You can access them using the interfaces or access them like an array. The access via array is only for legacy support purposes. It is recommended that you use the interfaces as much as possible.

Beware when using the encapsulated data via the array operator, you can only access the properties defined in the class.


##How the namespace is organized

A Resource object is the highest level object.
A Attributes object is the lowest level object.
