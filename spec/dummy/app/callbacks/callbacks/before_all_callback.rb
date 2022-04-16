class Callbacks::BeforeAllCallback < IICallback::Base
  before_all do
    @context.record.text = 'before_all'
  end

  def before_validation
  end
end
