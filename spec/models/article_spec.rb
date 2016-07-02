require 'spec_helper'

describe Article do

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(20)}
  end


  describe "Associations" do

    it { should have_many(:comments) }
  end
  
  describe "#subject" do
    it "returns the article title" do
      #Создааем объект артикл хитрым способом
      article = create(:article, title: 'Lorem ipsum')

      #assert
      expect(article.subject).to eq('Lorem ipsum')
    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      article = create(:article_with_comments)


      #assert
      expect(article.last_comment.body).to eq "comment body 3"
    end
  end

end