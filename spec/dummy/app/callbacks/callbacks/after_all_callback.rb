class Callbacks::AfterAllCallback < IICallback::Base
  after_all do
    @context.record.text = 'after_all'
  end

  def before_validation
  end
end
