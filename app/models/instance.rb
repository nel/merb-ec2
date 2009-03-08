class Instance

  class << self

    def find_instances(ec2)
      raw_instances = ec2.describe_instances
      instances = raw_instances['reservationSet']['item'].first['instancesSet']['item']
      instances
    end

  end

end
