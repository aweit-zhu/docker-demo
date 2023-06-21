pipeline {
    agent {
        node {
            label 'jenkins-slave'
        }

    }

    tools{
        maven 'M3'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/aweit-zhu/docker-demo']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Image'){
            steps{
                script{
                     sh 'gpasswd -a jenkins docker && newgrp docker'
                     sh 'docker build -t aweit/docker-demo .'
                 }
            }
        }
        stage('Push image to Hub'){
             steps{
                 script{
                   withCredentials([usernameColonPassword(credentialsId: 'docker-hub', variable: 'dockerhubpwd')]) {
                      sh 'docker login -u aweit -p xx051821xx051821'
                   }
                   sh 'docker push aweit/docker-demo'
                 }
             }
        }
        stage('Deploy to k8s'){
            steps{
                sh "kubectl apply -f deploymentservice.yaml"
            }
        }
    }
}