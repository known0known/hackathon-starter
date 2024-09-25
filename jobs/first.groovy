multibranchPipelineJob('hackathon-starter-multibranch-pipeline') {
    branchSources {
        git {
            id('1')
            remote('https://github.com/known0known/hackathon-starter.git')
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(10)  // Number of old branches to keep
        }
    }
    factory {
        workflowBranchProjectFactory {
            scriptPath('Jenkinsfile')  // Path to Jenkinsfile in the repo
        }
    }


    triggers {
        cron('* * * * *')
    }

}
