pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "OracleJDK8"
    }
    
    environment {
        registryCredential = 'ecr:us-east-1:awscreds'
        appRegistry = 'public.ecr.aws/q2p2k2w1/vprofileappimeg'
        vprofileRegistry = "https://public.ecr.aws/q2p2k2w1"
    }

    stages {
        stage('Prepare SSH') {
            steps {
                sh '''
                    mkdir -p ~/.ssh
                    echo "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
                    ssh-keyscan github.com >> ~/.ssh/known_hosts
                '''
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:mhmdnasr98/NTI-Graduation_Project.git', credentialsId: 'ssh-github'
            }
        }        
        stage('Build App Image') {
            steps {
                script {
                    def dockerImage = docker.build("${appRegistry}:${BUILD_NUMBER}", "./Docker-files/app/")
                }
            }
        }
        
        stage('Upload App Image') {
            steps {
                script {
                    docker.withRegistry(vprofileRegistry, registryCredential) {
                        dockerImage.push("${BUILD_NUMBER}")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
