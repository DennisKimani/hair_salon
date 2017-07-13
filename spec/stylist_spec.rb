require('spec_helper')

describe(Stylist) do
  # all the stylist available.
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end

  # finds all the stylists with the ID.
  describe('.find') do
    it('returns a stylist by its ID number') do
      test_stylist = Stylist.new(name: 'Dennis', id: nil)
      test_stylist.save
      test_stylist2 = Stylist.new(name: 'Lucy', id: nil)
      test_stylist2.save
      expect(Stylist.find(test_stylist2.id)).to(eq(test_stylist2))
    end
  end

  # object with same name and id are saved as one.
  describe('#==') do
    it('is the same stylist if it has the same name and id') do
      stylist = Stylist.new(name: 'Dennis', id: nil)
      stylist2 = Stylist.new(name: 'Dennis', id: nil)
      expect(stylist).to(eq(stylist2))
    end
  end

  # function to update the existing stylists.
  describe('#update') do
    it('lets you update stylist in the database') do
      stylist = Stylist.new(name: 'Lucy', id: nil)
      stylist.save
      stylist.update(name: 'John')
      expect(stylist.name).to(eq('John'))
    end
  end
end
