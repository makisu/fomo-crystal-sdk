require "spec"
require "webmock"
require "json"

Spec.before_each &->WebMock.reset
Spec.before_each { Fomo.api_key = "test" }
require "../src/fomo"
