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
        
         stage('Deployment') {
            
          steps {
            echo "running the application"
              sh 'pwd'
             }
         }
        
         agent { dockerfile true }
        
       
       
    }
}
