package rikkei.academy.service;

import rikkei.academy.model.Song;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
public class SongService implements ISongService {
    private List<Song> songs = new ArrayList<>();
    private int nextId = 1;

    @Override
    public List<Song> getAllSongs() {
        return songs;
    }

    @Override
    public Song getSongById(int id) {
        for (Song song : songs) {
            if (song.getId() == id) {
                return song;
            }
        }
        return null;
    }

    @Override
    public void addSong(Song song) {
        song.setId(nextId++);
        songs.add(song);
    }

    @Override
    public void deleteSong(int id) {
        songs.removeIf(song -> song.getId() == id);
    }

    @Override
    public void uploadSong(Song song, MultipartFile file) {
        // Perform file upload logic here
        // For simplicity, we'll just set the file path of the song
        // Ideally, you would save the file to a storage system (e.g., file system, database)
        song.setFilePath("/uploads/" + file.getOriginalFilename());
        addSong(song);
    }
}

