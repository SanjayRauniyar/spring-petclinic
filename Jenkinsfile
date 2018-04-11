pipeline {
    agent { label 'linux' }
    tools {
    maven 'M3'
  }
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/SanjayRauniyar/spring-petclinic.git'
          }
        }
        stage('Build') {
            steps {
                sh 'mvn clean compile'
                         
            }
        }
      stage('Test') {
      steps {
        sh 'mvn test'
        junit '**/target/surefire-reports/TEST-*.xml'
        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
      }
    }  
        
       
    }
}
