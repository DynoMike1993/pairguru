require "rails_helper"

describe Comment do
  describe 'Validations' do
    before do
      @comment = Comment.new(
        user: User.create(email: 'd@example.com'),
        movie: Movie.create(genre: Genre.create)
      )
    end
    it "is valid with content" do
      @comment.content = 'Test content'
      expect(@comment).to be_valid
    end
    it "is invalid without content" do
      @comment.content = nil
      expect(@comment).to_not be_valid
    end
  end
end