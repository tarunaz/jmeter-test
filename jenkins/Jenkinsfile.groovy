node('maven') {

   stage('Build') {
         
       // checkout code from GitHub
       checkout scm 
      
       sh "mvn -s settings.xml clean install -DskipTests"
   }
   stage('OpenShift Build') {
       sh "rm -rf ocp-build && mkdir -p ocp-build/deployments"
       sh "cp target/*.jar ocp-build/deployments/"
       sh "oc project tarun-jmeter"
       sh "oc start-build rules --from-dir=ocp-build --wait=true -n tarun-jmeter"
   }
   stage('OpenShift Deployment') {
       echo "Waiting on OpenShift Deployment..."
       openshiftVerifyDeployment depCfg: 'rules', namespace: 'tarun-jmeter', replicaCount: '1', verbose: 'false', verifyReplicaCount: 'true', waitTime: '300', waitUnit: 'sec'
   }
   stage('JMeter Test Verification') {
       // Finds the route for the rules dev endpoint and overwrites the hostname property in jmeter.proerties with that value.
       // We have to send the output to a file rather than a variable because otherwise we'd have nested backticks.
       sh "oc get route -n tarun-jmeter | grep rules | awk '{print \$2}' > ROUTE"
       sh "sed -i \"s/hostname=.*/hostname=\$(cat ROUTE)/g\" resources/jmeter/jmeter.properties"
       sh "rm -f ROUTE"
       // Runs JMeter tests and analysis of test results
       sh "mvn -s settings.xml jmeter:jmeter jmeter-analysis:analyze"
   }
}
