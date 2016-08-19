#!/usr/bin/env ruby

require 'aws-sdk'

# Search for a CFN output key. The stack to be queried should
# have its stack id or stack name present in the VPC_CFN_STACK
# environment variable
def lookup_output(key, default = nil)
  cfn_client = Aws::CloudFormation::Client.new
  raise 'VPC_CFN_STACK must be set in the environment' \
    unless ENV['VPC_CFN_STACK']

  # If multiple stacks should be searched for an output key (for
  # example, infrastructure resource initialization occurs through
  # multiple CFN stacks) then this could be refactored to
  # walk a list of env vars
  resp = cfn_client.describe_stacks(stack_name: ENV['VPC_CFN_STACK'])
  resp.stacks[0].outputs.each do |output|
    return output.output_value if output.output_key.eql? key
  end
  default
end
