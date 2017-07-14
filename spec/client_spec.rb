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

  # displays all of the clients name.
  describe('.all') do
    it('starts off with no movies') do
      expect(Client.all).to(eq([]))
    end
  end

  # finds the client through the id.
  describe('.find') do
    it('returns a client by its ID number') do
      test_client = Client.new(name: 'John', id: nil)
      test_client.save
      test_client2 = Client.new(name: 'Wanja', id: nil)
      test_client2.save
      expect(Client.find(test_client2.id)).to(eq(test_client2))
    end
  end
end
