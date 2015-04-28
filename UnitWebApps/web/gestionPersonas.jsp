<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Personas</title>

        <%@include file="ExtJSScripts-ES.jsp"%>   

        <script type="text/javascript">
            Ext.ns('domain');

            domain.controlSwitches = {
            };

            domain.objects = {
            };

            domain.functions = {
                crear: function (options) {
                    alert('crear...');
                },
                editar: function (options) {
                    alert('editar...');
                },
                eliminar: function (options) {
                    alert('eliminar...');
                }
            };
            //Prueba Commit ---rhuanacuni
            //Main App Init
            domain.Panel = {
                init: function () {
                    var mapa = new Ext.Panel({
                        title: 'Mapa',
                        region: 'center',
                        layout: 'fit',
                        items: []
                    });

                    var panelLeft = new Ext.Panel({
                        title: 'Buscar',
                        region: 'west',
                        split: true,
                        collapsible: true,
                        width: 350,
                        //layout: 'border',
                        items: []
                    });

                    var panelRigth = new Ext.Panel({
                        title: 'Entity',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 350,
                        //layout: 'fit',
                        items: [],
                        tbar: [{
                                text: 'Nuevo',
                                iconCls: 'create',
                                tooltip: 'Crear...<>',
                                handler: function () {
                                    domain.functions.crear({});
                                }
                            }, {
                                text: 'Editar',
                                iconCls: 'update',
                                tooltip: 'Editar ...<>',
                                handler: function () {
                                    domain.functions.editar({});
                                }
                            }, {
                                text: 'Eliminar',
                                iconCls: 'delete',
                                tooltip: 'Eliminar...<>',
                                handler: function () {
                                    domain.functions.eliminar({});
                                }
                            }]
                    });

                    new Ext.Viewport({
                        layout: 'border',
                        items: [panelLeft, mapa, panelRigth]
                    });

                }
            };

            Ext.onReady(domain.Panel.init, domain.Panel);
        </script> 
    </head>
    <body>        
    </body>
</html>

