class ClickbaitValidator < ActiveModel::Validator
   def validate(record)
     word = ["Won't", "Believe", "Secret", "Top", "Guess"]
     if record.title != nil
       unless record.title.split.include?(word)
         record.errors[:title] << "Not clickbait-y"
       end
     end
   end

 end
