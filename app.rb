require 'sinatra'
require 'haml'

require File.dirname(__FILE__) + '/models/trad'


get '/' do

    @trads = []
    file = File.new(ENV['HOME'] + '/code/iadvize/inc/languages/fr/admin.inc.php', 'r')
    while line = file.gets
        matches = /\$trad\['(.+)'\]\s*=\s*"(.+)";/.match line

        if matches
            trad = Trad.new
            trad.key = matches[1]
            trad.value = matches[2]
            @trads << trad
        end
    end
    file.close

    haml :show
end