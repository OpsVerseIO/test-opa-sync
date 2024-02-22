package reliability.rating

import rego.v1

default allow := false
default minReliabilityRatingAllowed := "1.0"

allow if {
    input.metricName == "reliability_rating"
    input.metricValue >= minReliabilityRatingAllowed
}
