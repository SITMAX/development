<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ficha Catastral v.01</title>

        <%@include file="ExtJSScripts-ES.jsp"%>   

        <script type="text/javascript">
            Ext.ns('domain');

            domain.controlSwitches = {
            };

            domain.objects = {
            };

            domain.functions = {
            };
            //Main App Init
            domain.Panel = {
                init: function () {
                    var tipoTitular = new Ext.form.TextField({
                        fieldLabel: 'Tipo Titular',
                        name: 'txt-tipoTitular',
                        emptyText: 'Tipo titular...',
                        id: "id_tipo_titular"
                    });
                    var nombres = new Ext.form.TextField({
                        fieldLabel: 'Nombres',
                        name: 'txt-nombres',
                        emptyText: 'Nombres...',
                        id: "nombres"
                    });
                    var paterno = new Ext.form.TextField({
                        fieldLabel: 'Ap. Paterno',
                        name: 'txt-paterno',
                        emptyText: 'Apellido paterno...',
                        id: "paterno"
                    });
                    var materno = new Ext.form.TextField({
                        fieldLabel: 'Ap. Materno',
                        name: 'txt-materno',
                        emptyText: 'Apellido materno...',
                        id: "materno"
                    });
                    var tipoDocumento = new Ext.form.TextField({
                        fieldLabel: 'Tipo de Documento',
                        name: 'txt-tipoDocumento',
                        emptyText: 'Tipo de documento...',
                        id: "id_tipo_documento"
                    });
                    var documento = new Ext.form.TextField({
                        fieldLabel: 'Nro. de Documento',
                        name: 'txt-documento',
                        emptyText: 'Nro. de documento...',
                        id: "documento"
                    });

                    var formulario1 = new Ext.form.FormPanel({
                        //title: 'Formulario 1',
                        bodyStyle: 'padding: 10px',
                        items: [tipoTitular, nombres, paterno, materno, tipoDocumento, documento]
                    });

                    var panelAcordeon1 = new Ext.Panel({
                        title: 'Datos propietario',
                        collapsed: true,
                        autoHeight: true,
                        //html: "El contenido viene aca",
                        bodyStyle: 'padding:10x;',
                        //height: 200,
                        border: false,
                        collapsible: true,
                        titleCollapse: true,
                        items: [formulario1]
                    });
                    var panelAcordeon2 = new Ext.Panel({
                        title: 'Unidad Catastral - Datos de Ubicacion',
                        collapsed: true,
                        autoHeight: true,
                        html: "El contenido viene aca",
                        bodyStyle: 'padding:10x;',
                        //height: 200,
                        border: false,
                        collapsible: true,
                        titleCollapse: true
                    });
                    var panelAcordeon3 = new Ext.Panel({
                        title: 'Unidad Catastral - Datos Generales de la Parcela',
                        collapsed: true,
                        //autoHeight: true,
                        html: "El contenido viene aca",
                        bodyStyle: 'padding:10x;',
                        height: 200,
                        border: false,
                        collapsible: true,
                        titleCollapse: true
                    });

                    var mapa = new Ext.Panel({
                        title: 'Mapa',
                        region: 'center',
                        layout: 'fit',
                        items: []
                    });

                    var panelFicha = new Ext.Panel({
                        title: 'Ficha Catastral',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 700,
                        //layout: 'fit',
                        items: [panelAcordeon1, panelAcordeon2, panelAcordeon3]
                    });

                    new Ext.Viewport({
                        layout: 'border',
                        items: [mapa, panelFicha]
                    });
                }
            };
            Ext.onReady(domain.Panel.init, domain.Panel);
        </script> 
    </head>
    <body>        
    </body>
</html>

