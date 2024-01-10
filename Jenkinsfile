pipeline {
    agent any

    environment {
        scannerHome = tool 'SonarQubeScanner'

        APP_NAME = 'test-my-portfolio'
        ENV = 'sit'
        TAG = '0.1.0'
    }

    stages {
        stage('Sonarqube Scanner') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "echo ${scannerHome}"
                    sh "${scannerHome}/bin/sonar-scanner -X"
                    sh 'echo Scanned'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "echo build...${ENV} with v${TAG}"
                sh 'chmod 777 Dockerfile'
                sh "docker build -t ${APP_NAME}:${TAG} -f Dockerfile ."
            }
        }

        stage('Start docker') {
            steps {
                sh "docker stop ${APP_NAME} || true"
                sh "docker rm -f ${APP_NAME} || true"
                // Detached Mode (-d option) for running background
                // --name for assign specify name
                sh "docker run -d -p 8081:80 --name ${APP_NAME} ${APP_NAME}:${TAG}"
            }
        }
    }
}
