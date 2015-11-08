module ControllerMacros
  def login_superadmin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:superadmin)
      sign_in :user, admin
    end
  end
end
