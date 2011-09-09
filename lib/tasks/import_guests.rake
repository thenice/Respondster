namespace :import do
  task :guests_from_file => :environment do
    require 'CSV'
    import_file = File.new('guestlist.csv')
    arr = CSV.parse(import_file)
    arr[1..9999].each do |g|
      g = Guest.new(:guest_name => g[1], :partner_name => g[2], :zipcode => g[3], :number_of_guests => g[4], :name_on_envelope => g[0])
      g.save :validate => false
    end
  end
end