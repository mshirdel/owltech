require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source = sources(:one)
  end

  test "should get index" do
    get sources_url
    assert_response :success
  end

  test "should get new" do
    get new_source_url
    assert_response :success
  end

  test "should create source" do
    assert_difference('Source.count') do
      post sources_url, params: { source: { home_entry_css: @source.home_entry_css, home_page_url: @source.home_page_url, img_css: @source.img_css, intro_text_css: @source.intro_text_css, name: @source.name, title_css: @source.title_css } }
    end

    assert_redirected_to source_url(Source.last)
  end

  test "should show source" do
    get source_url(@source)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_url(@source)
    assert_response :success
  end

  test "should update source" do
    patch source_url(@source), params: { source: { home_entry_css: @source.home_entry_css, home_page_url: @source.home_page_url, img_css: @source.img_css, intro_text_css: @source.intro_text_css, name: @source.name, title_css: @source.title_css } }
    assert_redirected_to source_url(@source)
  end

  test "should destroy source" do
    assert_difference('Source.count', -1) do
      delete source_url(@source)
    end

    assert_redirected_to sources_url
  end
end
