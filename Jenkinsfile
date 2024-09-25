pipeline {
    agent any

    options { disableConcurrentBuilds() }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''
                    ls
                    buildah build -f ./Dockerfile .
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