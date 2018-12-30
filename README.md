## Demo - demonstrates an application and tests

#### dependencies: 
    Java 8.  

It *has* to be Java 8.  Don't use Java 10, it will error out because Mockito doesn't work with Java 10.

#### To build with tests:
On Linux

    ./gradlew clean build

On Windows

    gradlew clean build

#### To run:
On Linux

    ./gradlew appRun

On Windows

    gradlew appRun
    
#### If you want to make it sing

Follow the directions to create a Jenkins box and a UI-testing-box, per the instructions
in docs.  


Screenshots:
![alt Cucumber report](https://raw.githubusercontent.com/7ep/demo/with_database/screenshots/cucumber_report.png)
![Feature file](https://raw.githubusercontent.com/7ep/demo/with_database/screenshots/feature_file.png)
![Jenkins pipeline](https://raw.githubusercontent.com/7ep/demo/with_database/screenshots/jenkins_pipeline.png)
![Webapp](https://raw.githubusercontent.com/7ep/demo/with_database/screenshots/webapp.png)


For convenience, there is a docker-compose file which will start up
Jenkins. The path to the Jenkinsfile is jenkins/Jenkinsfile.  In order
to run Jenkins you will need both Docker and docker-compose installed.

Also, see the ui_tests directory to see what can be done with a little
Python and Selenium, using Behave to run BDD tests.
