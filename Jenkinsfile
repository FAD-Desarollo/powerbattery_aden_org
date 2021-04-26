pipeline {
    agent any

    stages {
        stage('Build') {
            stages{
                stage('Build Stage') {
                    when {
                        expression {
                            return env.GIT_BRANCH == "origin/stage"
                        }
                    }
                    steps {
                        sh '''
                            /var/jenkins_home/workspace/powerbattery_aden_org/pipelines/build/build_stage.sh
                        '''
                    }
                }
                stage('Build Master') {
                    when {
                        expression {
                            return env.GIT_BRANCH == "origin/master"
                        }
                    }
                    steps {
                            sh '''
                                /var/jenkins_home/workspace/powerbattery_aden_org/pipelines/build/build.sh
                            '''
                    }
                }
            }
        }

        stage('Push') {
            stages{
                stage('Push Stage') {
                    when{
                        expression {
                            return env.GIT_BRANCH == "origin/stage"
                        }
                    }
                    steps {
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/push/push_stage.sh'
                    }
                }
                stage('Push Master') {
                    when{
                        expression {
                            return env.GIT_BRANCH == "origin/master"
                        }
                    }
                    steps {
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/push/push.sh'
                    }
                }
            }
        }

        stage('Deploy') {
            stages{
                stage('Deploy Stage') {
                    when{
                        expression {
                            return env.GIT_BRANCH == "origin/stage"
                        }
                    }
                    steps {
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/cf_cache_on.sh'
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/deploy_stage.sh'
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/cf_cache_off.sh'
                    }
                }
                stage('Deploy Master') {
                    when{
                        expression {
                            return env.GIT_BRANCH == "origin/master"
                        }
                    }
                    steps {
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/cf_cache_on.sh'
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/deploy.sh'
                        sh '/var/jenkins_home/workspace/powerbattery_aden_org/pipelines/deploy/cf_cache_off.sh'
                    }
                }
            }
        }   
    }
}
