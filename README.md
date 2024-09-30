# Team 1 MIST 4610 Group Project 1
Team Name: Group 1

Group Members:
1. Connor Hatfield [@connorhat4](url)
2. Jordan Peterkin [@jpeterkin29](url)
3. Michael Espinoza [@Michael8272](url)
4. Naysa Rokkala [@naysarokk](url)

# Problem Description:
&emsp; The task at hand is to model and build a relational database for the general workings of a healthcare system. The central entity in the model is the Hospital entity of the healthcare network—each hospital represents a physical facility in various locations that the healthcare system owns and operates. Each hospital manages departments, doctors, patients, appointments, prescriptions, and medications. We are interested in accurately modeling these relationships, generating sample data, and populating the entities and their attributes with this sample data. Additionally, we need to ensure that the model can support day-to-day operations such as scheduling patient appointments with doctors, assigning prescriptions, and managing medication inventories. Furthermore, we are interested in performing functional queries on this data to provide valuable business and operational insights, such as identifying the most active doctors, tracking patient demographics, monitoring department sizes, and analyzing hospital capacity and medication distribution.
# Data Model:
Explanation of data model:

&emsp; Our data model represents the overall process of a patient receiving a prescription from the hospital. Hospital is the first entity in the journey throughout this model, information such as its name, address, phone number, and the type of hospital that it is are all displayed. A hospital can have many patients, but a patient can only get an appointment with one hospital at a time (thus creating a one-to-many relationship between the hospital and the patient). The Patient entity has basic identifying information that is similar to Hospital (name, address, and phone), but it also includes an email and categorical information such as sex, race, and age. The patient will need to meet with a certain type of doctor for their specific needs, this creates the need for the hospital to be divided into multiple departments. A one-to-many relationship is created between Hospital and Department since a hospital can have multiple departments, but a department can only belong to one hospital.

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

Query 1:
This query lists all the doctors in the database.

<img width="1023" alt="Screenshot 2024-09-29 at 5 51 49 PM" src="https://github.com/user-attachments/assets/437b3e62-6855-40b2-b7d7-9c74243181ff">

Explanation: This query retrieves a complete list of all doctors in the database. For managers, having visibility into the entire roster of doctors helps in resource allocation, understanding staff availability, and planning schedules effectively. It can also assist in ensuring that the right mix of specialties is represented.


Query 2:
This query lists all patients from a specific hospital

<img width="694" alt="Screenshot 2024-09-29 at 6 16 50 PM" src="https://github.com/user-attachments/assets/14dfa86a-e1ab-4988-8ca2-634f0203e318">


Explanation: This query provides the names and addresses of patients affiliated with a particular hospital. Managers can use this information for targeted outreach, follow-up care, or patient satisfaction surveys. It can also aid in understanding patient demographics and improving community engagement.


Query 3:
Ths query retrieves all medications and their prices.

<img width="705" alt="Screenshot 2024-09-29 at 6 10 40 PM" src="https://github.com/user-attachments/assets/7330334f-f642-42da-9826-86914cebe95e">

Explanation: This query lists all medications along with their prices. Managers can use this information to assess the hospital's inventory costs and identify potential areas for cost savings. Understanding medication pricing is crucial for budgeting and ensuring that patients receive affordable care options.


Query 4:
This query counts the number of appointments for each doctor.

<img width="596" alt="Screenshot 2024-09-29 at 5 57 23 PM" src="https://github.com/user-attachments/assets/eafeef5d-8736-4ced-8738-5e2ea3234473">

Explanation: This query counts the number of appointments associated with each doctor. For managers, this data can help in evaluating workload distribution among doctors. Understanding which doctors have the most appointments can inform staffing decisions and assist in balancing patient loads to prevent burnout.


Query 5:
This query finds doctors and their corresponding hospitals, ordered by hospital name.

<img width="951" alt="Screenshot 2024-09-29 at 6 27 40 PM" src="https://github.com/user-attachments/assets/967a4990-a44e-4f8c-9fea-f19465e06ae0">

Explanation: This query pairs doctors with their respective hospitals. For managers, knowing which doctors work at which hospitals facilitates better communication and coordination of care. It can also aid in managing referrals and ensuring that patients are directed to the appropriate specialists.


Query 6:
This query gets the average salary of doctors by their years of experience, filtering those with an avergge salary over 200,000.


<img width="950" alt="Screenshot 2024-09-29 at 6 28 39 PM" src="https://github.com/user-attachments/assets/7b34a8f7-2053-4819-b4f4-8dc22dcdeb06">

Explanation: This query calculates the average salary of doctors based on their years of experience. Managers can utilize this information to ensure competitive salary offerings, which is critical for recruiting and retaining talent in a competitive healthcare market. It also helps in budget planning.


Query 7:
This query lists patients and their doctors for a specific appointment date.

<img width="663" alt="Screenshot 2024-09-29 at 6 06 36 PM" src="https://github.com/user-attachments/assets/4d225364-1b04-443a-b0ec-90c31e6bcaf7">

Explanation: This query displays the patients and their corresponding doctors for a specified appointment date. Managers can use this information to analyze appointment trends, identify peak times, and optimize scheduling practices. It also assists in ensuring that staffing levels match patient demand.


Query 8:
This query gets the total number of appointments per hospital, filtering those with more than 1 appointment.


<img width="952" alt="Screenshot 2024-09-29 at 6 26 46 PM" src="https://github.com/user-attachments/assets/5a584912-28d8-47ef-bed8-6e7053ec6c58">


Explanation: This query totals the number of appointments at each hospital. For managers, this data is vital for assessing hospital performance, identifying trends in patient visits, and informing resource allocation decisions. It helps ensure that facilities are adequately staffed to meet patient needs.


Query 9:
This query finds patients who have appointments with doctors earning above a certain salary.

<img width="967" alt="Screenshot 2024-09-29 at 6 25 25 PM" src="https://github.com/user-attachments/assets/ea617e5d-1dc2-4c19-bdc0-0864351b838a">


Explanation: This query identifies patients who have appointments with doctors earning above a specified salary. For managers, understanding the relationship between high-salary doctors and their patients can help in evaluating service quality and patient outcomes. It can also inform salary negotiation discussions and promote equitable pay practices.
Query 10:


This query gets a list of patients who have appointments with a specific doctor.

<img width="694" alt="Screenshot 2024-09-29 at 6 16 23 PM" src="https://github.com/user-attachments/assets/53acea72-167d-421f-b9a8-88917f0049a8">


Explanation: This query retrieves patients scheduled with a specific doctor. For managers, this information is useful for monitoring the patient load of individual doctors, ensuring that patient needs are met, and planning for follow-up care. It can also help identify patterns in patient visits that could inform scheduling adjustments.



# Database information:
| Feature               | Query 1 | Query 2 | Query 3 | Query 4 | Query 5 | Query 6 | Query 7 | Query 8 | Query 9 | Query 10 |
|-----------------------|---------|---------|---------|---------|---------|---------|---------|---------|---------|----------|
| Simple SELECT         |    x    |    x    |    x    |         |         |         |         |         |         |          |
| Multiple Table Join    |         |         |         |         |    x    |         |    x    |    x    |    x    |    x     |
| Subquery              |         |         |         |         |         |         |         |         |    x    |          |
| Group By              |         |         |         |    x    |         |    x    |         |    x    |         |          |
| Having Clause         |         |         |         |         |         |    x    |         |    x    |         |          |
| Aggregation (COUNT)   |         |         |         |    x    |         |         |         |    x    |         |          |
| Aggregation (AVG)     |         |         |         |         |         |    x    |         |         |         |          |
| Filtering (WHERE)     |         |    x    |         |         |         |         |    x    |         |    x    |    x     |
| Ordering (ORDER BY)   |         |         |         |         |    x    |         |         |         |         |          |


