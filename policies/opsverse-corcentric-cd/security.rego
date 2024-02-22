package security.rating

import rego.v1

default allow := false
default minSecurityRatingAllowed := "1.0"

allow if {
    input.metricName == "security_rating"
    input.metricValue >= minSecurityRatingAllowed
}
