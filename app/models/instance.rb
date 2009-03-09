class Instance
  class << self

    def find_instances(ec2)
      raw_instances = ec2.describe_instances['reservationSet']
      raw_instances ? 
        raw_instances['item'].map { |i| i['instancesSet']['item'].first } :
        []
    end

  end

  include DataMapper::Resource

  property :id,     Serial
  attr_accessor :ami
  attr_accessor :size
end
