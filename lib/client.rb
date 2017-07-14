class Client
  attr_reader(:name, :id)

#initialize method.
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id =attributes.fetch(:id)
  end
