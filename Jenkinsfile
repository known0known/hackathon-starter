pipeline {
    agent any

    options { disableConcurrentBuilds() }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''
                    ls
                    podman build -f ./Dockerfile .
                '''
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