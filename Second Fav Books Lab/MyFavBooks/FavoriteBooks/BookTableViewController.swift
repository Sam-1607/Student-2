import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell
        cell?.update(with: books[indexPath.row])
        
        
        return cell ?? UITableViewCell()
    }

    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source = segue.source as? BooksFormTableViewController,
            let book = source.book else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            books.insert(book, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            books.append(book)
        }
    }
    
//    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BooksFormTableViewController? {
//
//        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
//            return nil
//        }
//
//        let book = books[indexPath.row]
//
//        return BooksFormTableViewController(coder: coder, book: book)
//    }
   
    
    
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BooksFormTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let book = books[indexPath.row]
        
        return BooksFormTableViewController(coder: coder, book: book)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
            
        }
    }
    
    
    
    
}
