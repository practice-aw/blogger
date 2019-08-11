require "rails_helper"

describe "user edits article" do
  describe "they link from the show page" do
    describe "they fill in edit form and submit" do
      it "displays change to article" do
        article = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article)
        click_link "Edit"

        fill_in "article[title]", with: "Diff Title"
        fill_in "article[body]", with: "Edited Body"
        click_on  "Update Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("Diff Title")
        expect(page).to_not have_content("Title 1")
        expect(page).to have_content("Edited Body")
        expect(page).to_not have_content("Body 1")
      end
    end
  end
end
