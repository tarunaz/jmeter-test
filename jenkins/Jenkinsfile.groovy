node('maven-fortify') {

   stage('checkout') {
    
       checkout scm 
   }
  
   stage('JMeter Test Verification using jmx file directly') {
    // Expect jmx files within the jmeter folder
    sh"""
        # Run the JMeter testsFile
        ${JMETER_HOME}/bin/jmeter -n -t "resources/jmeter/HTTP Request.jmx" -l "target/jmeter/results/HTTP Request.jtl"
    """
   }
   
   performanceReport compareBuildPrevious: false,
        configType: 'ART',
        errorFailedThreshold: 0,
        errorUnstableResponseTimeThreshold: '',
        errorUnstableThreshold: 0,
        failBuildIfNoResultFile: false,
        ignoreFailedBuild: false,
        ignoreUnstableBuild: true,
        modeOfThreshold: false,
        modePerformancePerTestCase: true,
        modeThroughput: true,
        nthBuildNumber: 0,
        parsers: [[$class: 'JMeterParser', glob: 'target/jmeter/results/HTTP Request.jtl']],
        relativeFailedThresholdNegative: 0,
        relativeFailedThresholdPositive: 0,
        relativeUnstableThresholdNegative: 0,
        relativeUnstableThresholdPositive: 0
   

   stage('JMeter Test Verification using maven plugin') {
       // Finds the route for the rules dev endpoint and overwrites the hostname property in jmeter.proerties with that value.
       // We have to send the output to a file rather than a variable because otherwise we'd have nested backticks.
       sh "oc get route -n tarun-jmeter | grep rules | awk '{print \$2}' > ROUTE"
       sh "sed -i \"s/hostname=.*/hostname=\$(cat ROUTE)/g\" resources/jmeter/jmeter.properties"
       sh "rm -f ROUTE"
       
       // Runs JMeter tests and analysis of test results
       sh "mvn -s settings.xml -Dmaven.repo.local=/etc/.m2 jmeter:jmeter jmeter-analysis:analyze"
   }
   // Running Performance Plugin with JMeter to show results
    performanceReport compareBuildPrevious: false,
        configType: 'ART',
        errorFailedThreshold: 0,
        errorUnstableResponseTimeThreshold: '',
        errorUnstableThreshold: 0,
        failBuildIfNoResultFile: false,
        ignoreFailedBuild: false,
        ignoreUnstableBuild: true,
        modeOfThreshold: false,
        modePerformancePerTestCase: true,
        modeThroughput: true,
        nthBuildNumber: 0,
        parsers: [[$class: 'JMeterParser', glob: 'target/jmeter/results/HTTP Request.jtl']],
        relativeFailedThresholdNegative: 0,
        relativeFailedThresholdPositive: 0,
        relativeUnstableThresholdNegative: 0,
        relativeUnstableThresholdPositive: 0

}
