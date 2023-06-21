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

        stage('Deploy to k8s'){
            steps{
                sh "kubectl apply -f deploymentservice.yaml"
            }
        }
    }
}
