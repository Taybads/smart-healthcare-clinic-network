# Smart Healthcare Clinic Network Database

A MySQL database project for a healthcare network operating across multiple cities. It models clinic branches, doctors, patients, appointments, prescriptions, medicines, billing, and medicine inventory, with example SQL queries and role-based access controls.

## Project Overview

The database is designed to organize common clinic operations and support basic operational reporting. The included SQL script creates the database and tables, inserts fictional sample records, runs example queries, and demonstrates database roles and permissions.

## Database Schema

The project includes these tables:

- **Patient** — patient names, gender, and contact numbers.
- **Clinic** — clinic names, cities, and branch names.
- **Doctor** — doctor details, specialties, working hours, and assigned clinic.
- **Appointment** — visit date, type, status, duration, patient, and doctor.
- **Prescription** — prescription notes linked to appointments.
- **Medicine** — medicine descriptions, prices, and stock status.
- **Billing** — billing dates, totals, discounts, and related appointments.
- **Prescription_Details** — junction table connecting prescriptions and medicines, including dosage.
- **Clinic_Inventory** — junction table connecting clinics and medicines, including each clinic's stock quantity.

### Relationships at a glance

- One patient can have many appointments.
- One doctor can have many appointments.
- One clinic can have many doctors.
- Appointments can be linked to prescriptions and billing records.
- Prescriptions and medicines have a many-to-many relationship through `Prescription_Details`.
- Clinics and medicines have a many-to-many relationship through `Clinic_Inventory`.

## Example SQL Queries

The script demonstrates queries for:

1. Finding patients with more than two appointments during the previous month.
2. Listing doctors and specialties for a selected city.
3. Retrieving a doctor's prescriptions within a date range.
4. Finding clinic inventory items below a stock threshold.
5. Listing appointments longer than 30 minutes with patient and doctor details.
6. Calculating revenue totals by clinic and city.

The results depend on the sample dates and the current date when the queries are executed.

## Security Demonstration

The SQL script demonstrates MySQL roles and permissions for two example groups:

- **Medical staff** — access to patient, doctor, appointment, and prescription tables.
- **Billing staff** — access to billing and medicine tables.

This is a learning/demo example, not a production-ready security configuration. Before using it outside a local environment, review database privileges, configure strong credentials, and implement appropriate protection for sensitive data. The script does not itself implement full application authentication or comprehensive encryption.

## Requirements

- MySQL 8.0 or a compatible MySQL version that supports roles.
- A MySQL client such as MySQL Workbench, or a local development stack that includes MySQL.

## How to Run

1. Download or clone this repository.
2. Open `smartHealthcareClinicNetwork_Project.sql` in MySQL Workbench or another MySQL client.
3. Connect to a local/test MySQL server.
4. Execute the script.
5. Refresh the Schemas panel and open the `smartHealthcareClinicNetwork` database to inspect the tables.
6. Run the example `SELECT` queries individually to explore the results.

**Important:** The script creates a database, inserts sample records, and includes user/role statements. Run it only in a development or test environment, and review the account and privilege statements before execution. If your MySQL account lacks permission to create users or roles, the security section may need to be run separately by an administrator.

## Repository Contents

```text
smart-healthcare-clinic-network/
├── README.md
└── smartHealthcareClinicNetwork_Project.sql
```

## Notes and Limitations

- All included patient, doctor, clinic, and billing records are fictional examples.
- The script is intended to demonstrate relational database design and SQL querying.
- Some example queries use fixed dates or a specific city/doctor; update those values to explore other cases.
- The schema and permissions may need further validation and hardening before any real-world use.

## License

No license has been specified. Add a license file if you want to define how others may use, modify, or distribute this project.
