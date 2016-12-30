require 'net/http'
require 'json'
require 'rubygems'
require 'soundcloud'

# create client object with app credentials
def get_data_from_soundcloud(genre)
@client = Soundcloud.new(:client_id => '1b710209af9f461e92b38e3492033252',
                        :client_secret => '2ce952ee1ddd2795cf273b4b73ffd911')

# redirect user to authorize URL
# redirect_to_client.authorize_url()

@genre_hash = {
  :altrock => "/altrock",
  :classical => "/classical",
  :country => "/country",
  :electronic => "/electronic",
  :foreign => "/foreign",
  :jazz => "/jazz",
  :pop => "/pop",
  :rap => "/rap",
  }
#choose genre: alternative/rock, classical, country, electronic, foreign, jazz, pop, rap/hip-hop
# def genre(genre_choice, url)
#   @genre_hash[genre_choice]
# end
# puts genre(@genre_hash, "")

#song is randomly selected from api
  track = @client.get('/tracks', :genre => @genre_hash[genre.to_sym]).sample
  track["uri"]
  request_string="https://api.soundcloud.com/tracks?genre=#{genre}&client_id=1b710209af9f461e92b38e3492033252"
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
  sample_parsedResponse.sample["uri"]
end
#song plays for 10 seconds

#when song is over, => reveal or next
#if reveal, show song name
#if next, go to next song
def next (track)
  #when user wants to go to next track, they click on next button
end