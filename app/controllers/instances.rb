require 'pp'

class Instances < Application

  before :load_instances

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
    @instance = Instance.new(instance)

    if @instance.save
      redirect resource(@instance), :message => {:notice => _("Instance was successfully created")}
    else
      render :new
    end
  end

  def update(id, instance)
    @instance = Instance.get(id)
    raise NotFound unless @instance
    if @instance.update_attributes(instance)
      redirect resource(@instance), :message => {:notice => _("Instance was successfully updated")}
    else
      display @instance, :edit
    end
  end

  def destroy(id)

  end

  private

  def load_instances
    @ec2 = Manager.new.instantiate
  end

end
