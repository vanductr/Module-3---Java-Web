package rikkei.academy.model;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String address;
    private String imageUrl;

    public Customer(String name, String dateOfBirth, String address, String imageUrl) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.imageUrl = imageUrl;
    }

    // Getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}

