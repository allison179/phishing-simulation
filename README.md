# 🎣 Phishing Simulation & Security Training Portal
**Rossari Biotech Ltd. — IT Security Awareness Initiative**

> A controlled internal phishing simulation and security awareness training platform built to test and educate Rossari Biotech employees on identifying phishing threats.

---

## 📌 Overview

This project simulates a phishing attack on Rossari Biotech employees for educational purposes. When an employee clicks the phishing link, they are taken to a fake internal HR login portal. After entering their details, they are shown phishing awareness training content and must complete a 10-question security quiz. All activity is logged in real time to a Supabase database.

The project was built and deployed as part of a security awareness initiative, with written approval from management.

---

## 🔄 User Flow

```
Phishing Email → Fake HR Login Page → Employee enters Name + Email
      ↓
Supabase logs: link_clicks table (caught!)
      ↓
Phishing Awareness Training Content shown
      ↓
10-Question Security Quiz
      ↓
Results Page (Score + Answer Review)
      ↓
Supabase logs: quiz_results table
```

---

## 🏗️ Tech Stack

| Layer | Tool | Cost |
|---|---|---|
| Frontend | Plain HTML / CSS / JS | Free |
| Hosting | Vercel | Free |
| Database | Supabase (PostgreSQL) | Free |
| Analytics | Vercel Analytics | Free |
| Email Delivery | Zoho Campaigns (planned) | Existing license |

---

## 🗄️ Database Schema

### `link_clicks` — logs everyone who fell for the phishing email

| Column | Type | Description |
|---|---|---|
| id | int8 | Auto-generated primary key |
| timestamp | text | IST timestamp of when link was clicked |
| name | text | Name entered on fake login page |
| email | varchar | Work email entered on fake login page |

### `quiz_results` — logs quiz completions

| Column | Type | Description |
|---|---|---|
| id | int8 | Auto-generated primary key |
| timestamp | text | IST timestamp of submission |
| name | text | Employee name |
| email | varchar | Employee email |
| score | int2 | Number of correct answers (out of 10) |
| total | int2 | Total questions (always 10) |
| passed | text | "Yes" or "No" (pass threshold: 7/10) |

---

## 📊 What Gets Tracked

| Event | Where |
|---|---|
| Employee clicks phishing link + enters credentials | `link_clicks` table |
| Employee completes quiz | `quiz_results` table |
| Total unique visitors | Vercel Analytics dashboard |

---

## 🚀 Deployment

The site is deployed on Vercel as a single static `index.html` file.

**Live URL:** `https://phishing-simulation-nu.vercel.app`

To redeploy after changes:
1. Download the updated `index.html`
2. Go to Vercel dashboard → your project
3. Drag and drop `index.html` to deploy

---

## ⚙️ Configuration

Two variables at the top of the `<script>` block in `index.html`:

```js
var SUPABASE_URL = "https://abwehpdhmfcnopbpkpmh.supabase.co";
var SUPABASE_KEY = "your-anon-public-key-here";
```

To rotate the Supabase key: Supabase Dashboard → Project Settings → API → Regenerate anon key → update `index.html` and redeploy.

---

## 📧 Sending the Simulation Email

The phishing email is sent via **Zoho Campaigns** using a mail merge to personalise each email per employee.

**Recommended email subject:**
> `URGENT: Action Required — Claim Your Employee Appreciation Reward by EOD`

**Sender address:** A fake but plausible domain e.g. `hr-rewards@rossari-corp.in`

The email body contains a single CTA link pointing to the Vercel URL. No URL parameters are needed — identity is captured via the fake login form.

---

## 🔐 Compliance & Ethics

- ✅ Written management approval obtained before execution
- ✅ No real credentials collected — only name and work email
- ✅ Employees are immediately shown training content after "falling" for the simulation
- ✅ All data stored securely in Supabase, accessible only to IT team
- ✅ Compliant with Rossari Biotech Information Security Policy
- ✅ Conducted under IT Act 2000 guidelines for internal security testing
- ⚠️ Collected data (names + emails) should be deleted from Supabase after the exercise is concluded

---

## 📁 File Structure

```
/
├── index.html          # Entire application — login, training, quiz, results
└── README.md           # This file
```

---

## 🧠 Quiz Details

- **10 questions** covering: Phishing Awareness, Password Security, Social Engineering, Reporting & Safe Behaviour
- **Pass threshold:** 7 out of 10 (70%)
- After submission, employees see a full answer review with explanations

---

## 👤 Built By

Intern — IT Security Team, Rossari Biotech Ltd.
June 2026

---

*This project is for internal use only. Not for external distribution.*
