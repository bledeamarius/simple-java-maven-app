
// def server = Artifactory.server 'artifactory-instance'
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
 
    // Optional - Associate the uploaded files with the following custom build name and build number,
    // as build artifacts.
    // If not set, the files will be associated with the default build name and build number (i.e the
    // the Jenkins job name and number).
    buildName: 'holyFrog',
    buildNumber: '42',
    // Optional - Only if this build is associated with a project in Artifactory, set the project key as follows.
    project: 'my-project-key'
)
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

                rtUpload()
            }
        }

    }
}
