require('spec_helper')

describe(Hair_salon) do
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

  # pulls data from the database to the page.
  describe('#==') do
    it('lets you update stylists in the database') do
      stylist = Stylist.new(name: 'Dennis', id: nil)
      stylist.save
      movie.update(name: 'Dennis')
      expect(stylist.name).to(eq('Dennis'))
    end
  end
end
