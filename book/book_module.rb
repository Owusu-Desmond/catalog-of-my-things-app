module BookModule
  def get_input(txt)
    print "#{txt}: "
    gets.chomp
  end

  def add_book
    publisher = get_input('Add book publisher')
    publish_date = get_input('Add book publish_date [dd/mm//yyyy]')
    cover_state = get_input('Cover_state [good/bad]')
    curr_book = Book.new(publisher, publish_date, cover_state)
    save_book(curr_book)
    gets
  end

  def add_label
    title = get_input('Enter label title!')
    color = get_input('Enter label color')
    curr_label = Label.new(title, color)
    save_label(curr_label)
    gets
  end

  def save_book(book)
    @books << { 'id' => book.id, 'publish_date' => book.publish_date, 'publisher' => book.publisher,
                'cover_state' => book.cover_state }
    puts 'Book has been created successfully'
  end

  def save_label(label)
    @labels << { 'title' => label.title, 'color' => label.color }
    puts 'Label has been added successfully'
  end

  def list_all_books
    puts "There are no books\n" if @books.empty?
    @books.each do |book|
      puts "ID: [#{book['id']}] / [Publish date]: #{book['publish_date']}
        - [Publisher] #{book['publisher']} / [cover state]: #{book['cover_state']}"
    end
    gets
  end

  def list_all_labels
    puts 'There are no labels' if @labels.empty?
    @labels.each do |label|
      puts "[Label title]: #{label['title']} -[Label color]: #{label['color']}"
    end
    gets
  end
end
