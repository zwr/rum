module RequestMacros
  def login_superadmin
    before(:each) do
      @user ||= FactoryGirl.create :superadmin
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end
  end
end
