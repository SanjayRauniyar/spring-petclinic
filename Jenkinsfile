pipeline {
    agent { label 'linux' }
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/SanjayRauniyar/spring-petclinic.git'
          }
        }
        stage('Build') {
            agent { docker 'maven:3.5-alpine' }
            steps {
                sh 'mvn clean package'
                junit '**/target/surefire-reports/TEST-*.xml'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        stage('Deploy') {
          steps {
            input 'Do you approve the deployment?'
            sh 'scp target/*.jar parakhi@10.0.2.11:/home/parakhi/pet'
            sh "ssh parakhi@10.0.2.11 'nohup java -jar /home/parakhi/pet/spring-petclinic-1.5.1.jar &'"
          }
        }
    }
}
