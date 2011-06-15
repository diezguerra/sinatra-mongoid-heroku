require 'sinatra'
require 'sinatra/base'
require 'thin'
require 'mongoid'

Mongoid.load!("config/mongoid.yml")

# This model I copypasted from somewhere.
# It's just to check everything is fine.

# Models
class Counter
    include Mongoid::Document
  
    field :count, :type => Integer
  
    def self.increment
      c = first || new({:count => 0})
      c.inc(:count, 1)
      c.save
      c.count
    end
end

# Controllers
get '/' do
  "Hello visitor #{Counter.increment.to_s}"
end


