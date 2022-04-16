describe IICallback::Base do
  let :callback do
    CoactiveItemCallback
  end

  let :item do
    Item.new
  end

  it 'lookups coactors' do
    expect(callback.new.coactors).to eq([Coactors::Item1Callback, Coactors::Item2Callback])
  end

  it 'calls coactors' do
    item.valid?
    expect(item.text2).to eq("Item1 Item2 Main")
  end
end
