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

        stage('Create Dockerfile') {
            steps {
                sh '''
                echo "Creating Dockerfile..."

                cat <<EOF > Dockerfile
                FROM nginx
                COPY . /usr/share/nginx/html
                EXPOSE 80
                CMD ["nginx","-g","daemon off;"]
                EOF
                '''
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
