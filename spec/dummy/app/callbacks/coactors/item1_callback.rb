class Coactors::Item1Callback < IICallback::Base
  def before_validation
    @record.text2 = [@record.text2, 'Item1'].compact.join(' ')
  end
end
