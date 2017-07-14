class Client
  attr_reader(:name, :id)

#initialize method.
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id =attributes.fetch(:id)
  end

#loops fetching all the clients in the database.
define_singleton_method(:all) do
  returned_clients = DB.exec("SELECT * FROM clients;")
  clients = []
  returned_clients.each() do |client|
    name = client.fetch("name")
    id = client.fetch("id").to_i()
    clients.push(Client.new({:name => name, :id => id}))
end
clients
end
