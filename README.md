# unai
  This Swift program models a digital classroom where users can access files and communicate via chat logs. 
  The main class is DigitalClassroom, which has an access code, an admin user, a list of users, chat logs, and files. 
  The class has methods to add and remove users, files, and chat logs, as well as to set a new admin user and to terminate the classroom.
  Users are represented by the class User, which has a username, an isAdmin boolean, and a list of notifications. 
  The class has methods to add and clear notifications. 
  Files are represented by the class File, which has a name, an owner, and a list of annotations. 
  The class has a method to add annotations to the file.
  The program also defines an AnnotationType enum to represent different types of annotations. 
  Finally, the program creates an instance of the DigitalClassroom class and adds, removes, and retrieves files and users from it.
