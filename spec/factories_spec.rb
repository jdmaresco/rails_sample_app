require 'factory_girl'

FactoryGirl.define do
	factory :user do
		name	"JD Maresco"
		email	"jd@mares.co"
		password				"mamamia"
		password_confirmation 	"mamamia"
	end
end