package rikkei.academy.service;

import rikkei.academy.model.Song;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ISongService {
    List<Song> getAllSongs();

    Song getSongById(int id);

    void addSong(Song song);

    void deleteSong(int id);

    void uploadSong(Song song, MultipartFile file);
}

