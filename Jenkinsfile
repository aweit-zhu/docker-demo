pipeline {
    agent any
    tools{
        maven 'M3'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/aweit-zhu/docker-demo']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Image'){
            steps{
                script{
                     sh 'docker build -t ragul05/devops-integration:v1.$BUILD_ID .'
                     sh 'docker build -t ragul05/devops-integration:latest .'
                 }
            }
        }
        stage('Push image to Hub'){
             steps{
                 script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u ragul05 -p ${dockerhubpwd}'

                    }
                    sh 'docker push ragul05/devops-integration:v1.$BUILD_ID'
                    sh 'docker push ragul05/devops-integration:latest'
                 }
             }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}