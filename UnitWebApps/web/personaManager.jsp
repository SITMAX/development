<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persona Manager</title>

        <%@include file="ExtJSScripts-ES.jsp"%>   

        <script type="text/javascript">
            Ext.ns('domain');

            domain.controlSwitches = {
            };


            domain.objects = {
                sitmax: 'http://sistemas.icg.com.bo:8080/sitmax/',
                proxy: '/http_proxy/proxy/?url='
            };

            Ext.SROOT = domain.objects.proxy + domain.objects.sitmax;

            domain.functions = {
                registrarPersona: function (options) {
                    var form = new Ext.FormPanel({
                        url: Ext.SROOT + 'command/persist/public/persona',
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Nombre',
                                allowBlank: false,
                                name: 'nombre'
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Apellido',
                                allowBlank: false,
                                name: 'apellido'
                            }]
                    });

                    var win = new Ext.Window({
                        title: 'Registrar Persona',
                        autoScroll: true,
                        width: 600,
                        autoHeight: true,
                        minWidth: 550,
                        items: form,
                        maximizable: true,
                        modal: true,
                        buttonAlign: 'center',
                        buttons: [{
                                text: 'Guardar',
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        form.getForm().submit({
                                            success: function (form, action) {
                                                options.grid.store.reload();
                                                win.close();
                                            },
                                            failure: function (form, action) {
                                                domain.errors.submitFailure('Error', 'Error en los datos del formularo.<br/>' + action.result.message);
                                            }
                                        });
                                    } else {
                                        domain.errors.submitFailure('Error', 'Error en los datos del formularo.');
                                    }
                                }
                            }]
                    });
                    win.show();
                }

            };
            //Main App Init
            domain.Panel = {
                init: function () {

                    var mapa = new Ext.Panel({
                        title: 'Mapa',
                        region: 'center',
                        layout: 'fit',
                        items: []
                    });

                    var store = new Ext.data.JsonStore({
                        url: Ext.SROOT + 'command/select/list/public/persona',
                        root: 'data',
                        fields: [
                            {name: 'id'},
                            {name: 'nombre'},
                            {name: 'codigo'},
                            {name: 'apellido', mapping: 'apellido'}
                        ],
                        autoLoad: true
                    });

                    var grid = new Ext.grid.GridPanel({
                        title: 'Productos',
                        region: 'center',
                        loadMask: true,
                        selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Código", width: 100, sortable: true, dataIndex: 'codigo'},
                            {header: "Nombre", width: 300, sortable: true, dataIndex: 'nombre'},
                            {header: "Apellido", width: 100, sortable: true, dataIndex: 'apellido'}
                        ],
                        store: store,
                        tbar: [{
                                iconCls: 'refresh',
                                handler: function () {
                                    grid.store.reload();
                                }
                            }, '-', {
                                text: 'Nuevo',
                                iconCls: 'create',
                                tooltip: 'Crear nuevo producto del almacen',
                                handler: function () {
                                    domain.functions.registrarPersona({grid: grid});
                                }
                            }, {
                                text: 'Cambiar',
                                iconCls: 'update',
                                tooltip: 'Cambiar producto del almacen',
                                handler: function () {
                                    var record = grid.getSelectionModel().getSelected();
                                    if (record) {
                                        domain.Tools.updateProduct({
                                            grid: grid,
                                            record: record
                                        });
                                    } else {
                                        com.icg.errors.mustSelect();
                                    }
                                }
                            }, {
                                text: 'Eliminar',
                                iconCls: 'delete',
                                tooltip: 'Eliminar producto del almacen',
                                handler: function () {
                                    var record = grid.getSelectionModel().getSelected();
                                    if (record) {
                                        domain.Tools.deleteProduct({
                                            grid: grid,
                                            record: record
                                        });
                                    } else {
                                        com.icg.errors.mustSelect();
                                    }
                                }
                            }, '-', {
                                text: 'Imprimir',
                                iconCls: 'printer',
                                tooltip: 'Imprimir un reporte.',
                                handler: function () {
                                    var records = new Array();
                                    store.each(function (r) {
                                        records.push(r.data);
                                    });
                                    var cfg = new Array();
                                    Ext.each(grid.getColumnModel().config, function (c) {
                                        if (c.dataIndex && !c.hidden) {
                                            cfg.push({
                                                header: c.header,
                                                dataIndex: c.dataIndex,
                                                width: c.width
                                            });
                                        }
                                    });
                                    Ext.Ajax.request({
                                        url: Ext.SROOT + 'print',
                                        method: 'POST',
                                        params: {
                                            title: 'PRODUCTOS DEL INVENTARIO',
                                            cfg: Ext.util.JSON.encode(cfg),
                                            records: Ext.util.JSON.encode(records)
                                        },
                                        success: function (result, request) {
                                            var data = Ext.util.JSON.decode(result.responseText);
                                            window.open(Ext.SROOT + 'print/open/' + data.file, '_blank', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=700,height=600');
                                        },
                                        failure: function (result, request) {
                                            if (result.status === '403') {
                                                domain.errors.submitFailure('Error', 'Error en la conexión.');
                                            }
                                        }
                                    });
                                }
                            }, '->', {
                                text: 'Opciones',
                                iconCls: 'service',
                                menu: [{
                                        text: 'Nueva unidad',
                                        iconCls: 'create',
                                        tooltip: 'Crear nueva unidad de almacenamiento',
                                        handler: function () {
                                            domain.Tools.newUnit();
                                        }
                                    }
                                ]}
                        ]
                    });

                    var panelDerecha = new Ext.Panel({
                        title: 'Datos Persona',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 700,
                        autoScroll: true,
                        //layout: 'fit',                        
                        items: [grid]
                    });

                    new Ext.Viewport({
                        layout: 'border',
                        items: [mapa, panelDerecha]
                    });
                }
            };
            Ext.onReady(domain.Panel.init, domain.Panel);
        </script> 
    </head>
    <body>        
    </body>
</html>

