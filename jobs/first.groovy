multibranchPipelineJob('example-multibranch-pipeline') {
    branchSources {
        git {
            remote('https://github.com/known0known/hackathon-starter.git')
            includes('develop master')  // Only include develop and master branches
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(0)  // Number of old branches to keep
        }
    }
    factory {
        workflowBranchProjectFactory {
            scriptPath('Jenkinsfile')  // Path to Jenkinsfile in the repo
        }
    }
}
