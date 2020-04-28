require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
  end

  test "micropost interface" do
    log_in_as(@user)
    get user_path(@user)
    #無効な送信
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "" }}
    end
    #有効な送信
    content = "samplesample"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content }}
    end
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_match content, response.body
    #投稿を削除する
    assert_select 'a', text:'削除する'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    #違うユーザーにアクセスし、deleteリンクがない
    get user_path(users(:archer))
    assert_select 'a', text: '削除する', count: 0
  end

  test "micropost index" do
    log_in_as(@user)
    get microposts_path
    assert_select 'li.micropostIndexList'
    assert_select 'div.micropostIndexList__profile'
    assert_select 'div.micropostIndexList__content'
    assert_select 'div.micropostIndexList__bottom'
  end
end
