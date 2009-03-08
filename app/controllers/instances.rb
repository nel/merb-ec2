require 'pp'

class Instances < Application

  before :load_config

  def index
    @instances = Instance.find_instances(@ec2)
    display @instances
  end

  def show(id)
    @instance = Instance.get(id)
  end

  def new
    only_provides :html
    @instance = Instance.new
    display @instance
  end

  def edit(id)
    only_provides :html
    @instance = Instance.get(id)
    raise NotFound unless @instance
    display @instance
  end

  def create(instance)
    @instance = instance
    @ec2.run_instances :image_id => instance[:ami]
    redirect resource(:instances), :message => {:notice => "Instance was successfully created"}
  
  rescue EC2::Error
    render :new
  end

  def update(id, instance)
    @instance = Instance.get(id)
    raise NotFound unless @instance
    if @instance.update_attributes(instance)
      redirect resource(@instance), :message => {:notice => "Instance was successfully updated"}
    else
      display @instance, :edit
    end
  end

  def destroy(id)
	  @ec2.terminate_instances :instance_id => id
	rescue EC2::Error
		redirect resource(:instances), :message => {:notice => _("Instance was successfully destroyed")}
  end

  private

  def load_config
    @ec2 = Manager.new.instantiate
  end

end
