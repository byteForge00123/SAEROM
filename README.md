# SAEROM

![Ruby](https://img.shields.io/badge/Ruby-3.2-CC342D?style=flat-square&logo=ruby)
![Rails](https://img.shields.io/badge/Rails-7.2-CC0000?style=flat-square&logo=rubyonrails)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?style=flat-square&logo=postgresql)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-3.4-38B2AC?style=flat-square&logo=tailwind-css)
![Turbo](https://img.shields.io/badge/Turbo-8-00AEEF?style=flat-square&logo=turbo)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

SAEROM is a modern clinic management system built with Ruby on Rails. It is designed to streamline operations for healthcare facilities, including patient management, appointments, medical records, prescriptions, billing, and reporting.

## Overview

This application provides a complete administrative dashboard for clinic workflows with a clean interface and structured data model.

### Core features

- Patient records management
- Doctor and staff profiles
- Appointment scheduling and tracking
- Medical record handling
- Prescription management
- Billing and invoice tracking
- Reports and dashboard overview
- Authentication and session-based access control
- Responsive admin dashboard UI

## Tech stack

- Ruby 3.2
- Rails 7.2
- PostgreSQL 16
- Tailwind CSS
- Turbo / Hotwire
- Importmap
- Puma
- ActiveRecord and MVC architecture

## Project structure

```text
saerom/
├── app/
│   ├── controllers/
│   ├── models/
│   ├── views/
│   ├── assets/
│   └── javascript/
├── config/
├── db/
├── public/
├── test/
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
└── bin/
```

## Local setup

### Requirements

- Ruby 3.2.x
- PostgreSQL 16
- Bundler
- Git

### 1) Install dependencies

```bash
bundle install
```

### 2) Configure PostgreSQL

Make sure PostgreSQL is installed and running locally.

For Windows PowerShell, use:

```powershell
$pgData = 'C:\Program Files\PostgreSQL\16\data'
$pgCtl = 'C:\Program Files\PostgreSQL\16\bin\pg_ctl.exe'
& $pgCtl -D $pgData start
```

### 3) Prepare the database

```bash
bin/rails db:prepare
```

### 4) Start the app

```bash
bin/rails server -b 127.0.0.1 -p 3000
```

Then open:

```text
http://127.0.0.1:3000
```

## Common issue and solution

### Problem: localhost refused to connect / ERR_CONNECTION_REFUSED

This usually happens when one of the following is not ready:

- Ruby is not using the correct version
- PostgreSQL is not running
- A stale Rails/Puma process is still bound to the port
- The path environment is using the wrong Ruby installation

### Recommended Windows fix

Use the Ruby 3.2 environment and clear stale server state:

```powershell
cd "C:\Users\Desktop\saerom"
$env:Path += ';C:\Ruby32-x64\bin;C:\Ruby32-x64\msys64\usr\bin'
Get-Process ruby,puma -ErrorAction SilentlyContinue | Stop-Process -Force
Remove-Item .\tmp\pids\server.pid -ErrorAction SilentlyContinue

$pgData = 'C:\Program Files\PostgreSQL\16\data'
$pgCtl = 'C:\Program Files\PostgreSQL\16\bin\pg_ctl.exe'
& $pgCtl -D $pgData start

bin/rails server -b 127.0.0.1 -p 3000
```

### If the app still fails to open

Check the following:

1. Confirm Ruby version:

```powershell
ruby -v
```

2. Confirm PostgreSQL is running:

```powershell
pg_ctl -D "C:\Program Files\PostgreSQL\16\data" status
```

3. Confirm the app boots successfully:

```powershell
bundle exec rails runner "puts 'Rails boot ok'"
```

## Development notes

This project uses the standard Rails MVC pattern and includes a dashboard-centric admin experience for clinic operations.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request with a clear summary of the improvement.

## License

This project is licensed under the MIT License.

## Repository

- GitHub: https://github.com/byteForge00123/SAEROM
