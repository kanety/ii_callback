class Callbacks::AroundAllCallback < IICallback::Base
  around_all do |instance, block|
    @context.record.text = 'around_all'
    block.call
  end

  def before_validation
  end
end
