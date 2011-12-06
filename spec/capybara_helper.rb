def log_in(name)
  visit("/")
  fill_in 'user_email', :with => "#{name}@doitlater.com"
  fill_in 'user_password', :with => "1234567"
  click_button 'Sign in'
end

def fill_and_submit_form(form, data)
  button = "commit"
  within(form) do
    data.keys.each do |key|
      fill_in(key, :with => data[key])
    end
    page.find("input.btn").click
  end      
end