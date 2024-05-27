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
       

        stage('Build App Image') {
            steps {
                script {
                    dockerImage = docker.build("${appRegistry}:${BUILD_NUMBER}", "./Docker-files/app/")
                }
            }
        }
        
        stage('Upload App Image') {
    steps {
        script {
            docker.withRegistry('https://public.ecr.aws/q2p2k2w1', 'awscreds') {
                dockerImage.push("${BUILD_NUMBER}")
                dockerImage.push('latest')
            }
        }
    }
}
