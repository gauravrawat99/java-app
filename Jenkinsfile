pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_IMAGE = 'graw999/java-app'
        GIT_REPO = 'https://github.com/gauravrawat99/java-app'
        BRANCH_NAME = 'main'
    }
    tools {
        maven 'Maven'  // Use the name you provided in Global Tool Configuration
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        git branch: "${BRANCH_NAME}", url: "${GIT_REPO}"
                    } catch (Exception e) {
                        error("Git checkout failed: ${e.message}")
                    }
                }
            }
        }

   stage('Build') {
            steps {
                script {
                    try {
                         sh 'pwd'
                        sh 'mvn clean package'
                    } catch (Exception e) {
                        error("Maven build failed: ${e.message}")
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    try {
                        def app = docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${env.BUILD_ID}")
                    } catch (Exception e) {
                        error("Docker build failed: ${e.message}")
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    try {
                        docker.withRegistry('', 'docker-credentials-id') {
                            def app = docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${env.BUILD_ID}")
                            app.push()
                        }
                    } catch (Exception e) {
                        error("Docker push failed: ${e.message}")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    try {
                        sh "docker run -d --name mynewapp ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${env.BUILD_ID}"
                    } catch (Exception e) {
                        error("Docker run failed: ${e.message}")
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}