require"spec_helper"

describe(Store) do
  it "validates presence of name" do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it "ensures the length of name is at most 20 characters" do
    store = Store.new({:name => 'a'.*(21)})
    expect(store.save()).to(eq(false))
  end

  describe("#capitalize_name") do
    it "capitalizes first letter of name" do
      store = Store.create({:name => "topanky"})
      expect(store.name()).to(eq("Topanky"))
    end
  end


end
