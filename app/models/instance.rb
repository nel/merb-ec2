class Instance
  class << self

    def find_instances(ec2)
      raw_instances = ec2.describe_instances
      instances = raw_instances['reservationSet']['item'].map { |i| i['instancesSet']['item'].first }
      instances
    end

  end

  include DataMapper::Resource

  property :id,     Serial
  attr_accessor :ami
  attr_accessor :size
end
