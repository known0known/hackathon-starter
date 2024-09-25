pipeline {
    stages {
        stage('Test') {
            steps {
                sh 'buildah bud -f Dockerfile -t my-image:latest .'
            }
        }
    }
}