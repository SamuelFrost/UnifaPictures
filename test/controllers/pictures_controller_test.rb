require "test_helper"

class PicturesControllerTest < ActionDispatch::IntegrationTest
  # Parameters: {"authenticity_token"=>"[FILTERED]", "picture"=>{"title"=>"test", "picture_file"=>#<ActionDispatch::Http::UploadedFile:0x00007f8fe40cb338 @tempfile=#<Tempfile:/tmp/RackMultipart20210301-9175-l1vf0b.jpg>, @original_filename="107093554_1621105124706915_1317788289060331532_o.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"picture[picture_file]\"; filename=\"107093554_1621105124706915_1317788289060331532_o.jpg\"\r\nContent-Type: image/jpeg\r\n">}, "commit"=>"アップロード"}
  include SignInHelper
  setup do
    sign_in_as_test
    @picture = pictures(:one)
    test_image = "test/fixtures/files/Test.ico"
    @file = Rack::Test::UploadedFile.new(test_image, "image/jpeg")
  end

  # test "should get index" do
  #   get pictures_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_picture_url
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post pictures_url, params: { picture: { title: @picture.title, picture_file: @file } }
    end

    assert_redirected_to picture_url(Picture.last)
  end

  # test "should show picture" do
  #   get picture_url(@picture)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_picture_url(@picture)
  #   assert_response :success
  # end

  test "should update picture" do
    patch picture_url(@picture), params: { picture: { title: @picture.title, picture_file: @file } }
    assert_redirected_to picture_url(@picture)
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete picture_url(@picture)
    end

    assert_redirected_to pictures_url
  end
end
