# test-pyramid-scanner
### What :
Test pyramid is one of good practices that should be followed while working on tests. Better if more Unit tests and less Integration/service tests.

![img.png](misc/tp.png)

https://martinfowler.com/articles/practical-test-pyramid.html

This "tp-scanner" script could be used to give us a sense of TestPyramid of our applications (mainly the Unit tests + Integration/service tests).

#### _Note : There are other automation test shapes apart from the pyramid, such as the honeycomb and the test trophy. Essentially, they all emphasize the same principle: that micro-level tests(unit tests) are easier to write and run than macro-level tests(Integration/e2e tests)._

### Why :
- _Have a legacy application and want to see the maturity of apps wrt test pyramid ?_
    - this script can be invoked on adhoc basis and see the result.
- _Developing/enhancing the application and need continuous feedback ?_
    - Developers working on the applications can easily miss the count on "number of tests" that is written over the time.
    - As the Integration test increases(OR less unit tests), test suite execution time gets higher. This impacts the developer experience and CI processing      time, which eventually leads to the decision of refactoring the application.
    - Since the main issue is the lack of early feedback on the "number of tests" written, this script could fill in that void. Integrate this script as          PRE-COMMIT hook, which make the developers more proactive by providing continuous feedback.
### How :
<details><summary>Without installation</summary>

Execute loosely using the command, bash tp-scanner $HOME/{application_absolute_path}

```
   bash tp-scanner $HOME/test-pyramid-scanner/demo
```   

   ![](misc/tp_demo_output.png)
</details>

<details><summary>Install</summary>

Install as git GLOBAL PRE-COMMIT hook (better and suggested) - Use any **ONE** approach from below.

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
         - Add the below lines in "$HOME/.gitconfig file" : 
```
    [core]
    hooksPath = {home_path_dir}/.git-template/hooks
```
2. Create the below folder, if not exists already, \
           - $HOME/.git-template/hooks/ \
           - $HOME/scripts
3. Copy and paste the 'tp-scanner' script file into '$HOME/scripts' folder.
4. Append/Add the below lines in "$HOME/.git-template/hooks/pre-commit" file (create the file if missing) : 
```
    ########## test pyramid scan ##########
    tp-scanner
    ########## test pyramid scan ##########
```
6. Make 'pre-commit' executable using the below command : 
```
    chmod +x 'pre-commit'
```
7. Add the below line inside corresponding terminal startup file (like "$HOME/.zshrc") : 
```
    alias tp-scanner="$HOME/scripts/tp-scanner"
```
8. Source the terminal startup file
```
    source "$HOME/.zshrc"
```

**After the installation :** \
_Test it (git commit) with any of your existing git repo/clone this repo https://github.com/spring-projects/spring-petclinic)_


<img src="misc/tp_pet_output.png"/>

</details>

<details><summary>UnInstall</summary>

#### Approach 1. Using uninstall.sh script :
```
    bash uninstall.sh
```
#### Approach 2. Manually :
Remove the following lines from "$HOME/.git-template/hooks/pre-commit" file
```
    ########## test pyramid scan ##########
    $HOME/scripts/tp-scanner
    ########## test pyramid scan ##########
```
</details>

#### Note : 
    1. Supports only for Java , kotlin, springboot, micronaut, cucumber(bdd) based applications
    2. Support to scan Maven/Gradle multi-module at once
    3. This suite can be considered as 95% accurate :
            As the tests are identified loosely based on Unix grep command, the Counts and Percentages are NOT exact replication of test counts
            (consider a method having @test commented out, still it will be included in our test count).
