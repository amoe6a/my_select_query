require 'json'

class MySelectQuery
    @csv_string = []
    def initialize(csv)
        @csv_string = csv
    end
    #name,year_start,year_end,position,height,weight,birth_date,college
    def where(column_name, criteria)
        lines = @csv_string.split("\n")
        init_words = lines[0].split(",")
        num_words = init_words.size
        num_lines = lines.size
        array_of_row_hash = []
        for i in 0...num_lines
            hash = Hash.new
            for j in 0...num_words
                row_i = lines[i].split(",")
                hash[init_words[j]] = row_i[j]
            end
            array_of_row_hash.push(hash)
        end
        for i in 0...num_words
            if init_words[i] == column_name
                column_index = i
            end
        end
        for i in 0...num_lines
            line = lines[i].split(",")
            if line[column_index] == criteria
                row_index = i
            end
        end
        ret = []
        for i in 0...num_words
            ret[i] = array_of_row_hash[row_index][init_words[i]]
        end
        #return JSON.generate(array_of_row_hash[row_index])
        arrr = [] #another way of returning the data
        arrr[0] = ret.join(",")
        return arrr
    end
end