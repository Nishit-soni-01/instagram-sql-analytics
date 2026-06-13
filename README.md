# Instagram SQL Clone: Relational Database Architecture & Analytics

![Instagram SQL Clone Banner](assets/banner_placeholder.png) 

## 📌 Executive Summary
A fully normalized relational database mirroring Instagram's core architecture. This project demonstrates backend schema design, data integrity enforcement, and the execution of complex, business-driven analytical queries. By translating raw data into actionable metrics, this repository highlights the foundational data engineering required to feed recommendation algorithms and user engagement models.

## 🏗️ Entity-Relationship (ER) Architecture
The database is structured to handle critical social media operations, utilizing composite primary keys and foreign key constraints to ensure strict referential integrity.

![Database ER Diagram](assets/instagram_clone_erd.png)

**Core Tables:**
* `users`: Core profile directory.
* `photos`: Content repository.
* `comments` & `likes`: User engagement mapping.
* `follows`: Network and algorithmic feed foundation.
* `tags` & `photo_tags`: Content categorization and trending topic mapping.

<details>
<summary><b>📂 Click to view Schema Creation & Data Insertion Proofs</b></summary>
<br>

<img width="897" height="242" alt="Screenshot 2026-06-13 121117" src="https://github.com/user-attachments/assets/83e69b4e-a592-4f0b-901a-c0dd1c6051a5" />

<img width="815" height="240" alt="Screenshot 2026-06-13 121122" src="https://github.com/user-attachments/assets/9c7b1c60-0be5-4dd9-8400-d2748b0620e8" />

<img width="780" height="277" alt="Screenshot 2026-06-13 121129" src="https://github.com/user-attachments/assets/c1e97e03-a0d2-4060-b85f-2671aa8fe0c6" />

<img width="777" height="257" alt="Screenshot 2026-06-13 121136" src="https://github.com/user-attachments/assets/61ee0c65-1d14-4ce7-ac2f-29497c1cfefb" />

<img width="803" height="247" alt="Screenshot 2026-06-13 121142" src="https://github.com/user-attachments/assets/25f0d658-55ee-4563-ab83-8caa5ac8667b" />

<img width="843" height="412" alt="Screenshot 2026-06-13 121149" src="https://github.com/user-attachments/assets/fa4b607a-e3ed-4cfd-aa8d-90110daa5dab" />

<img width="1908" height="865" alt="Screenshot 2026-06-13 121100" src="https://github.com/user-attachments/assets/10c02d8f-2f8d-4a47-9eb2-6d36fd28ed81" />
</details>

---

## 📊 Analytical Challenges & Business Solutions
Rather than executing basic CRUD operations, the queries in this repository are framed around solving real-world corporate challenges. 

### 1. Bot Detection & Data Integrity
* **The Business Problem:** Fake accounts skew engagement metrics and negatively impact recommendation engines.
* **The Algorithmic Approach:** Engineered an automated query utilizing nested subqueries and `HAVING` clauses to flag accounts with a 100% like-rate (users who have liked every single photo on the platform).
* **Impact:** Ensures clean, reliable data extraction for user engagement and machine learning models.

**Query Execution & Results:**
<br>
<img width="947" height="683" alt="Screenshot 2026-06-13 122233" src="https://github.com/user-attachments/assets/9d8b7b9d-e26e-40b5-adce-d6ecb73440e4" />

### 2. User Engagement & Retention
* **The Business Problem:** Identifying drop-off points and optimizing marketing budgets.
* **The Algorithmic Approach:** Utilized `LEFT JOINS` (anti-joins) to isolate "ghost users" who registered but never posted, providing a clean cohort for targeted email re-engagement campaigns. Aggregated registration timestamps using `DAYNAME()` to identify peak weekly traffic. 
* **Impact:** Provides actionable metrics to marketing and growth teams to improve overall platform retention rates.

**Query Execution & Results:**
<br>
<img width="658" height="397" alt="Screenshot 2026-06-13 121826" src="https://github.com/user-attachments/assets/9a42acc1-987b-4dc0-ae37-851c1279802a" />
<br>
<img width="916" height="485" alt="Screenshot 2026-06-13 121917" src="https://github.com/user-attachments/assets/0508b39a-38f5-44db-9535-9f9a90468405" />
<br>
<img width="967" height="712" alt="Screenshot 2026-06-13 121956" src="https://github.com/user-attachments/assets/4dd289aa-d0f8-489f-a90f-05a7fd0d66b9" />
<br>
<img width="866" height="542" alt="Screenshot 2026-06-13 122036" src="https://github.com/user-attachments/assets/e500da24-63d9-4d07-aae2-a0f630ca1676" />
<br>
<img width="753" height="313" alt="Screenshot 2026-06-13 122108" src="https://github.com/user-attachments/assets/381943f7-cfcd-442c-92b0-cfa24466f052" />

### 3. Algorithmic Content Tagging
* **The Business Problem:** Ad-targeting and feed generation rely on surfacing trending topics.
* **The Algorithmic Approach:** Executed multi-table `JOINS` and aggregations to calculate hashtag frequency, surfacing the top 5 most utilized tags across the network.
* **Impact:** Simulates the data extraction process required to build dynamic, real-time trending feeds.

**Query Execution & Results:**
<br>
<img width="792" height="502" alt="Screenshot 2026-06-13 122148" src="https://github.com/user-attachments/assets/f85726e4-77c8-413f-8407-adfeb358c523" />

---

## 🗂️ Repository Structure

```text
├── README.md
├── schema_design/
│   ├── 1_create_tables.sql
│   └── 2_insert_mock_data.sql
├── analytical_queries/
│   ├── user_engagement.sql
│   ├── bot_detection.sql
│   └── hashtag_trends.sql
└── assets/
    ├── banner_placeholder.png
    └── instagram_clone_erd.png
