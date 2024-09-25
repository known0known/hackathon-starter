pipelineJob("secondjob") {
    description("""
<h1>Second Job</h1>
<p>This is a second job</p>""")
    parameters {
        stringParam('name', "", 'name of the person')
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/known0known/hackathon-starter.git')
                    }
                    branch('master')
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}