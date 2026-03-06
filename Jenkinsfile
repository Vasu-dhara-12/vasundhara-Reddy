pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-galaxy:latest"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/galaxyproject/galaxy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "Building Docker Image..."
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 4000:80 $DOCKER_IMAGE'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
        success {
            echo 'Deployment successful'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
