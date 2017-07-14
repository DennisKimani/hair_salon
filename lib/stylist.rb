class Stylist
  attr_reader(:name, :id)

  # initialize method.
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  # fetches all the names of the stylist's available.
  define_singleton_method(:all) do
    returned_stylists = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end

  # finds all the data.
  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = result.first.fetch('name')
    Stylist.new(name: name, id: id)
  end

  # method which will save my data.
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  # method which compares two objects and if similiar will save as one.
  define_method(:==) do |another_stylist|
    name.==(another_stylist.name).&(id.==(another_stylist.id))
  end

  # method to update our objects.
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end
end
