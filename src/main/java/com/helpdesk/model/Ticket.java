package com.helpdesk.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Ticket {

	public int ticketId;
	
    public String status;
    public String statusDetail;
    public String cfmFormNumber;
    public String ticketNumber;
    public Date ticketDate;

    public String reporterName;
    public String contactNumber;
    public String email;
    public Time timeReported;

    public String site;
    public String roomLocation;

    public String issue;
    public String category;
    public String subcategory;
    public String issueType;
    public String brandModel;
    public String assetTag;
    public String serialNumber;
    public String rootCause;

    public String actionTaken1;
    public Timestamp rrt1;
    public Timestamp irt1;
    public Timestamp ort1;
    public String prtStop1;

    public boolean action2Enabled;
    public String actionTaken2;
    public Timestamp ort2;
    public String prtStop2;

    public boolean action3Enabled;
    public String actionTaken3;
    public Timestamp ort3;
    public String prtStop3;
    
    public Timestamp createdAt;
    public Timestamp updatedAt;
    
    public String beforePhoto;
    public String afterPhoto;
    public String cmFormFile;
}