pipeline {
    agent any
    tools { 
      maven 'MAVEN_INSTANCE' 
    }
    environment {
        env_variable = "Global value"
    }
    stages {
        stage('Build') { 
            steps {
                echo "mvn clean install"
            }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
                echo "Running build #: ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }

        stage('Deploy') {
            steps {

                echo "deploying.."
            }
        }

    }
}
