pipeline{
  agent any

  stages{

    stage('Checkout') {
    steps {
        checkout scm
      }
    }


    stage('Terraform Init'){
      steps {
        withCredentials([
          [$class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'AWS_Tokens_Jiten']
        ]) {
          sh 'terraform init'
        }
      }
}

    stage('Terraform State List') {
        steps {
            withCredentials([
                [$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'AWS_Tokens_Jiten']
            ]) {
                sh 'terraform state list'
            }
        }
    }
        

    stage('Terraform Validate'){
      steps{
        sh 'terraform validate'
      }
    }

    stage('Terraform Format') {
    steps {
        sh 'terraform fmt'
      }
    }
    
    stage('Terraform Plan') {
    steps {
        withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_Tokens_Jiten']
        ]) {
            sh 'terraform plan -out=tfplan'
        }
    }
    }

    stage('Terraform Apply') {
    steps {
        input 'Apply Infrastructure?'

        withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_Tokens_Jiten']
        ]) {
            sh 'terraform apply -auto-approve tfplan'
        }
    }
}

    
  }
}