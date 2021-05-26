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
package rules.cfn_vpc_nacl_ingress_22

import data.tests.rules.cfn.vpc.inputs.nacl_ingress_22_infra_yaml

test_nacl_ingress_22 {
  pol = policy with input as nacl_ingress_22_infra_yaml.mock_input
  by_resource_id = {p.id: p.valid | pol[p]}
  by_resource_id["ValidVpc01Nacl"] == true
  by_resource_id["ValidVpc02Nacl"] == true
  by_resource_id["ValidVpc03Nacl"] == true
  by_resource_id["InvalidVpc01Nacl"] == false
  by_resource_id["InvalidVpc02Nacl"] == false
  by_resource_id["InvalidVpc03Nacl"] == false
}
