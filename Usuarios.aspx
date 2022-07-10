<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebAppCas.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header ">
                    <div class="row">
                        <div class="col-md-8">
                            <h5 class="card-title">Usuarios</h5>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" class="btn btn-primary btn-round" />
                        </div>
                    </div>
                </div>
                <div class="card-body ">
                    <asp:GridView ID="GridView1" ClientIDRowSuffix="NoEmpleado" runat="server" class="table  table-bordered" BorderStyle="None" AutoGenerateColumns="False" Width="100%" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="NoEmpleado" DataNavigateUrlFormatString="~/Usuarios.aspx?User={0}" NavigateUrl="~/Usuarios.aspx" HeaderText="Editar" Text="Editar">
                                <ControlStyle Font-Bold="True" Font-Overline="False" Font-Underline="True"></ControlStyle>
                                <ItemStyle ForeColor="Black"></ItemStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="Número" DataField="NoEmpleado"></asp:BoundField>
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre"></asp:BoundField>
                            <asp:BoundField HeaderText="rol" DataField="Rol"></asp:BoundField>
                            <asp:BoundField HeaderText="edad" DataField="edad"></asp:BoundField>

                            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="res" runat="server" Text="."></asp:Label>
        </div>
        <asp:Panel ID="UserEdita" runat="server" class="col-md-6">
            <div class="card">
                <div class="card-header ">
                    <div class="row">
                        <div class="col-md-8">
                            <h5 class="card-title">Editar Usuario</h5>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblNoUser" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="card-body ">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 pl-1">
                                    <div class="form-group">
                                        <label>Apellidos</label>
                                        <asp:TextBox ID="txtApellidos" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Dirección</label>
                                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 pr-1">
                                    <div class="form-group">
                                        <label>Fecha de Nacimiento</label>
                                        <asp:TextBox ID="txtfNacimiento" runat="server" class="form-control" placeholder="dd/mm/aaaa"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 px-1">
                                    <div class="form-group">
                                        <label>Rol</label>
                                        <asp:DropDownList ID="txtRol" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 pl-1">
                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <asp:TextBox ID="txtContrasena" runat="server" class="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="update ml-auto mr-auto">
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" class="btn btn-primary btn-round" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </asp:Panel>
    </div>
    
</asp:Content>
