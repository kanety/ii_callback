class ItemCallback < IICallback::Base
  def after_initialize
    @record.text = 'initialized'
  end
end
