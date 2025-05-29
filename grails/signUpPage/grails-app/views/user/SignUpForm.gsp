<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" 
    crossorigin="anonymous">

    <asset:stylesheet src="signUpForm.css"/>
</head>
<body>
    <header class="page-header">
        <span>
            <asset:image src="AsaasLogo.png" alt="Asaas Logo"/>
        </span>
    </header>
    <!-- <g:if test="${flash.message}">
        <div style="color: green">${flash.message}</div>
    </g:if> -->

    <main class="container main-content">
        <div class="card form-section row">
        
            <div class="logo-section col-6">
                <asset:image class="logo" src="AsaasLogo.png" alt="Asaas Logo"/>
                <h1 class="form-title">Sign Up</h1>
            </div>

            <g:form class="card-body sign-up-form-section col-6 p-4" controller="user" action="save">
                <div class="row mb-3">
                    <div>
                        <label>Name:</label>
                        <g:textField class="form-control input-field" name="name" value="${user?.name}" />
                        <g:hasErrors bean="${user}" field="name">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>

                    <div>
                        <label>Email:</label>
                        <g:textField class="form-control input-field" name="email" value="${user?.email}" />
                        <g:hasErrors bean="${user}" field="email">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>
            
                    <div>
                        <label>CPF:</label>
                        <g:textField class="form-control input-field" name="cpf" value="${user?.cpf}" />
                        <g:hasErrors bean="${user}" field="cpf">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>
            
                    <div>
                        <label>Phone Number:</label>
                        <g:textField 
                            class="form-control input-field" 
                            name="phoneNumber" 
                            value="${user?.phoneNumber}" />
                        <g:hasErrors bean="${user}" field="phoneNumber">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>
            
                    <div class="col-12">
                        <label>Birth Date:</label>
                        <g:datePicker class="form-control input-field"
                            name="birthDate" 
                            value="${user?.birthDate}" 
                            precision="day" 
                            years="${1920..2025}"/>
                        <g:hasErrors bean="${user}" field="birthDate">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>

                    <div class="col-12 col-sm-6">
                        <label>CEP:</label>
                        <g:textField class="form-control input-field" 
                            name="cep" 
                            value="${user?.cep}"/>
                        <g:hasErrors bean="${user}" field="cep">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>

                    <div>
                        <label>Address:</label>
                        <g:textField class="form-control input-field" name="address" value="${user?.address}" disabled="disabled"/>
                        <g:hasErrors bean="${user}" field="address">
                            <span style="color:red;"><g:message error="${it}"/></span>
                        </g:hasErrors>
                    </div>
                </div>

                <div class="buttons-div">
                    <g:submitButton class="submit-button btn btn-primary" name="save" value="Confirm" class="btn btn-primary"/>
                </div>
            </g:form>
        </div>
    </main>
</body>
</html>