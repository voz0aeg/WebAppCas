<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rol.aspx.cs" Inherits="WebAppCas.Rol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header ">
                    <div class="row">
                        <div class="col-md-8">
                            <h5 class="card-title">Roles</h5>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" class="btn btn-primary btn-round" OnClick="btnNuevo_Click" />
                        </div>
                    </div>
                </div>
                <div class="card-body ">
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="idRol" OnRowDeleting="GridView1_RowDeleting" class="table  table-bordered" BorderStyle="None" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="idRol" DataNavigateUrlFormatString="~/Rol.aspx?idRol={0}" NavigateUrl="~/Rol.aspx" HeaderText="Editar" Text="Editar">
                                <ControlStyle Font-Bold="True" Font-Overline="False" Font-Underline="True"></ControlStyle>
                                <ItemStyle ForeColor="Black"></ItemStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="idRol" DataField="idRol"></asp:BoundField>
                            <asp:BoundField HeaderText="Rol" DataField="Rol"></asp:BoundField>

                            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="res" runat="server" Text="."></asp:Label>
        </div>
        <asp:Panel ID="Edita" runat="server" class="col-md-6">
            <div class="card">
                <div class="card-header ">
                    <div class="row">
                        <div class="col-md-8">
                            <h5 class="card-title">Editar Rol</h5>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="card-body ">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6 ">
                                    <div class="form-group">
                                        <label>Nombre del Rol</label>
                                        <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2 " style="align-content: flex-end; display: flex;">
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" class="btn btn-primary btn-round" />
                                </div>


                                <asp:Panel ID="msg1" runat="server" class="col-md-4" Visible="false"> 
                                    <label>* guardar antes de agregar los permisos</label>
                                </asp:Panel>
                                
                            </div>

                            <div class="row">
                                <div class="col-md-4 ">
                                    <div class="form-group">
                                        <label>Menu Disponible</label>
                                        <asp:DropDownList ID="txtMenu" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-2" >
                                    <label>Agregar</label>
                                    <asp:LinkButton ID="btnAdda" runat="server" OnClick="btnAdda_Click" class="btn btn-primary btn-round icon-big text-center icon-warning"><i class="fas fa-arrow-alt-circle-right" style="font-size: 30px;"></i></asp:LinkButton>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Permisos Menu</label>
                                        <asp:GridView ID="GridView2" runat="server" OnRowDeleting="GridView2_RowDeleting" DataKeyNames="id" class="table table-bordered" BorderStyle="None"  AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:BoundField HeaderText="id" DataField="id" Visible="false"></asp:BoundField>
                                                <asp:BoundField HeaderText="menu" DataField="menu"></asp:BoundField>
                                                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="update ml-auto mr-auto">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </asp:Panel>
    </div>
</asp:Content>
