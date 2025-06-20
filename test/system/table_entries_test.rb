require "application_system_test_case"

class TableEntriesTest < ApplicationSystemTestCase
  setup do
    @table_entry = table_entries(:one)
  end

  test "visiting the index" do
    visit table_entries_url
    assert_selector "h1", text: "Table entries"
  end

  test "should create table entry" do
    visit table_entries_url
    click_on "New table entry"

    fill_in "Row number", with: @table_entry.row_number
    fill_in "Value", with: @table_entry.value
    click_on "Create Table entry"

    assert_text "Table entry was successfully created"
    click_on "Back"
  end

  test "should update Table entry" do
    visit table_entry_url(@table_entry)
    click_on "Edit this table entry", match: :first

    fill_in "Row number", with: @table_entry.row_number
    fill_in "Value", with: @table_entry.value
    click_on "Update Table entry"

    assert_text "Table entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Table entry" do
    visit table_entry_url(@table_entry)
    click_on "Destroy this table entry", match: :first

    assert_text "Table entry was successfully destroyed"
  end
end
