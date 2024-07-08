package book;

import java.util.List;

public class BookService {
	private BookDAO bookDao;
	public BookService(BookDAO bookDao) {
		this.bookDao = bookDao;
	}
	public boolean regist(Book book) {
		int result = bookDao.insertBook(book);
		return result == 1 ? true:false;
	}
	public boolean edit(Book book,String name, String author, int oldPrice) {
		int result = 0;
			result = bookDao.updateBook(book);
		
		return result ==1 ? true:false;
	}
	public boolean remove(int id) {
		if(bookDao.selectBook(id) == null)return false;
		
		int result = bookDao.deleteBook(id);
		return result ==1 ? true:false;
	}
	public List<Book> listAll() {
		return bookDao.selectBookAll();
	}
	public Book read(int id) {
		return bookDao.selectBook(id);
	}
	
}
