require('spec_helper')

describe(Client) do

  # save function.
  describe('#save') do
    it('adds a client to the array of saved clients') do
      test_client = Client.new(name: 'Lucy', stylist_id: 1)
      test_client.save
      expect(Client.all).==([test_client])
    end
  end

  # displays the name of client.
  describe('#name') do
    it('lets you read the names out') do
      test_client = Client.new(name: 'Lucy', stylist_id: 1)
      expect(test_client.name).to(eq('Lucy'))
    end
  end

  # calls the stylist id.
  describe('#stylist_id') do
    it('lets you read the stylist ID out') do
      test_client = Client.new(name: 'Hannah', stylist_id: 1)
      expect(test_client.stylist_id).to(eq(1))
    end
  end

  # compares the info for both the info  entered and that stored.
  describe('#==') do
    it('is the same client if it has the same name and stylist ID') do
      client = Client.new(name: 'Vivian', stylist_id: 1)
      client2 = Client.new(name: 'Vivian', stylist_id: 1)
      expect(client).to(eq(client2))
    end
  end
end
