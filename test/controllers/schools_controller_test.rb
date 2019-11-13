require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { activity: @school.activity, address: @school.address, admintext: @school.admintext, admissionfee: @school.admissionfee, certificate: @school.certificate, classsize: @school.classsize, desc: @school.desc, examfee: @school.examfee, fb: @school.fb, hostbookingfee: @school.hostbookingfee, hostfeeperweek: @school.hostfeeperweek, insta: @school.insta, insurancefee: @school.insurancefee, latitude: @school.latitude, location: @school.location, longitude: @school.longitude, name: @school.name, nationalmix: @school.nationalmix, size: @school.size, status: @school.status, textbookfee: @school.textbookfee, towndistance: @school.towndistance, type: @school.type, web: @school.web, wiki: @school.wiki, youtube: @school.youtube } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { activity: @school.activity, address: @school.address, admintext: @school.admintext, admissionfee: @school.admissionfee, certificate: @school.certificate, classsize: @school.classsize, desc: @school.desc, examfee: @school.examfee, fb: @school.fb, hostbookingfee: @school.hostbookingfee, hostfeeperweek: @school.hostfeeperweek, insta: @school.insta, insurancefee: @school.insurancefee, latitude: @school.latitude, location: @school.location, longitude: @school.longitude, name: @school.name, nationalmix: @school.nationalmix, size: @school.size, status: @school.status, textbookfee: @school.textbookfee, towndistance: @school.towndistance, type: @school.type, web: @school.web, wiki: @school.wiki, youtube: @school.youtube } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
