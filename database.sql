CREATE DATABASE helpdeskdb;

-- Run the table script inside helpdeskdb database

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,

    status VARCHAR(100),
    status_detail VARCHAR(100),
    cfm_form_number VARCHAR(100),
    ticket_number VARCHAR(100),
    ticket_date DATE,

    reporter_name VARCHAR(150),
    contact_number VARCHAR(50),
    email VARCHAR(150),
    time_reported TIME,

    site VARCHAR(200),
    room_location VARCHAR(200),

    issue TEXT,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    issue_type VARCHAR(100),
    brand_model VARCHAR(150),
    asset_tag VARCHAR(150),
    serial_number VARCHAR(150),
    root_cause TEXT,

    action_taken_1 TEXT,
    rrt_1 TIMESTAMP,
    irt_1 TIMESTAMP,
    ort_1 TIMESTAMP,
    prt_stop_1 TEXT,

    action_2_enabled BOOLEAN DEFAULT FALSE,
    action_taken_2 TEXT,
    ort_2 TIMESTAMP,
    prt_stop_2 TEXT,

    action_3_enabled BOOLEAN DEFAULT FALSE,
    action_taken_3 TEXT,
    ort_3 TIMESTAMP,
    prt_stop_3 TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    before_photo VARCHAR(255),
	after_photo VARCHAR(255),
	cm_form_file VARCHAR(255)
);