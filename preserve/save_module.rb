require 'json'

module SaveDataModule
  def preserve_items(items_list, _file)
    saved_data = []
    if items_list == @books
      items_list.each do |book|
        saved_data.push({ id: book['id'], publish_date: book['publish_date'], publisher: book['publisher'],
                          cover_state: book['cover_state'] })
      end
    else
      items_list.each do |label|
        saved_data.push({ title: label['title'], color: label['color'] })
      end
    end
    if items_list == @books
      File.write('./data/books.json',
                 JSON.generate(saved_data))
    else
      File.write('./data/labels.json',
                 JSON.generate(saved_data))
    end
  end

  def load_items(file)
    item_list = []
    curr_data = if File.exist?("./data/#{file}.json")
                  JSON.parse(File.read("./data/#{file}.json"))
                else
                  item_list
                end
    if file == 'books'
      curr_data.each do |book|
        new_book = Book.new(book['publisher'], book['publish_date'], book['cover_state'], book['id'])
        item_list.push({ 'id' => new_book.id, 'publish_date' => new_book.publish_date,
                         'publisher' => new_book.publisher, 'cover_state' => new_book.cover_state })
      end
    else
      curr_data.each do |label|
        new_label = Label.new(label['title'], label['color'])
        item_list.push({ 'title' => new_label.title, 'color' => new_label.color })
      end
    end
    item_list
  end
end
