pipeline {
    agent any

    tools {
        maven 'maven' 
        jdk 'jdk17' 
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build with Maven') {
            steps {
                echo 'Building application with Maven...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t project-mgmt-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                // Stop and remove any existing container with the same name
                sh '''
                    docker rm -f project-mgmt-container || true
                    docker run -d -p 9090:9090 --name project-mgmt-container project-mgmt-app
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
