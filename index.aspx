<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebAppCas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card card-stats">
                <div class="card-body ">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="icon-big text-center icon-warning">
                                <i class="fas fa-thumbs-up"></i>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <h2 runat="server" id="lblSaludo">Buenas tardes</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Label ID="res" runat="server" Text="."></asp:Label>
</asp:Content>
