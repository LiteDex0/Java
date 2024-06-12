package com.example.BookShare.controllers;

import com.example.BookShare.models.Book;
import com.example.BookShare.services.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BookController {
    private final BookService bookService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("book", bookService.listBooks(title));
        model.addAttribute("user", bookService.getUserByPrincipal(principal));
        return "book";
    }

    @GetMapping("/book/{id}")
    public String productInfo(@PathVariable Long id, Model model,Principal principal) {
        Book book = bookService.getBookById(id);
        model.addAttribute("user", bookService.getUserByPrincipal(principal));
        model.addAttribute("book", book);
        model.addAttribute("images", book.getImages());
        return "book-info";
    }

    @PostMapping("/book/create")
    public String createBook(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Book book, Principal principal) throws IOException {
        bookService.saveBook(principal,book, file1, file2, file3);
        return "redirect:/";
    }

    @PostMapping("/book/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        bookService.deleteBook(id);
        return "redirect:/";
    }
}
