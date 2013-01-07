class Trad
	attr_accessor :id, :key, :value, :localized_values

	def to_json(*args)
		{ :key => @key, :value => @value }.to_json
	end
end