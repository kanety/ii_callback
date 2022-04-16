class Callbacks::BeforeCallCallback < IICallback::Base
  before_call do
    @context.record.text = 'before_call'
  end

  def before_validation
  end
end
