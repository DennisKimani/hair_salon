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

#find data through the database.
define_singleton_method(:find) do |id|
  result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
  name = result.first().fetch("name")
  Client.new({:name =>name, :id => id})
end

#save method.
define_method(:save) do
  result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
end
