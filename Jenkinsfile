pipeline {
    agent any

    environment {
        APP_NAME = "my-app"
        PORT = "4000"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/your-repo.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying ${APP_NAME} on port ${PORT}"

                // Example 1: Run a Java Spring Boot app on port 4000
                // sh "java -jar target/${APP_NAME}.jar --server.port=${PORT} &"

                // Example 2: Run a Node.js app on port 4000
                // sh "PORT=${PORT} node server.js &"

                // Example 3: Docker deployment exposing port 4000
                sh """
                   docker build -t ${APP_NAME}:${env.BUILD_NUMBER} .
                   docker run -d -p ${PORT}:${PORT} ${APP_NAME}:${env.BUILD_NUMBER}
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
