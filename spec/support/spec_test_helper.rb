module SpecTestHelper
  def login(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user_id] = user.id
  end
  
  def current_user
    User.find(request.session[:user_id])
  end
  
  def create_session 
    user = FactoryGirl.build :user, { name: "Hunter Barron", email: "h90@barron.com", password: "foobar" }
    user.save
    login user
  end
  
  def create_copier
    copier = FactoryGirl.build :copier
    copier.save
  end
end