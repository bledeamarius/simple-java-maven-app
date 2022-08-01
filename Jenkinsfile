

pipeline {
    
    agent { dockerfile true }
    
    tools { 
      maven 'MAVEN_INSTANCE' 
    }

    stages {
        stage('Build') { 
            steps {
                sh "mvn clean install"
            }
        }


    }
}
