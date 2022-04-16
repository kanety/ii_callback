class Coactors::Item2Callback < IICallback::Base
  def before_validation
    @record.text2 = [@record.text2, 'Item2'].compact.join(' ')
  end
end
