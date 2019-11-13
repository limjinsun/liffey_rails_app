require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "creating a School" do
    visit schools_url
    click_on "New School"

    fill_in "Activity", with: @school.activity
    fill_in "Address", with: @school.address
    fill_in "Admintext", with: @school.admintext
    fill_in "Admissionfee", with: @school.admissionfee
    fill_in "Certificate", with: @school.certificate
    fill_in "Classsize", with: @school.classsize
    fill_in "Desc", with: @school.desc
    fill_in "Examfee", with: @school.examfee
    fill_in "Fb", with: @school.fb
    fill_in "Hostbookingfee", with: @school.hostbookingfee
    fill_in "Hostfeeperweek", with: @school.hostfeeperweek
    fill_in "Insta", with: @school.insta
    fill_in "Insurancefee", with: @school.insurancefee
    fill_in "Latitude", with: @school.latitude
    fill_in "Location", with: @school.location
    fill_in "Longitude", with: @school.longitude
    fill_in "Name", with: @school.name
    fill_in "Nationalmix", with: @school.nationalmix
    fill_in "Size", with: @school.size
    fill_in "Status", with: @school.status
    fill_in "Textbookfee", with: @school.textbookfee
    fill_in "Towndistance", with: @school.towndistance
    fill_in "Type", with: @school.type
    fill_in "Web", with: @school.web
    fill_in "Wiki", with: @school.wiki
    fill_in "Youtube", with: @school.youtube
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "updating a School" do
    visit schools_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @school.activity
    fill_in "Address", with: @school.address
    fill_in "Admintext", with: @school.admintext
    fill_in "Admissionfee", with: @school.admissionfee
    fill_in "Certificate", with: @school.certificate
    fill_in "Classsize", with: @school.classsize
    fill_in "Desc", with: @school.desc
    fill_in "Examfee", with: @school.examfee
    fill_in "Fb", with: @school.fb
    fill_in "Hostbookingfee", with: @school.hostbookingfee
    fill_in "Hostfeeperweek", with: @school.hostfeeperweek
    fill_in "Insta", with: @school.insta
    fill_in "Insurancefee", with: @school.insurancefee
    fill_in "Latitude", with: @school.latitude
    fill_in "Location", with: @school.location
    fill_in "Longitude", with: @school.longitude
    fill_in "Name", with: @school.name
    fill_in "Nationalmix", with: @school.nationalmix
    fill_in "Size", with: @school.size
    fill_in "Status", with: @school.status
    fill_in "Textbookfee", with: @school.textbookfee
    fill_in "Towndistance", with: @school.towndistance
    fill_in "Type", with: @school.type
    fill_in "Web", with: @school.web
    fill_in "Wiki", with: @school.wiki
    fill_in "Youtube", with: @school.youtube
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "destroying a School" do
    visit schools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "School was successfully destroyed"
  end
end
