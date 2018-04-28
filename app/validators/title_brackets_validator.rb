class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    title = record.title
    @title_brackets = []
    title_brackets_content = ''
    title.each_char do |t|
      if opening_brackets.include?(t)
        @title_brackets << t 
        title_brackets_content = ''
      elsif closing_brackets.include?(t) &&
            t == expected_bracket 
        @title_brackets.pop
        if title_brackets_content.blank?
          record.errors.add(:base, "This record is invalid")
        end
      elsif closing_brackets.include?(t) &&
            t != expected_bracket
        record.errors.add(:base, "This record is invalid")
      else
        title_brackets_content += t
      end
    end
    if @title_brackets.any?
      record.errors.add(:base, "This record is invalid")
    end
  end
  
  def opening_brackets
    ['(', '{', '[']
  end

  def closing_brackets
    [')','}',']']
  end

  def expected_bracket
    case @title_brackets.last
    when '('
     ')'
    when '{'
     '}'
    when '['
     ']'
    end
  end
end
