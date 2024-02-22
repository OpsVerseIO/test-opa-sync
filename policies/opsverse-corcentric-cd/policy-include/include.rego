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
} {
    input.metricName == "reliability_rating"
    input.metricValue >= minReliabilityRatingAllowed
} {
    input.metricName == "complexity"
    input.metricValue <= maxComplexityAllowed
} { 
    input.metricName == "ncloc"
    input.metricValue <= maxNclocAllowed
}
