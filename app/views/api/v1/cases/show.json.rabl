child(@case => 'case') do
  attribute :id, :name, :body
  child(:lawyer) do
    attributes :id, :name, :title, :specialty, :age
  end
end