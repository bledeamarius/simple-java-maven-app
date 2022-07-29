

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
                sh "mvn clean install"
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

                script {
                    def server = Artifactory.server 'artifactory-instance'
                    rtUpload (
                        serverId: 'artifactory-instance',
                        spec: '''{
                            "files": [
                                {
                                "pattern": "**/*.jar",
                                "target": "maven-repo/"
                                }
                            ]
                        }''',
                    
                    )
                    server.upload spec:rtUpload            
                }
            }
        }

    }
}
