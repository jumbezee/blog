require 'spec_helper'

describe Article do

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
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
end