<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
    overflow: hidden;
  }

  body::before, body::after {
    content: '';
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.25;
    animation: drift 8s ease-in-out infinite alternate;
    z-index: 0;
  }
  body::before {
    width: 500px; height: 500px;
    background: radial-gradient(circle, #7c3aed, #4f46e5);
    top: -100px; right: -100px;
    animation-delay: -2s;
  }
  body::after {
    width: 400px; height: 400px;
    background: radial-gradient(circle, #6366f1, #0ea5e9);
    bottom: -80px; left: -80px;
    animation-delay: -5s;
  }

  @keyframes drift {
    from { transform: translate(0, 0) scale(1); }
    to   { transform: translate(40px, 30px) scale(1.08); }
  }

  .card {
    position: relative;
    z-index: 1;
    background: rgba(255, 255, 255, 0.04);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(24px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 24px;
    padding: 48px 44px 40px;
    width: 100%;
    max-width: 420px;
    box-shadow:
      0 0 0 1px rgba(255,255,255,0.04),
      0 32px 64px rgba(0, 0, 0, 0.5),
      inset 0 1px 0 rgba(255,255,255,0.08);
    animation: fadeUp 0.6s cubic-bezier(0.22, 1, 0.36, 1) both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(28px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .card-header {
    margin-bottom: 36px;
    text-align: center;
  }

  .card-header .icon {
    width: 52px; height: 52px;
    background: linear-gradient(135deg, #7c3aed, #6366f1);
    border-radius: 14px;
    display: flex; align-items: center; justify-content: center;
    margin: 0 auto 20px;
    font-size: 22px;
    box-shadow: 0 8px 24px rgba(124, 58, 237, 0.4);
  }

  h2 {
    font-family: 'Playfair Display', serif;
    font-size: 1.85rem;
    color: #f1f5f9;
    letter-spacing: -0.3px;
    margin-bottom: 6px;
  }

  .subtitle {
    font-size: 0.875rem;
    color: #64748b;
    font-weight: 300;
  }

  .form-group {
    margin-bottom: 20px;
    animation: fadeUp 0.6s cubic-bezier(0.22, 1, 0.36, 1) both;
  }
  .form-group:nth-child(1) { animation-delay: 0.1s; }
  .form-group:nth-child(2) { animation-delay: 0.18s; }
  .form-group:nth-child(3) { animation-delay: 0.26s; }

  label {
    display: block;
    font-size: 0.78rem;
    font-weight: 500;
    color: #94a3b8;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 8px;
  }

  input[type="text"],
  input[type="email"],
  input[type="password"] {
    width: 100%;
    padding: 13px 16px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 12px;
    color: #e2e8f0;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.95rem;
    outline: none;
    transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
  }

  input[type="text"]::placeholder,
  input[type="email"]::placeholder,
  input[type="password"]::placeholder {
    color: #334155;
  }

  input[type="text"]:focus,
  input[type="email"]:focus,
  input[type="password"]:focus {
    border-color: rgba(124, 58, 237, 0.6);
    background: rgba(124, 58, 237, 0.07);
    box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
  }

  .password-hint {
    font-size: 0.75rem;
    color: #475569;
    margin-top: 6px;
  }

  button[type="submit"] {
    width: 100%;
    padding: 14px;
    margin-top: 8px;
    background: linear-gradient(135deg, #7c3aed 0%, #6366f1 100%);
    color: #fff;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.95rem;
    font-weight: 500;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    letter-spacing: 0.3px;
    transition: transform 0.15s ease, box-shadow 0.15s ease, opacity 0.15s;
    box-shadow: 0 4px 20px rgba(124, 58, 237, 0.4);
    animation: fadeUp 0.6s 0.34s cubic-bezier(0.22, 1, 0.36, 1) both;
  }

  button[type="submit"]:hover {
    transform: translateY(-1px);
    box-shadow: 0 8px 28px rgba(124, 58, 237, 0.55);
  }

  button[type="submit"]:active {
    transform: translateY(1px);
    opacity: 0.9;
  }

  .divider {
    height: 1px;
    background: rgba(255,255,255,0.06);
    margin: 28px 0 24px;
  }

  .login-link {
    text-align: center;
    font-size: 0.875rem;
    color: #475569;
    animation: fadeUp 0.6s 0.4s cubic-bezier(0.22, 1, 0.36, 1) both;
  }

  .login-link a {
    color: #a78bfa;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.2s;
  }

  .login-link a:hover {
    color: #c4b5fd;
    text-decoration: underline;
  }
</style>
</head>
<body>

<div class="card">
  <div class="card-header">
    <div class="icon">hello</div>
    <h2>Create account</h2>
    <p class="subtitle">Join us — it only takes a moment</p>
  </div>

  <form action="RegisterServlet" method="post">
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" placeholder="Enter your name">
    </div>
    <div class="form-group">
      <label for="useremail">Email</label>
      <input type="email" id="useremail" name="useremail" placeholder="Enter your email">
    </div>
    <div class="form-group">
      <label for="userpassword">Password</label>
      <input type="password" id="userpassword" name="userpassword" placeholder="••••••••">
      <p class="password-hint">Use at least 8 characters</p>
    </div>
    <button type="submit">Create Account →</button>
  </form>

  <div class="divider"></div>

  <div class="login-link">
    Already have an account? <a href="login.jsp">Sign in</a>
  </div>
</div>

</body>
</html>