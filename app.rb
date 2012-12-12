require 'sinatra'
require 'haml'
require 'better_errors'

use BetterErrors::Middleware
BetterErrors.application_root = File.expand_path("..", __FILE__)


require File.dirname(__FILE__) + '/models/trad'

get '/' do
	haml :edit
end

get '/trads' do
	key = params[:k]
	language = params[:l]

	@trads = []
	file = File.new(ENV['HOME'] + '/code/iadvize/inc/languages/fr/chatclient.inc.php', 'r')
	while line = file.gets
		if key.nil? or key.empty?
			matches = /\$trad\['(.+)'\]\s*=\s*"(.+)";/.match line
		else
			matches = /\$trad\['(.*#{key}.*)'\]\s*=\s*"(.+)";/i.match line
		end

		if matches
			trad = Trad.new
			trad.key = matches[1]
			trad.value = matches[2]

			@trads << trad
		end
	end
	file.close

	content_type :json
	@trads.to_json
end
