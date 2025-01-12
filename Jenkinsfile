// Jenkins Pipeline script for Terraform CI/CD

pipeline {
    agent any

    environment {
        //GIT_REPO = 'https://github.com/your-org/your-terraform-repo.git' // Replace with your repository URL will be used only if not configuring SCM pipeline
        //BRANCH = 'main' // Replace with your branch name
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')          // AWS Access Key (stored in Jenkins Credentials)
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')     // AWS Secret Key (stored in Jenkins Credentials)
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Clone the Terraform code from GitHub
                    git branch: main, url: 'https://github.com/pankajsao11/serverless-webapp.git'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {                    
                    sh 'terraform init'  // Initialize Terraform
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {                    
                    sh 'terraform validate'  // Terraform validate for syntax checking
                }
            }
        }

        stage('Terraform format') {
            steps {
                script {                    
                    sh 'terraform fmt --recursive' // Terraform format for formatting code
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and display the Terraform execution plan
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    // Run terraform apply only for non-PR environments or specific conditions
                    return params.APPLY_CHANGES == true
                }
            }
            steps {
                script {
                    // Apply the Terraform changes
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after execution
            cleanWs()
        }
        success {
            echo 'Terraform pipeline executed successfully!'
        }
        failure {
            echo 'Terraform pipeline failed. Please check logs!'
        }
    }
}
