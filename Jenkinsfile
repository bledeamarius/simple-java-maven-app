

pipeline {
    agent any
    // agent { dockerfile true }
    environment {
        DOCKER_REGISTRY = 'maryusmm'
        IMAGE_NAME      = 'simple-java-maven-app'
    }
    tools { 
      maven 'maven-instance' 
    }

    stages {
        stage('Build docker image') { 
            steps {
                sh "docker build -t $DOCKER_REGISTRY/$IMAGE_NAME:$BUILD_NUMBER" .
            }
        }

        stage('Push to Docker Hub') {
            environment {
                DOCKERHUB_CREDENTIALS = credentials('my-docker-hub-credentials')
            }
            steps {
                sh "echo 'push tot dockerhub' "
            }
        }


    }
}
