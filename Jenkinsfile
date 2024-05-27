pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "OracleJDK8"
    }
    
    environment {
        registryCredential = 'ecr:us-east-1:awscreds'
        appRegistry = 'public.ecr.aws/q2p2k2w1/vprofileappimeg'
        awsRegion = 'us-east-1'
    }

    stages {
        stage('Build App Image') {
            steps {
                script {
                    dockerImage = docker.build("${appRegistry}:${BUILD_NUMBER}", "./Docker-files/app/")
                }
            }
        }

        stage('Authenticate Docker with ECR') {
            steps {
                script {
                    sh '''
                        aws ecr get-login-password --region ${awsRegion} | docker login --username AWS --password-stdin ${appRegistry}
                    '''
                }
            }
        }
        
        stage('Upload App Image') {
            steps {
                script {
                    sh "docker push ${appRegistry}:${BUILD_NUMBER}"
                    sh "docker push ${appRegistry}:latest"
                }
            }
        }
    }
}
