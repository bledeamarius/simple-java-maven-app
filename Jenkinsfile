pipeline {
    agent any
    environment {
        env_variable = "Global value"
    }
    stages {
        stage('Build') { 
            steps {
                echo "Environment variable: $env_variable"
            }
        }

        stage('Test') {
            steps {
                echo 'Testing..'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }

        stage('Deploy') {
            steps {

                echo "deploying.."
            }
        }

    }
}
