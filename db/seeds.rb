Artist.destroy_all
Genre.destroy_all
Song.destroy_all

# Add seed data here. Seed your database with `rake db:seed`
art1 = Artist.create(name: 'art1')
art2 = Artist.create(name: 'art2')
art3 = Artist.create(name: 'art3')

genre1 = Genre.create(name: 'genre1')
genre2 = Genre.create(name: 'genre2')
genre3 = Genre.create(name: 'genre3')

song1 = Song.new(name: 'song1')
song2 = Song.new(name: 'song2')
song3 = Song.new(name: 'song3')

song1.artist = art1
song2.artist = art2
song3.artist = art3

song1.genres << genre1
song2.genres << genre2
song3.genres << genre3

song1.save
song2.save
song3.save
