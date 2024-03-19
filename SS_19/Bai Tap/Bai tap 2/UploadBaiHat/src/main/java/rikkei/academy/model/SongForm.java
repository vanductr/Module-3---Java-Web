package rikkei.academy.model;

import org.springframework.web.multipart.MultipartFile;

public class SongForm {
    private int id;
    private String title;
    private String artist;
    private String genre;
    private MultipartFile file;

    // Constructors, getters, and setters
    public SongForm() {
    }

    public SongForm(int id, String title, String artist, String genre, MultipartFile file) {
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.genre = genre;
        this.file = file;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}


