# test-pyramid-scanner
### What :
Test pyramid is one of good practices that should be followed while working on tests.

![img.png](misc/tp.png)

https://martinfowler.com/articles/practical-test-pyramid.html

The attached script could be used to give us a sense of TestPyramid of our applications (mainly the Unit tests + Integration/service tests).

### Why :
Developers working on the applications can easily miss the count on number tests that is written over the time. \
As the Integration test increases(relatively less unit test), tests get slower and leading to unnecessary refactoring. \
The main issue is the lack of early feedback about the number of tests written, this script could fill in that void and make the developers more proactive (when integrated as PRE-COMMIT hook).

### How :
Ways to execute ->
1. tp /{app_base_path}
   - tp /test-pyramid-scanner/demo
2. Integrate as git PRE-COMMIT hook (better and suggested). 
   - Add the below lines in /Users/12345/.gitconfig file :
     - [core] \
     hooksPath = /Users/12345/.git-template/hooks
   - Create this path/file if not exists already,
     - /Users/12345/.git-template/hooks/pre-commit
   - Copy and paste the complete content from 'tp' script file into 'pre-commit' file

Sample Output :
