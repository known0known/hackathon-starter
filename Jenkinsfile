pipeline {
    stages {
        stage('Test') {
            steps {
                sh 'buildah build -f Dockerfile .'
            }
        }
    }
}