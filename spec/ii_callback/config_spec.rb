describe IICallback::Config do
  context 'configure' do
    before do
      IICallback.configure do |config|
        config.traversal = :inorder
      end
    end

    after do
      IICallback.configure do |config|
        config.traversal = :postorder
      end
    end

    it 'gets and sets' do
      expect(IICallback.config.traversal).to eq(:inorder)
    end
  end
end
