

pipeline {
    
    agent { dockerfile true }
    
    tools { 
      maven 'maven-instance' 
    }

    stages {
        stage('Build') { 
            steps {
                sh "mvn clean install"
            }
        }


    }
}
