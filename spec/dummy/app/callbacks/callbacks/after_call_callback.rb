class Callbacks::AfterCallCallback < IICallback::Base
  after_call do
    @context.record.text = 'after_call'
  end

  def before_validation
  end
end
