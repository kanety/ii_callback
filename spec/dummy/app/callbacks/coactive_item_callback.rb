class CoactiveItemCallback < IICallback::Base
  coact Coactors::Item1Callback, Coactors::Item2Callback

  def before_validation
    @record.text2 = [@record.text2, 'Main'].compact.join(' ')
  end
end
