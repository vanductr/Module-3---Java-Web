package rikkei.academy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class MedicalDeclaration {
    private String fullName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;
    private String gender;
    private String nationality;
    private String identification;
    private String transportation;
    private String vehicleNumber;
    private String seatNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    private List<String> symptoms;
    private List<String> exposure;

    public MedicalDeclaration() {
    }

    public MedicalDeclaration(String fullName, Date dob, String gender, String nationality, String identification, String transportation, String vehicleNumber, String seatNumber, Date startDate, Date endDate, List<String> symptoms, List<String> exposure) {
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.nationality = nationality;
        this.identification = identification;
        this.transportation = transportation;
        this.vehicleNumber = vehicleNumber;
        this.seatNumber = seatNumber;
        this.startDate = startDate;
        this.endDate = endDate;
        this.symptoms = symptoms;
        this.exposure = exposure;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getTransportation() {
        return transportation;
    }

    public void setTransportation(String transportation) {
        this.transportation = transportation;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<String> getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(List<String> symptoms) {
        this.symptoms = symptoms;
    }

    public List<String> getExposure() {
        return exposure;
    }

    public void setExposure(List<String> exposure) {
        this.exposure = exposure;
    }

    // Method to check if the medical declaration is valid
    public boolean isValid() {
        // Check if required fields are filled
        if (fullName == null || dob == null || gender == null || nationality == null || identification == null
                || startDate == null || endDate == null) {
            return false;
        }
        return true;
    }
}


