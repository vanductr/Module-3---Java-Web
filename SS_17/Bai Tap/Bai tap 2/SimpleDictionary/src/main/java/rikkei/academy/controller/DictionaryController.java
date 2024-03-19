package rikkei.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DictionaryController {
    private static final Map<String, String> dictionary = new HashMap<>();

    static {
        dictionary.put("hello", "xin chào");
        dictionary.put("world", "thế giới");
        // Thêm các từ khác vào từ điển ở đây
    }
    @GetMapping("/search")
    public String searchWord(@RequestParam("word") String word, Model model) {
        String meaning = dictionary.get(word);
        if (meaning != null) {
            model.addAttribute("meaning", meaning);
        } else {
            model.addAttribute("meaning", "Không tìm thấy từ này trong từ điển");
        }
        return "dictionary";
    }
}
