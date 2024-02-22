package example.include

import rego.v1
default allow := false
default minSecurityRatingAllowed := "1.0"
default minReliabilityRatingAllowed := "1.0"
default maxComplexityAllowed := "10"
default maxNclocAllowed := "50"
default maxNewViolationsAllowed := "10"

allow if {
    input.metricName == "security_rating"
    input.metricValue >= minSecurityRatingAllowed
}

allow if {
    input.metricName == "reliability_rating"
    input.metricValue >= minReliabilityRatingAllowed
}

allow if {
    input.metricName == "complexity"
    input.metricValue <= maxComplexityAllowed
}

allow if { 
    input.metricName == "ncloc"
    input.metricValue <= maxNclocAllowed
}

allow if {
    input.metric == "unit-test"
}

allow if {
    input.status == "PASSED"
    input.metric == "code-coverage"
}

allow if {
    input.status == "PASSED"
    input.metric == "vulnerability"
}

allow if { 
    input.status == "PASSED"
    input.metric == "static-code-analysis"
}

allow if {
    input.status == "PASSED"
    input.metric == "integration-test"
}