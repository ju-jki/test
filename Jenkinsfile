pipeline {
    agent any
    tools {
        nodejs 'node18.13.0'
    }

    environment {
        scannerHome = tool 'SonarQubeScanner'

        APP_NAME = 'test-my-portfolio'
        ENV = 'sit'
        TAG = '0.1.0'
    }

    stages {
        // stage('Sonarqube Scanner') {
        //     steps {
        //         withSonarQubeEnv('sonarqube') {
        //             sh "echo ${scannerHome}"
        //             sh "${scannerHome}/bin/sonar-scanner -X"
        //             sh 'echo Scanned'
        //         }
        //     }
        // }

        // stage('Read version') {
        //     steps {
        //         script {
        //             def props = readJSON file: "/var/jenkins_home/workspace/${APP_NAME}/package.json"
        //             env.version = props.version
        //             sh "echo ${env.version}"
        //             sh "echo 'TAG=${env.version}'>>.env"
        //         }
        //     }
        // }

        stage('Build Docker Image') {
            steps {
                sh "echo build...${ENV} with v${TAG}"
                sh 'chmod 777 Dockerfile'
                sh "docker build -t ${APP_NAME}:${TAG} -f Dockerfile ."
            }
        }

        stage('Start docker') {
            steps {
                sh "docker run -d -p 8081:80 ${APP_NAME}:${TAG}"
            }
        }
    }
}
