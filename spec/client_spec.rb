require('spec_helper')

describe(Client) do
  # initialize method for the client.
  define_method(:initialize) do
    it('is initialized with a name') do
      client = Client.new(nmae: 'Lucy', id: nil)
      expect(client).to(be_an_instance_of(Client))
    end
    it('can be initialized with its database ID') do
      client = Client.new(name: 'Lucy', id: 1)
      expect(client).to(be_an_instance_of(Client))
    end
  end
end
