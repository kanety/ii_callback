class Callbacks::AroundCallCallback < IICallback::Base
  around_call do |instance, block|
    @context.record.text = 'around_call'
    block.call
  end

  def before_validation
  end
end
