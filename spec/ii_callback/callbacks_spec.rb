describe IICallback::Callbacks do
  let :item do
    Item.new
  end

  context 'before_all' do
    let :callback do
      Callbacks::BeforeAllCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('before_all')
    end
  end

  context 'before_call' do
    let :callback do
      Callbacks::BeforeCallCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('before_call')
    end
  end

  context 'after_all' do
    let :callback do
      Callbacks::AfterAllCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('after_all')
    end
  end

  context 'after_call' do
    let :callback do
      Callbacks::AfterCallCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('after_call')
    end
  end

  context 'around_all' do
    let :callback do
      Callbacks::AroundAllCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('around_all')
    end
  end

  context 'around_call' do
    let :callback do
      Callbacks::AroundCallCallback
    end

    it 'calls callback' do
      callback.new(record: item, method: :before_validation).call_all
      expect(item.text).to eq('around_call')
    end
  end
end
