class Instances < Application

  before :load_instances

  def index
    raw_instances = @ec2.describe_instances
    @instances = raw_instances['reservationSet']['item']
    display @instances
  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def load_instances
    @ec2 = Manager.new.instantiate
  end

end
