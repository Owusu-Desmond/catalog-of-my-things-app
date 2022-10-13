module AuthorModule
  def add_author(author)
    @authors.push({ 'first_name' => author.first_name, 'last_name' => author.last_name })
  end

  def list_authors
    puts "There is no author in the list\n" if @authors.empty?
    @authors.each_with_index do |author, index|
      puts "#{index}) First Name: #{author['first_name']} Last Name: #{author['last_name']}"
    end
  end
end
