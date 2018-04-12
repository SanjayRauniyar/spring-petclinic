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
       
      }
    } 
        
        stage('Package') {
      steps {
        sh 'mvn package'
        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
      }
        }
        
         stage('Deploy') {
          steps {
            sh 'cp target/*.jar /home/****/pet'
            sh "ssh ***** 'nohup java -jar /home/****/pet/spring-petclinic-1.5.1.jar &'"
          }
        }
       
    }
}
