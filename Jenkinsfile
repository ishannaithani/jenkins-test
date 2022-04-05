pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                 withCredentials([
                  usernamePassword(credentialsId: 'github',
                  usernameVariable: 'ishannaithani',
                  passwordVariable: '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')
                ]) {
                  checkout scm
                  sh './generate.sh'
                }                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}