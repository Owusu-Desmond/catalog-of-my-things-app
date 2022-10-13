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

  def save_all_authors_to_file(authors)
    file_name = './data/authors.json'
    data = []

    authors.each do |author|
      data.push({ first_name: author['first_name'], last_name: author['last_name'] })
    end

    File.write(file_name, JSON.generate(data))
  end

  def load_all_authors
    file_name = './data/authors.json'
    data = []

    if File.exist?(file_name) && File.read(file_name) != ''
      file_data = JSON.parse(File.read(file_name))
      file_data.each do |author|
        author = Author.new(author['first_name'], author['last_name'])
        data.push({ 'first_name' => author.first_name, 'last_name' => author.last_name })
      end
    end
    data
  end
end
