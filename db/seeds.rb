InvoiceItem.delete_all
Invoice.delete_all
PrescriptionItem.delete_all
Prescription.delete_all
MedicalRecord.delete_all
Appointment.delete_all
Staff.delete_all
User.delete_all
Patient.delete_all
Doctor.delete_all
Service.delete_all

admin = User.create!(name: "Saerom Admin", email: "admin@saerom.local", password: "password123", password_confirmation: "password123", role: "admin", department: "Operations", phone: "+1234567890", status: "active")

User.create!(name: "Dr. Elena Brooks", email: "doctor@saerom.local", password: "password123", password_confirmation: "password123", role: "doctor", department: "Cardiology", phone: "+1234567891", status: "active")

Staff.create!(user: admin, name: admin.name, role: "Administrator", department: "Operations", email: admin.email, phone: admin.phone, status: "active")

Doctor.create!([
  { name: "Dr. Elena Brooks", specialty: "Cardiology", license_number: "CARD-2048", email: "elena.brooks@saerom.local", phone: "+15550182", availability: "Mon-Fri 9am-5pm", status: "available", photo_url: "" },
  { name: "Dr. Chris Nguyen", specialty: "Dermatology", license_number: "DERM-9171", email: "chris.nguyen@saerom.local", phone: "+15550183", availability: "Tue-Sat 10am-6pm", status: "available", photo_url: "" },
  { name: "Dr. Priya Shah", specialty: "Pediatrics", license_number: "PED-3329", email: "priya.shah@saerom.local", phone: "+15550184", availability: "Mon-Thu 8am-4pm", status: "available", photo_url: "" }
])

patients = Patient.create!([
  { patient_id: "PT-1001", first_name: "Aaliyah", last_name: "Khan", date_of_birth: Date.new(1992, 5, 12), gender: "female", phone: "+15551101", email: "aaliyah.khan@example.com", address: "14 Orchard Lane", emergency_contact: "Imran Khan +15551199", blood_type: "A+", allergies: "Peanuts", status: "active", registration_date: Date.current, archived: false },
  { patient_id: "PT-1002", first_name: "Marcus", last_name: "Lee", date_of_birth: Date.new(1987, 9, 21), gender: "male", phone: "+15551102", email: "marcus.lee@example.com", address: "22 Harbor View", emergency_contact: "Grace Lee +15551200", blood_type: "O-", allergies: "Penicillin", status: "active", registration_date: Date.current, archived: false },
  { patient_id: "PT-1003", first_name: "Sophia", last_name: "Martinez", date_of_birth: Date.new(2003, 1, 9), gender: "female", phone: "+15551103", email: "sophia.martinez@example.com", address: "18 Maple Street", emergency_contact: "Luis Martinez +15551201", blood_type: "B+", allergies: "None", status: "new", registration_date: Date.current, archived: false }
])

services = Service.create!([
  { name: "General Consultation", category: "Consultation", duration: "30 mins", price: 120.00, description: "Standard doctor consultation" },
  { name: "Cardiology Review", category: "Specialist", duration: "45 mins", price: 180.00, description: "Focused cardiovascular assessment" },
  { name: "Dermatology Checkup", category: "Specialist", duration: "40 mins", price: 150.00, description: "Professional skin and dermatology review" }
])

Appointment.create!([
  { patient: patients[0], doctor: Doctor.first, appointment_date: Date.current, start_time: "09:00", end_time: "09:30", appointment_type: "Consultation", reason_for_visit: "Follow-up blood pressure review", status: "scheduled", notes: "Continue current medication" },
  { patient: patients[1], doctor: Doctor.second, appointment_date: Date.current + 1.day, start_time: "11:00", end_time: "11:45", appointment_type: "Checkup", reason_for_visit: "Skin rash assessment", status: "confirmed", notes: "Routine evaluation" }
])

MedicalRecord.create!([
  { patient: patients[0], doctor: Doctor.first, visit_date: Date.current - 10.days, chief_complaint: "Elevated blood pressure", symptoms: "Headache and fatigue", diagnosis: "Stage 1 hypertension", treatment: "Lifestyle guidance and medication review", clinical_notes: "Patient remains compliant with treatment plan", follow_up_instructions: "Recheck in 2 weeks" },
  { patient: patients[1], doctor: Doctor.second, visit_date: Date.current - 7.days, chief_complaint: "Skin irritation", symptoms: "Redness and itching", diagnosis: "Allergic dermatitis", treatment: "Topical cream and antihistamine", clinical_notes: "Patient advised to avoid irritants", follow_up_instructions: "Return if symptoms worsen" }
])

Prescription.create!([
  { patient: patients[0], doctor: Doctor.first, prescribed_on: Date.current - 5.days, notes: "Continue daily use" },
  { patient: patients[1], doctor: Doctor.second, prescribed_on: Date.current - 3.days, notes: "Use as directed" }
])

PrescriptionItem.create!([
  { prescription: Prescription.first, medication: "Amlodipine", dosage: "5mg", frequency: "Once daily", duration: "30 days", instructions: "Take after breakfast" },
  { prescription: Prescription.second, medication: "Cetirizine", dosage: "10mg", frequency: "Once daily", duration: "14 days", instructions: "Take at night" }
])

Invoice.create!([
  { patient: patients[0], invoice_date: Date.current, amount: 180.00, payment_status: "pending", notes: "Cardiology review and follow-up" },
  { patient: patients[1], invoice_date: Date.current - 2.days, amount: 150.00, payment_status: "paid", notes: "Dermatology checkup" }
])

InvoiceItem.create!([
  { invoice: Invoice.first, service: services[1], description: "Cardiology Review", quantity: 1, unit_price: 180.00 },
  { invoice: Invoice.second, service: services[2], description: "Dermatology Checkup", quantity: 1, unit_price: 150.00 }
])

puts "Seeded SAEROM clinic demo data successfully."
