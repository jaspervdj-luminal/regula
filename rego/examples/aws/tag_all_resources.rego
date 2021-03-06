# Copyright 2020-2021 Fugue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The following rule checks that "taggable" resource types have tag
# values with at least 6 characters.
package rules.tag_all_resources

import data.fugue

resource_type = "MULTIPLE"

taggable_resource_types = {
  "aws_cloudfront_distribution",
  "aws_cloudwatch_event_rule",
  "aws_cloudwatch_log_group",
  "aws_cloudwatch_metric_alarm",
  "aws_cognito_user_pool",
  "aws_config_config_rule",
  "aws_customer_gateway",
  "aws_db_event_subscription",
  "aws_db_instance",
  "aws_db_option_group",
  "aws_db_parameter_group",
  "aws_db_subnet_group",
  "aws_dynamodb_table",
  "aws_ebs_volume",
  "aws_eip",
  "aws_elasticache_cluster",
  "aws_elb",
  "aws_instance",
  "aws_internet_gateway",
  "aws_kms_key",
  "aws_lambda_function",
  "aws_lb",
  "aws_lb_target_group",
  "aws_network_acl",
  "aws_network_interface",
  "aws_redshift_cluster",
  "aws_redshift_parameter_group",
  "aws_redshift_subnet_group",
  "aws_route53_health_check",
  "aws_route53_zone",
  "aws_route_table",
  "aws_s3_bucket",
  "aws_security_group",
  "aws_sfn_state_machine",
  "aws_subnet",
  "aws_vpc",
  "aws_vpc",
  "aws_vpc_dhcp_options",
  "aws_vpn_connection",
  "aws_vpn_gateway",
}

taggable_resources[id] = resource {
  some resource_type
  taggable_resource_types[resource_type]
  resources = fugue.resources(resource_type)
  resource = resources[id]
}

is_tagged(resource) {
  resource.tags[_] = _
}

is_improperly_tagged(resource) = msg {
  # Any tag value has less than 6 characters.
  too_short = [k | v = resource.tags[k]; count(v) < 6]
  count(too_short) > 0
  keys = concat(", ", too_short)
  msg = sprintf("Values for these tags are too short: %s", [keys])
} else = "No tags found" {
  # The resource is not tagged at all.
  not is_tagged(resource)
}

policy[r] {
   resource = taggable_resources[_]
   msg = is_improperly_tagged(resource)
   r = fugue.deny_resource_with_message(resource, msg)
} {
   resource = taggable_resources[_]
   not is_improperly_tagged(resource)
   r = fugue.allow_resource(resource)
}
