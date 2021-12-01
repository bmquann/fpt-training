/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

/**
 *
 * @author manhq
 */
public class Trainer {
    private int maGV;
	private String tenGV;
	private String diaChi;
	private int sdt;
	private String email;

    public Trainer() {
    }

    public Trainer(int maGV, String tenGV, String diaChi, int sdt, String email) {
        this.maGV = maGV;
        this.tenGV = tenGV;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
    }

    public Trainer(String tenGV, String diaChi, int sdt, String email) {
        this.tenGV = tenGV;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
    }

    public int getMaGV() {
        return maGV;
    }

    public void setMaGV(int maGV) {
        this.maGV = maGV;
    }

    public String getTenGV() {
        return tenGV;
    }

    public void setTenGV(String tenGV) {
        this.tenGV = tenGV;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public int getSdt() {
        return sdt;
    }

    public void setSdt(int sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
        
}
