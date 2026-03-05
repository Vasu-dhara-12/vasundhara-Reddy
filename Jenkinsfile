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
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Test') {
            steps {
                sh './run_tests.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8080:80 $DOCKER_IMAGE'
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
