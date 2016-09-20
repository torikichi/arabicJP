require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "単語 <%=%> 検索結果 | アラビア語検索ナビ MilaaHa"
  end

  test "shoud get wordsRoots" do
    get :wordsRoots
    assert_response :success
    assert_select "title", "語根 <%=%> 検索結果 | アラビア語検索ナビ MilaaHa"
  end

  # CSV出力のテスト方法が不明 ※実際にDLできてれば不要？
  # test "shoud get lesson_in_words" do
  #   get :lesson_in_words
  #   assert_response :success
  # end

end
