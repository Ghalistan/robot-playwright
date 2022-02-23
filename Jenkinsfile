pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:focal' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'echo test'
            sh 'npm install'
            sh 'npm run test'
         }
      }
   }
}