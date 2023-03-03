# test-pyramid-scanner
### What :
Test pyramid is one of good practices that should be followed while working on tests.

![img.png](misc/tp.png)

https://martinfowler.com/articles/practical-test-pyramid.html

The "tp-scanner" script could be used to give us a sense of TestPyramid of our applications (mainly the Unit tests + Integration/service tests).

### Why :
Developers working on the applications can easily miss the count on number tests that is written over the time. \
As the Integration test increases(relatively less unit test), tests get slower and leading to unnecessary refactoring. \
The main issue is the lack of early feedback about the number of tests written, this script could fill in that void and make the developers more proactive (when integrated as PRE-COMMIT hook).

### How :
#### Without installation : 
1. Execute loosely using the command, bash tp-scanner $HOME/{application_absolute_path}
```
   bash tp-scanner $HOME/test-pyramid-scanner/demo
```   

   ![](misc/tp_demo_output.png)


#### With installation :
Install as git GLOBAL PRE-COMMIT hook (better and suggested) - follow any **ONE** approach from below. \

#### Approach 1. Using install.sh script :
```
    bash install.sh
```
And then add the below line inside corresponding terminal startup file (like "$HOME/.zshrc")
```
    alias tp-scanner="$HOME/scripts/tp-scanner"
```
#### Approach 2. Manual steps :
1. Follow the below steps (manual) :
         - Add the below lines in "$HOME/.gitconfig file" : \
```
    [core]
    hooksPath = {home_path_dir}/.git-template/hooks
```
2. Create the below folder, if not exists already, \
           - $HOME/.git-template/hooks/ \
           - $HOME/scripts
3. Copy and paste the 'tp-scanner' script file into '$HOME/scripts' folder.
4. Append/Add the below lines in "$HOME/.git-template/hooks/pre-commit" file (create the file if missing) : \
```
    ########## test pyramid scan ##########
    tp-scanner
    ########## test pyramid scan ##########
```
6. Make 'pre-commit' executable using the below command : 
```
    chmod +x 'pre-commit'
```
7. Add the below line inside corresponding terminal startup file (like "$HOME/.zshrc" if on mac) : 
```
    alias tp-scanner="$HOME/scripts/tp-scanner"
```
8. Source the terminal startup file
```
    source "$HOME/.zshrc"
```

**Once the installation is done :** \
_Test it (git commit) with any of your existing git repo/clone this repo https://github.com/spring-projects/spring-petclinic)_


<img src="misc/tp_pet_output.png"/>








#### Note : 
    1. Supports only for Java , springboot, micronaut, cucumber(bdd) based applications
    2. Support to scan Maven/Gradle multi-module at once
    3. This suite can be considered as 95% accurate - As the tests are identified loosely based on Unix grep command,
       the Counts and Percentages are NOT exact replication of test counts (consider a method having @test commented out, still it will be included in our test count).
