module VersionsHelper
  def get_whodunnit(user_id)
  	user = User.find_by(id: user_id)
	user ? user.name : "削除済みユーザー ID：" + user_id
  end
end
