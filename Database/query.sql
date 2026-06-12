CREATE DATABASE ClinicDb;
USE ClinicDb;
CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY,
    RoleName NVARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Roles (RoleName)
VALUES ('Patient'), ('Doctor'), ('Staff'), ('Admin');

CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    RoleId INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),   

    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);

-- Patients (Profile)

CREATE TABLE Patients (
    PatientId INT PRIMARY KEY IDENTITY,
    UserId INT UNIQUE,

    Address NVARCHAR(200),
    City NVARCHAR(50),
    State NVARCHAR(50),

    DOB DATE,

    IdentificationType NVARCHAR(20), -- Aadhaar / PAN
    IdentificationNumber NVARCHAR(30),

    Phone NVARCHAR(20),
    Occupation NVARCHAR(100),

    MaritalStatus NVARCHAR(20),
    SpouseName NVARCHAR(100),

    EmergencyContact NVARCHAR(20),
    EmergencyRelation NVARCHAR(50),

    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Allergies Table

CREATE TABLE Allergies (
    AllergyId INT PRIMARY KEY IDENTITY,
    PatientId INT,

    AllergyName NVARCHAR(100) NOT NULL,
    Severity NVARCHAR(50),         -- Mild / Moderate / Severe
    StartedYear INT,

    SpecialMedication NVARCHAR(100), -- if any

    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);


-- Medications Table (Current/Running)

CREATE TABLE Medications (
    MedicationId INT PRIMARY KEY IDENTITY,
    PatientId INT,

    MedicationName NVARCHAR(100) NOT NULL,
    Dosage NVARCHAR(50),
    Duration NVARCHAR(50),
    Reason NVARCHAR(255),

    IsActive BIT DEFAULT 1,   -- current vs past

    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);

-- Conditions Table

CREATE TABLE Conditions (
    ConditionId INT PRIMARY KEY IDENTITY,
    PatientId INT,

    ConditionName NVARCHAR(100) NOT NULL,
    Status NVARCHAR(50), -- Active / Resolved

    DiagnosedDate DATE,
    Notes NVARCHAR(255),

    FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);
