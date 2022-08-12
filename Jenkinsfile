

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
                sh "docker build --build-arg BUILD_NUMBER=${BUILD_NUMBER} -t $DOCKER_REGISTRY/$IMAGE_NAME:$BUILD_NUMBER ." 
            }
        }

        stage('Login to DockerHub') {            
            environment {
                DOCKERHUB_CREDENTIALS = credentials('my-docker-hub-credentials')
            }

            steps{
                sh "docker login -u=${DOCKERHUB_CREDENTIALS_USR} -p=${DOCKERHUB_CREDENTIALS_PWD}"
            }
        }
        stage('Push to Docker Hub') {
           
            steps {
                
                sh "echo 'push tot dockerhub' "
                sh "docker push $DOCKER_REGISTRY/$IMAGE_NAME:$BUILD_NUMBER"
            }
        }


    }
}
