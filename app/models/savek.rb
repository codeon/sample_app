class Savek < ActiveRecord::Base

	default_scope { order(updated_at: :desc) }

	class << self
		def get_random_first_name
			['John', 'Johnny', 'Janardhan', 'Michael', 'Ramesh', 'Suresh', 'Vishesh'].sample
		end

		def get_random_last_name
			['Pinto', 'Garg', 'Gupta', 'Modi', 'Kejriwal', 'Gandhi'].sample
		end

		def get_occupation
			['Cook', 'Plumber', 'Maid', 'Washerman'].sample
		end

		def random_radius
			rand(20..50)/10.0
		end

		def get_random_latitude
			rand(1200..1350)/100.0
		end

		def get_random_longitude
			rand(7200..7350)/100.0
		end

		def random_average_rating
			rand(20..50)/10.0
		end

		def random_total_ratings
			rand(10..50)
		end

		def random_gender
			[:male, :female].sample
		end

		def random_phone
			rand(700000000..1000000000)
		end

		def random_address
			(0..50).map { ('a'..'z').to_a[rand(26)] }.join
		end

		def generate_random_savek
			s = Savek.create(
              first_name: Savek.get_random_first_name, 
              last_name: Savek.get_random_last_name, 
              occupation: Savek.get_occupation, 
              latitude: Savek.get_random_latitude, 
              longitude: Savek.get_random_longitude, 
              radius: Savek.random_radius, 
              avg_rating: Savek.random_average_rating, 
              ratings: Savek.random_total_ratings, 
              gender: Savek.random_gender,
              address: Savek.random_address, 
              phone: Savek.random_phone)
		end

	end

end
