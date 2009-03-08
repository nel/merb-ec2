class Manager
  class << self
    def config
      @@config ||= YAML.load(File.open(File.join(Merb.root,'config','amazon.yml')))[Merb.env]
    end
  end
    
  def instanciate
    ::EC2::Base.new(  :access_key_id => self.class.config['access_key_id'],
                      :secret_access_key => self.class.config['secret_access_key'])
  end
end