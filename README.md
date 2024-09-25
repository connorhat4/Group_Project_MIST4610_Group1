[patient_data_dictionary.csv](https://github.com/user-attachments/files/17138507/patient_data_dictionary.csv)# Team 1 MIST 4610 Group Project 1
Team Name: Group 1

Group Members:
1. Connor Hatfield [@connorhat4](url)
2. Jordan Peterkin
3. Michael Espinoza [@Michael8272](url)
4. Naysa Rokkala

# Problem Description:
&emsp; The task at hand is to model and build a relational database for the general workings of a healthcare system. The central entity in the model is the Hospital entity of the healthcare network—each hospital represents a physical facility in various locations that the healthcare system owns and operates. Each hospital manages departments, doctors, patients, appointments, prescriptions, and medications. We are interested in accurately modeling these relationships, generating sample data, and populating the entities and their attributes with this sample data. Additionally, we need to ensure that the model can support day-to-day operations such as scheduling patient appointments with doctors, assigning prescriptions, and managing medication inventories. Furthermore, we are interested in performing functional queries on this data to provide valuable business and operational insights, such as identifying the most active doctors, tracking patient demographics, monitoring department sizes, and analyzing hospital capacity and medication distribution.
# Data Model:
Explanation of data model:

&emsp; Our data model represents the overall process of a patient receiving a prescription from the hospital. Hospital is the first entity in the journey throughout the mode, information such as its name, address, phone number, and the type of hospital that it is are all displayed. A hospital can have many patients, but a patient can only get an appointment with one hospital at a time (thus creating a one-to-many relationship between the hospital and the patient). The Patient entity has basic identifying information that is similar to Hospital (name, address, and phone), but it also includes an email and categorical information such as sex, race, and age. The patient will need to meet with a certain type of doctor for their specific needs, this creates the need for the hospital to be divided into multiple departments. A one-to-many relationship is created between Hospital and Department since a hospital can have multiple departments, but a department can only belong to one hospital.

&emsp; Each department includes its name, phone number, the size of the department, the floor that it is on, and the department head. To have a department head (or department head doctor), the Doctor entity must be created along with a one-to-one relationship between the two entities. This relationship allows for a doctor from the Doctor entity to appear as the department head in the Department entity. Each doctor has a name, phone number, and email so patients can come into contact with them easily. The salary of the doctors and their years of experience are also displayed in the entity (some patients may prefer a doctor with more experience). An additional one-to-many relationship is created to represent the fact that a department can have multiple doctors within it, but a doctor can only belong to a single department.

&emsp; For an appointment to be made, a connection must be made between a patient and a specified doctor. The Appointment entity is created through an identifying many-to-many relationship. A doctor could meet with multiple patients and a patient could meet with multiple doctors, therefore, this special type of relationship between the two entities results in a unique appointment that can be identified by the ID of the two. To make the appointment even more unique, the date of the appointment and the reason for the appointment are added to the Appointment entity.
The result of an appointment is one or more prescriptions, because of this, a new Prescription entity must be created along with a one-to-many relationship to connect the two entities. A prescription is comprised of the IDs of the patient and doctor (which are taken from their respective entity through the appointment entity), the date of the prescription, and the ID of the prescribed medication. The ID of the medication is taken from the Medication entity (which has a one-to-many relationship with the prescription entity). This relationship comes from the fact that a certain type of medication can be found in multiple prescriptions, but a prescription should only contain one type of medication. If an appointment results in the patient needing more than one type of medication, the doctor will write up a prescription for each additional one. The Medication entity includes the name, price, and recommended dosage of the medication.

![Group Project 1 Data Model](https://github.com/user-attachments/assets/2ec911d4-8f71-4211-9a9d-45213b59512e)


# Data Dictionary:
<img width="821" alt="Screenshot 2024-09-25 at 5 21 16 PM" src="https://github.com/user-attachments/assets/42a20e99-d167-4ad2-a97c-d2bc90dd2bba">
<img width="869" alt="Screenshot 2024-09-25 at 5 22 49 PM" src="https://github.com/user-attachments/assets/7e843163-c362-4461-a979-ad9d2846821e">
<img width="1023" alt="Screenshot 2024-09-25 at 5 26 37 PM" src="https://github.com/user-attachments/assets/142f7e73-36d2-4fea-be79-b8c9cad54544">
<img width="1013" alt="Screenshot 2024-09-25 at 5 27 36 PM" src="https://github.com/user-attachments/assets/a6dfe814-9592-48e0-b97c-cba7744a61b5">
<img width="1036" alt="Screenshot 2024-09-25 at 5 30 18 PM" src="https://github.com/user-attachments/assets/50edd5b8-b86f-4d63-9d8a-5870631490af">
<img width="1118" alt="Screenshot 2024-09-25 at 5 31 23 PM" src="https://github.com/user-attachments/assets/f6207a08-ee65-45f8-9610-3d0d76503b46">
<img width="788" alt="Screenshot 2024-09-25 at 5 38 29 PM" src="https://github.com/user-attachments/assets/12fd853e-701d-4b56-b668-e86ee8f66d93">





# Queries:

# Database information:
