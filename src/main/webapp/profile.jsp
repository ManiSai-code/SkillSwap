<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>

  *, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #0a0e1a;
    font-family: 'DM Sans', sans-serif;
    overflow-x: hidden;
    padding: 40px 16px;
  }

  body::before, body::after {
    content: '';
    position: fixed;
    border-radius: 50%;
    filter: blur(90px);
    opacity: 0.22;
    animation: drift 9s ease-in-out infinite alternate;
    z-index: 0;
  }
  body::before {
    width: 550px; height: 550px;
    background: radial-gradient(circle, #0ea5e9, #6366f1);
    top: -120px; left: -120px;
  }
  body::after {
    width: 450px; height: 450px;
    background: radial-gradient(circle, #7c3aed, #4f46e5);
    bottom: -100px; right: -100px;
    animation-delay: -4.5s;
  }

  @keyframes drift {
    from { transform: translate(0, 0) scale(1); }
    to   { transform: translate(35px, 25px) scale(1.07); }
  }

  .container {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 520px;
    animation: fadeUp 0.6s cubic-bezier(0.22, 1, 0.36, 1) both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(28px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Welcome header above card */
  .welcome-header {
    text-align: center;
    margin-bottom: 28px;
  }

  .avatar {
    width: 64px; height: 64px;
    background: linear-gradient(135deg, #6366f1, #0ea5e9);
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-size: 26px;
    margin: 0 auto 16px;
    box-shadow: 0 8px 28px rgba(99, 102, 241, 0.45);
  }

  h1 {
    font-family: 'Playfair Display', serif;
    font-size: 2rem;
    color: #f1f5f9;
    letter-spacing: -0.4px;
    margin-bottom: 4px;
  }

  .welcome-sub {
    font-size: 0.875rem;
    color: #64748b;
    font-weight: 300;
  }

  /* Profile card */
  .profile-info {
    background: rgba(255, 255, 255, 0.04);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(24px);
    border: 1px solid rgba(255, 255, 255, 0.09);
    border-radius: 24px;
    padding: 40px 40px 36px;
    box-shadow:
      0 0 0 1px rgba(255,255,255,0.04),
      0 32px 64px rgba(0,0,0,0.5),
      inset 0 1px 0 rgba(255,255,255,0.07);
  }

  .section-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.2rem;
    color: #e2e8f0;
    margin-bottom: 28px;
    padding-bottom: 16px;
    border-bottom: 1px solid rgba(255,255,255,0.07);
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .section-title span {
    font-size: 16px;
  }

  /* Two-column grid for selects */
  .form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 0 20px;
  }

  .form-group {
    margin-bottom: 20px;
    animation: fadeUp 0.6s cubic-bezier(0.22, 1, 0.36, 1) both;
  }
  .form-group.full { grid-column: 1 / -1; }
  .form-group:nth-child(1) { animation-delay: 0.08s; }
  .form-group:nth-child(2) { animation-delay: 0.14s; }
  .form-group:nth-child(3) { animation-delay: 0.20s; }
  .form-group:nth-child(4) { animation-delay: 0.26s; }
  .form-group:nth-child(5) { animation-delay: 0.32s; }

  label {
    display: block;
    font-size: 0.76rem;
    font-weight: 500;
    color: #94a3b8;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 8px;
  }

  input[type="text"] {
    width: 100%;
    padding: 13px 16px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 12px;
    color: #e2e8f0;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.93rem;
    outline: none;
    transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
  }

  input[type="text"]::placeholder {
    color: #2d3a4e;
  }

  input[type="text"]:focus {
    border-color: rgba(99, 102, 241, 0.6);
    background: rgba(99, 102, 241, 0.07);
    box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15);
  }

  select {
    width: 100%;
    padding: 13px 16px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 12px;
    color: #e2e8f0;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.93rem;
    outline: none;
    cursor: pointer;
    appearance: none;
    -webkit-appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%2364748b' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    transition: border-color 0.2s, background-color 0.2s, box-shadow 0.2s;
  }

  select:focus {
    border-color: rgba(99, 102, 241, 0.6);
    background-color: rgba(99, 102, 241, 0.07);
    box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15);
  }

  select option {
    background: #1e2535;
    color: #e2e8f0;
  }

  /* Skill badges row hint */
  .hint {
    font-size: 0.74rem;
    color: #475569;
    margin-top: 6px;
  }

  .divider {
    height: 1px;
    background: rgba(255,255,255,0.06);
    margin: 8px 0 24px;
  }

  button[type="submit"] {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
    color: #fff;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.95rem;
    font-weight: 500;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    letter-spacing: 0.3px;
    transition: transform 0.15s ease, box-shadow 0.15s ease, opacity 0.15s;
    box-shadow: 0 4px 20px rgba(99, 102, 241, 0.4);
    animation: fadeUp 0.6s 0.38s cubic-bezier(0.22, 1, 0.36, 1) both;
  }

  button[type="submit"]:hover {
    transform: translateY(-1px);
    box-shadow: 0 8px 28px rgba(99, 102, 241, 0.55);
  }

  button[type="submit"]:active {
    transform: translateY(1px);
    opacity: 0.9;
  }

  @media (max-width: 480px) {
    .profile-info { padding: 28px 24px; }
    .form-grid { grid-template-columns: 1fr; }
    .form-group.full { grid-column: 1; }
    h1 { font-size: 1.6rem; }
  }
</style>
</head>

<body>
<script>

function addTeachSkill() {

    var container = document.getElementById("teachSkillContainer");

    var input = document.createElement("input");
    input.type = "text";
    input.name = "teachSkill";
    input.placeholder = "Enter skill";

    input.style.marginTop = "8px";

    container.appendChild(input);
}

function addLearnSkill() {

    var container = document.getElementById("learnSkillContainer");

    var input = document.createElement("input");
    input.type = "text";
    input.name = "learnSkill";
    input.placeholder = "Enter skill";

    input.style.marginTop = "8px";

    container.appendChild(input);
}

</script>
<div class="container">

  <div class="welcome-header">
    <div class="avatar">👤</div>
    <h1>Welcome, ${name1}</h1>
    <p class="welcome-sub">Set up your profile to get started</p>
  </div>

  <div class="profile-info">
    <h3 class="section-title"><span>📋</span> Profile Details</h3>

    <form action="ProfileServlet" method="post">

      <div class="form-group full">
        <label>Bio</label>
        <input type="text" name="bio" placeholder="Tell something about yourself">
      </div>

      <div class="form-grid">
        <div class="form-group">
  <label>Skills You Can Teach</label>

  <div id="teachSkillContainer">
      <input type="text" name="teachSkill" placeholder="e.g. Java">
  </div>

  <button type="button" onclick="addTeachSkill()">+ Add Skill</button>
</div>


<div class="form-group">
  <label>Skills You Want to Learn</label>

  <div id="learnSkillContainer">
      <input type="text" name="learnSkill" placeholder="e.g. Photoshop">
  </div>

  <button type="button" onclick="addLearnSkill()">+ Add Skill</button>
</div>

        <div class="form-group">
          <label>Availability</label>
          <select name="availability">
            <option>Morning</option>
            <option>Afternoon</option>
            <option>Evening</option>
          </select>
        </div>

        <div class="form-group">
          <label>Learning Style</label>
          <select name="learningStyle">
            <option>Visual</option>
            <option>Practical</option>
            <option>Discussion</option>
            <option>Reading</option>
          </select>
        </div>
      </div>

      <div class="divider"></div>
      <button type="submit">Save Profile →</button>

    </form>
  </div>
</div>

</body>
</html>