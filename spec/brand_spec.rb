require"spec_helper"

describe(Brand) do
  it "validates presence of name" do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it "ensures the length of title is at most 20 characters" do
    brand = Brand.new({:name => 'a'.*(21)})
    expect(brand.save()).to(eq(false))
  end

  describe("#capitalize_name") do
    it "capitalizes first letter of name" do
      brand = Brand.create({:name => "topanky"})
      expect(brand.name()).to(eq("Topanky"))
    end
  end
end
