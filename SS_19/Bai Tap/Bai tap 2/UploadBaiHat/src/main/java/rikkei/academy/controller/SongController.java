package rikkei.academy.controller;

import rikkei.academy.model.Song;
import rikkei.academy.model.SongForm;
import rikkei.academy.service.ISongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import rikkei.academy.service.SongService;

//import javax.validation.Valid;
import java.util.List;

@Controller
public class SongController {

    private final ISongService songService = new SongService();

    @GetMapping(value = {"/","/songs"})
    public String getAllSongs(Model model) {
        List<Song> songs = songService.getAllSongs();
        model.addAttribute("songs", songs);
        return "/songList";
    }

    @GetMapping("/upload")
    public String showUploadForm(Model model) {
        model.addAttribute("songForm", new SongForm());
        return "/uploadForm";
    }

    @PostMapping("/songs-upload")
    public String handleFileUpload(@ModelAttribute("songForm") SongForm songForm,
                                   BindingResult bindingResult,
                                   RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "uploadForm";
        }

        MultipartFile file = songForm.getFile();
        if (file.isEmpty()) {
            bindingResult.rejectValue("file", "file.empty", "Please select a file to upload.");
            return "uploadForm";
        }

        String fileName = file.getOriginalFilename();
        if (!fileName.endsWith(".mp3") && !fileName.endsWith(".wav") && !fileName.endsWith(".ogg") && !fileName.endsWith(".m4p")) {
            bindingResult.rejectValue("file", "file.invalid", "Invalid file format. Only .mp3, .wav, .ogg, and .m4p files are allowed.");
            return "uploadForm";
        }

        Song song = new Song();
        song.setTitle(songForm.getTitle());
        song.setArtist(songForm.getArtist());
        song.setGenre(songForm.getGenre());

        songService.uploadSong(song, file);

        redirectAttributes.addFlashAttribute("successMessage", "Song uploaded successfully.");
        return "redirect:/songs";
    }
}

