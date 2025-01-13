// pipeline {
//     agent any

//     environment {
//         DOCKER_IMAGE = 'eureka-server'
//         DOCKER_TAG = "${BUILD_NUMBER}"
//         REGISTRY_CREDENTIALS = 'docker-hub-credentials'
//         DOCKER_REGISTRY = 'your-registry'  // Replace with your registry
//     }

//     tools {
//         maven 'M3'
//         jdk 'JDK17'
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Build') {
//             steps {
//                 sh 'mvn clean package -DskipTests'
//             }
//         }

//         stage('Test') {
//             steps {
//                 sh 'mvn test'
//             }
//             post {
//                 always {
//                     junit '**/target/surefire-reports/*.xml'
//                 }
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv('SonarQube') {
//                     sh 'mvn sonar:sonar'
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
//                 }
//             }
//         }

//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     docker.withRegistry("https://${DOCKER_REGISTRY}", REGISTRY_CREDENTIALS) {
//                         docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
//                         docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push("latest")
//                     }
//                 }
//             }
//         }

//         stage('Deploy to Development') {
//             steps {
//                 script {
//                     // Add your deployment commands here
//                     sh """
//                         docker-compose down || true
//                         docker-compose up -d
//                     """
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             cleanWs()
//         }
//         success {
//             echo 'Pipeline succeeded!'
//         }
//         failure {
//             echo 'Pipeline failed!'
//         }
//     }
// }



pipeline {
    agent any
    
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git url: 'https://github.com/syskantechnosoft/eureka-server2025.git'
                    echo 'git checkout is done, code pulled from GitHub to Jenkins workspace'
                }
            }
        }
        stage('Mvn Build') {
            steps {
                script {
                    bat 'mvn clean install'
                    echo 'maven build is done'
                }
            }
        }
        stage('Docker Image') {
            steps {
                echo "BUILD_NUMBER is: ${BUILD_NUMBER}"
                bat 'docker build -t eureka-server-i -f Dockerfile .'
                echo 'docker image is created'
            }
        }
        stage('Docker Deploy') {
            steps {
                bat 'docker container rm -f eureka-server-c || true'
                bat 'docker run --name eureka-server-c -itd -p 8761:8761 eureka-server-i'
                echo 'docker container is created'
                echo 'docker container is running'
            }
        }
    }
}
