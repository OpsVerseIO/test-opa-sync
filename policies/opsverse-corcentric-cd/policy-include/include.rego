package example.include

import rego.v1

default allow := false
default minSecurityRatingAllowed := "1.0"
default minReliabilityRatingAllowed := "1.0"
default maxComplexityAllowed := "10"
default maxNclocAllowed := "50"

allow if [{"allow": true, "why": "security_rating"}] {
    input.metricName == "security_rating"
    input.metricValue >= minSecurityRatingAllowed
}

allow if [{"allow": true, "why": "reliability_rating"}] {
    input.metricName == "reliability_rating"
    input.metricValue >= minReliabilityRatingAllowed
}

allow if [{"allow": true, "why": "complexity"}] {
    input.metricName == "complexity"
    input.metricValue <= maxComplexityAllowed
}

allow if [{"allow": true, "why": "ncloc"}] {
    input.metricName == "ncloc"
    input.metricValue <= maxNclocAllowed
}
