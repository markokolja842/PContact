<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="PContactWebApp.ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="css/style.css" rel="stylesheet" />
    <link href="css/CSSSkeleton.css" rel="stylesheet" />



    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/eUtils.js?rnd=7"></script>

</head>
<body>
<%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>


    <div class="strana">

        <div class="row">
            <div class="twelve columns">
                <h1><span>Neki podaci</span></h1>
                <span class="linija bgd9"></span>
                <label class=""><i>Osnovni podaci</i></label>
            </div>
        </div>

        <div class="row margin_input osnovniPod">
            <div class="five columns ">
                
                <span><b>Department Id</b></span>
                <div class="marginBottom2">
                    <input class="input" type="text" dbf="DepartmentId" value="" maxlength="50" reg="[^\s]+" />
                </div>

            </div>
        </div>

        <div class="row margin_input osnovniPod">
            <div class="five columns ">
                <span><b>Department Name</b></span>
                <div class="marginBottom2">
                    <input class="input" type="text" dbf="DepartmentName" value="" maxlength="50" reg="[^\s]+" mark_unutra obavezan/>
                </div>
            </div>
        </div>


        <span><b>Tip lica</b></span>

        <div class="row tipLica">
            <div class="input_field  marginTop0 marginBottom1">
                <div class="three columns ">
                    <select dbf="TipLica" obavezan class="select" dbflist="tipoviLica" tabindex="1"></select>
                </div>
                <input type="hidden" dbf="pol_s" value="" />
            </div>
        </div>
        <div class="row margin_input marginBottom2">
            <span class="linija bgd9"></span>
            <div class="btn four bgd4">
                <a href="javascript:void(0);" onclick="Klikni();">Neko dugme</a>
            </div>
        </div>


    </div>

    <div class="invisible modal_container">
        <form id="form2" enctype="multipart/form-data" method="post" class="form_modal">
            <div class="modal_inner_container relative">
                <div class="modal-bg modal-ready"></div>
                <div class="modal-wrap modal-auto-cursor modal-ready" tabindex="-1">
                    <div class="modal-container modal-s-ready modal-inline-holder">
                        <div class="modal-content">
                            <div class="uc_loading">
                                <div class="loading">
                                    <div class="loading_img" style="display:block; width:100%; background:#E20010; padding:1em; color:#fff;">
                                        <div style="width:20%; display:inline-block; padding-left:1em;">
                                            <label style="padding-bottom:0.5em;">Molimo, sačekajte...</label>
                                            <img src="images/onpoint-preloaderrrr.gif" style="display:inline-block;" />
                                        </div>
                                    </div>
                                </div>
                                <div class="loading_text">
                                    <label></label>
                                </div>
                            </div>
                            <div class="uc_container"></div>
                            <button title="Close (Esc)" type="button" class="modal-close">×</button>
                        </div>
                    </div>
                </div>
            </div>         
    </form>
</div>


    <div id="sql_insert_korak" runat="server" visible="false">
        INSERT INTO dbo.DepartmentAPI(DepartmentName)VALUES(N'!DepartmentName!')
    </div>

    <script type="text/javascript">

        var polovi = [{ "id": "0", "naziv": " --- " }, { "id": "1", "naziv": "Muški" }, { "id": "2", "naziv": "Ženski" }];
        var tipoviLica = [{ "id": "1", "naziv": "Fizičko lice" }, { "id": "2", "naziv": "Pravno lice" }];


        var podaciS = <%=podaci%>;

        $(function() {

            $(':dbf(TipLica)').initSelect(tipoviLica);


            var obj = $('.strana').initObjectByDBFs();

 

        });

        function Klikni() {

            var obj = $('.strana').initObjectByDBFs();


            var niz = [];

            //niz.initObjectByDBFs();

            //ajaxPost({ "Lice": "1" }, function (result) {
            //    result = JSON.parse(result);

            //    console.log(niz);

            //});

            //obj = JSON.stringify(obj);

            popup();

            ajaxPost({ "Lice": "1", "Podaci" : obj }, function (result) {
                popupHide();
                var odgovor = JSON.parse(result);
                console.log(odgovor);
            });
        }

    </script>

</body>
</html>
