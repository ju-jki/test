pipeline {
    agent any
    tools {
        nodejs 'node18.13.0'
    }

    environment {
        scannerHome = tool 'SonarQubeScanner'

        APP_NAME = 'test'
        ENV = 'sit'
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

        stage('Read package.json Configuration') {
            steps {
                script {
                    def props = readJSON file: "/backend/jenkins_home/workspace/${APP_NAME}/package.json"
                    // def props = readJSON file: "/var/jenkins_home/workspace/${APP_NAME}/package.json"
                    env.version = props.version
                    sh "echo ${env.version}"
                    sh "echo 'TAG=${env.version}'>>.env"
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

        stage('Start docker'){
            steps {
                sh "docker run -p 8080:80 ${APP_NAME}"
            }
        }
    }
}
