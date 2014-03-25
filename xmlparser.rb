file_contents = File.read('sample.xml')

require 'happymapper'
class Book

  include HappyMapper
  element :author, String, :tag => 'author'
  element :title, String, :tag => 'title'
  element :genre, String, :tag => 'genre'
  element :price, String, :tag => 'price'
  element :publish_date, String, :tag => 'publish_date'
  element :description, String, :tag => 'description'
end


class Catalog
  include HappyMapper
  has_many :books, Book
  element :book, String, :tag => 'book'

end


books=Book.parse(file_contents)

books.each do |book|
  puts "Author Name : "    + book.author
  puts "Book Title  :"    + book.title
  puts "Genre       :"    + book.genre
  puts "Price       :"       "$"  + book.price
  puts "Publish date:"    + book.publish_date
  puts "Description :"    + book.description



end