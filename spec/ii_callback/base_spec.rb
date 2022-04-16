describe IICallback::Base do
  let :item do
    Item.new
  end

  context 'callback' do
    it 'calls callbacks' do
      expect(item.text).to include('initialized')
    end
  end

  context 'properties' do
    let :callback do
      ItemCallback.new(record: item, method: 'after_initialize')
    end

    it 'gets relation' do
      expect(callback.context.record).to be_a_kind_of(Item)
    end

    it 'gets criteria' do
      expect(callback.context.method).to eq('after_initialize')
    end
  end
end
