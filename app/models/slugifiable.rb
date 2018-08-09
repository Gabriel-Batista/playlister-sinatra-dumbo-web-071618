module Slugifiable
    module InstanceMethods
        def slug
            string = self.name
            result = ""
            string.chars.each do |char|
                unless /[^a-zA-Z0-9\s]/.match(char)
                    result += char
                end
            end
            result.strip!
            result.gsub!(/\s+/, '-')
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find do |instance|
                slug == instance.slug
            end
        end
    end
end

#include Slugafiable::InstanceMethods
#extend Slugafiable::ClassMethods