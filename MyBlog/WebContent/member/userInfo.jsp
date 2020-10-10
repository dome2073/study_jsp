<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<!-- Page Header -->
  <header class="masthead" style="background-image: url('img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>MyPage</h1>
            <span class="subheading">회원님의 회원 정보입니다.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        
        <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
        <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
        <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
        <form name="sentMessage" id="contactForm" novalidate>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>ID</label>
              <input type="text" class="form-control" placeholder="ID" id="ID" required data-validation-required-message="Please enter your name." value="${userInfo.user_id}">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>Name</label>
              <input type="text" class="form-control" placeholder="NAME" id="name" required data-validation-required-message="Please enter your name." value="${userInfo.user_name}">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>Email Address</label>
              <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address." value="${userInfo.user_email}">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>PASSWORD</label>
              <input type="text" class="form-control" placeholder="PASSWORD" id="password" required data-validation-required-message="Please enter your phone number." value="${userInfo.user_pw}">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>REGISTER DATE</label>
              <textarea rows="5" class="form-control" placeholder="REGISTER DATE" id="IN_DATE" required data-validation-required-message="Please enter a message." value="${userInfo.in_date}"></textarea>
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <br>
          <div id="success"></div>
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Send</button>
        </form>
      </div>
    </div>
  </div>

  <hr>

<%-- 	아이디 : ${userInfo.user_id}
	비밀번호 : ${userInfo.user_pw}
	이름 : ${userInfo.user_name }
	이메일 : ${userInfo.user_email }
	가입일 : ${userInfo.in_date } --%>



<%@ include file="/include/footer.jsp" %>