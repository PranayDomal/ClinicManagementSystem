# Clinic Management System (In Progress)

## Overview

The **Clinic Management System** is a web-based application designed to streamline clinical operations, including patient management, appointment scheduling, and doctor workflows.

This project is currently **under active development**.

---

## Tech Stack

* **Backend:** ASP.NET Core MVC
* **Database:** SQL Server
* **ORM:** Entity Framework Core
* **Architecture:** MVC + Repository Pattern
* **Authentication:** Role-Based Access Control (RBAC) using Sessions & Cookies

---

## Core Features

### 1. Unified Patient Queue (Token System)

* Daily sequential token generation
* Single shared queue for walk-in patients
* Doctors fetch the next available patient
* Concurrency-safe token handling

**Token Status Flow:**

```
Waiting → In Progress → Completed / Skipped
```

---

### 2. Appointment System

* Time-slot based scheduling
* Supports booking, rescheduling, and cancellation
* Prevents overlapping appointments for doctors

---

## User Roles & Functionalities

### Patient

* Register/Login
* Book, reschedule, cancel appointments
* View medical history and prescriptions
* Download reports (PDF, scans)

---

### Doctor

* View patients (queue + appointments)
* Access full patient history
* Manage:

  * Diagnosis
  * Prescriptions
  * Clinical notes (private & shareable)
* Set availability (time slots)
* Upload reports

---

### Staff

* Register patients
* Issue tokens for walk-ins
* Manage appointments
* Handle patient check-in/check-out
* Monitor and manage queue

---

### Admin

* Full system control
* Manage doctors, staff, and patients
* Configure:

  * Token limits
  * Appointment durations
  * Doctor roles
* Access system reports

---

## Database Design

The system uses a **normalized relational schema**.

### Core Tables

* Users
* Roles
* Patients
* Doctors
* Appointments
* Tokens (Queue)
* MedicalRecords
* Prescriptions
* Reports
* AuditLogs

---

## Concurrency Handling (Queue)

To prevent race conditions:

* Token selection uses transactional updates
* Ensures only one doctor can access a patient at a time

---

## File Handling

* Upload: Lab reports, scans
* Download: PDFs, images
* Storage strategy:

  * File system (recommended)
  * Database stores file paths

---

## Security

* RBAC enforced at controller level
* Patients access only their data
* Doctors access only assigned patients
* Staff restricted from private clinical notes

---

## Project Structure

```
Controllers/
Services/
Repositories/
Models/
ViewModels/
```

---

## Current Status

This project is **in progress**. Core modules are being actively developed and refined.

---

## Planned Enhancements

* Email/SMS notifications
* Prescription PDF generation
* Advanced search and filtering
* Reporting dashboard

---

## Setup Instructions

1. Clone the repository:

   ```
   git clone https://github.com/<your-username>/ClinicManagementSystem.git
   ```

2. Open the solution in Visual Studio

3. Configure database connection in:

   ```
   appsettings.json
   ```

4. Apply migrations:

   ```
   Update-Database
   ```

5. Run the application

---

## Contribution

This is currently a personal learning and development project. Contributions may be considered in future.

---

## License

This project is for educational purposes