<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppCas.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 col-lg-5">
                            <div class="login-wrap p-4 p-md-5">
                                <h3 class="mb-4">Login</h3>
                                    <div class="form-group">
                                        <label class="label">Número Empleado</label>
                                        <asp:TextBox ID="txtNoUser" runat="server" class="form-control" ></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="label" for="password">Password</label>
                                        <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group d-flex justify-content-end mt-6">
                                        <asp:LinkButton ID="btn1" runat="server" OnClick="btn1_Click" class="btn btn-primary">Entrar</asp:LinkButton>
                                    </div>
                                <div class="row justify-content-center">
                                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                </div>
                                    
                                
                            </div>
                        </div>

                    </div>
                    
                </div>
            </section>

        </div>
    </form>
</body>
</html>
