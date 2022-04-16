describe IICallback::Base do
  before do
    @traversal = IICallback.config.traversal
  end

  after do
    IICallback.config.traversal = @traversal
  end

  let :callback_klass do
    CoactiveItemCallback
  end

  let :item do
    Item.new
  end

  context 'preorder' do
    before do
      IICallback.config.traversal = :preorder
    end

    it 'traverses preorder' do
      item.valid?
      expect(item.text2).to eq('Main Item1 Item2')
    end
  end

  context 'postorder' do
    before do
      IICallback.config.traversal = :postorder
    end

    it 'traverses postorder' do
      item.valid?
      expect(item.text2).to eq('Item1 Item2 Main')
    end
  end

  context 'inorder' do
    before do
      IICallback.config.traversal = :inorder
    end

    it 'traverses inorder' do
      item.valid?
      expect(item.text2).to eq('Item1 Main Item2')
    end
  end
end
