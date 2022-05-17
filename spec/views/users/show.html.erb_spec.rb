require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user =
      assign(
        :user,
        User.create!(
          email: 'Email',
          password: 'Password',
          password_confirmation: 'Password Confirmation',
          admin: false,
          user_maneger: false
        )
      )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Password Confirmation/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
