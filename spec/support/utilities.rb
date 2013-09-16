include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

def valid_signup
	fill_in "Name",				with: "Example User"
	fill_in "Email",			with: "user@example.com"
	fill_in "Password",			with: "foobar"
	fill_in "Confirm Password", with: "foobar"
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :reflect_logged_in_status do |user|
	match do |page|
		expect(page).to have_title(user.name)
	  	expect(page).to have_link('Profile',	href: user_path(user))
		expect(page).to have_link('Settings',	href: edit_user_path(user))
		expect(page).to have_link('Sign out',	href: signout_path)
    	expect(page).to have_link('Users', href: users_path)
	end
end

RSpec::Matchers.define :reflect_logged_out_status do
	match do |page|
		expect(page).not_to have_title(user.name)
	  	expect(page).not_to have_link('Profile',	href: user_path(user))
		expect(page).not_to have_link('Settings',	href: edit_user_path(user))
		expect(page).not_to have_link('Sign out',	href: signout_path)
    	expect(page).not_to have_link('Users', href: users_path)
    end
end
