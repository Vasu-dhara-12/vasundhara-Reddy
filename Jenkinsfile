pipeline {
    agent any

    environment {
        IMAGE_NAME = "vasundhara-app"
        CONTAINER_NAME = "vasundhara-container"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Vasu-dhara-12/vasundhara-Reddy.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d -p 4000:80 --name $CONTAINER_NAME $IMAGE_NAME
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
