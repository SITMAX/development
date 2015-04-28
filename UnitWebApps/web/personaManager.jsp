<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persona Manager</title>

        <%@include file="../ExtJSScripts-ES.jsp"%>   

        <script type="text/javascript">
            Ext.ns('domain');
            domain.controlSwitches = {
            };
            domain.objects = {
                sitmax: 'http://sistemas.icg.com.bo:8080/sitmax/',
                proxy: '/http_proxy/proxy/?url=',
                busquedaAvanzadaForm: function (options) {
                    var contCuit = function (combo, record, index) {
                        switch (record.data.type) {
                            case '1':
                                form.remove(domain.objects.bCuit);
                                var bCuit = new Ext.form.FieldSet({
                                    title: 'Datos CUIT',
                                    collapsible: true,
                                    autoHeight: true,
                                    items: [{
                                            xtype: 'compositefield',
                                            fieldLabel: 'CUIT',
                                            // anchor    : '-20',
                                            // anchor    : null,
                                            msgTarget: 'under',
                                            items: [
                                                {
                                                    xtype: 'numberfield',
                                                    fieldLabel: 'Codigo 1',
                                                    name: 'cuitCodigo1',
                                                    autoCreate: {tag: 'input', type: 'text', size: '20', autocomplete:
                                                                'off', maxlength: '2'},
                                                    width: 50
                                                }, {
                                                    xtype: 'numberfield',
                                                    fieldLabel: 'Codigo 2',
                                                    name: 'cuitCodigo2',
                                                    autoCreate: {tag: 'input', type: 'text', size: '20', autocomplete:
                                                                'off', maxlength: '8'},
                                                    width: 120
                                                }, {
                                                    xtype: 'numberfield',
                                                    fieldLabel: 'Codigo 3',
                                                    name: 'cuitCodigo3',
                                                    autoCreate: {tag: 'input', type: 'text', size: '20', autocomplete:
                                                                'off', maxlength: '1'},
                                                    width: 30
                                                }]
                                        }]
                                });
                                domain.objects.bCuit = bCuit;
                                form.insert(form.items.indexOf(cbCuit) + 1, bCuit);
                                break;
                            case '0':
                                form.remove(domain.objects.bCuit);
                                break;
                        }
                        form.doLayout();
                    };
                    var cbCuit = new Ext.form.ComboBox({
                        name: 'conCuit',
                        msgTarget: 'side',
                        anchor: '47.5%',
                        fieldLabel: 'CUIT',
                        hiddenName: 'conCuit',
                        forceSelection: true,
                        store: new Ext.data.ArrayStore({
                            fields: ['type', 'objeto'],
                            data: [['1', 'SI'], ['0', 'NO']]
                        }),
                        valueField: 'type',
                        displayField: 'objeto',
                        typeAhead: true,
                        mode: 'local',
                        triggerAction: 'all',
                        emptyText: 'Selecione...',
                        selectOnFocus: true,
                        listeners: {
                            select: contCuit
                        }
                    });
                    var conNroDoc = function (combo, record, index) {
                        switch (record.data.type) {
                            case '1':
                                form.remove(domain.objects.dd);
                                var dd = new Ext.form.FieldSet({
                                    title: 'Datos de documento',
                                    collapsible: true,
                                    autoHeight: true,
                                    items: [{
                                            layout: 'column',
                                            border: false,
                                            items: [
                                                {
                                                    columnWidth: .5,
                                                    layout: 'form',
                                                    border: false,
                                                    items: [
                                                        {
                                                            xtype: 'textfield',
                                                            fieldLabel: 'Nro de documento',
                                                            name: 'numeroDocumento',
                                                            anchor: '95%'
                                                        }]
                                                }, {
                                                    columnWidth: .5,
                                                    layout: 'form',
                                                    border: false,
                                                    items: [{
                                                            xtype: 'combo',
                                                            fieldLabel: 'Tipo Documento',
                                                            name: 'tipoDocumento',
                                                            anchor: '95%',
                                                            hiddenName: 'type',
                                                            forceSelection: true,
                                                            store: new Ext.data.ArrayStore({
                                                                fields: ['type', 'objeto'],
                                                                data: [['D', 'DNI'],
                                                                    ['F', 'Cédula Federal'],
                                                                    ['U', 'Cédula'],
                                                                    ['C', 'LC'],
                                                                    ['E', 'LE'],
                                                                    ['P', 'Pasaporte'],
                                                                    ['O', 'Otro'],
                                                                    ['N', 'No Informado'],
                                                                    ['X', 'Extranjero'],
                                                                    ['B', 'Padrón TGI'],
                                                                    ['0', 'Sin tipo asignado']
                                                                ]
                                                            }),
                                                            valueField: 'type',
                                                            displayField: 'objeto',
                                                            typeAhead: true,
                                                            mode: 'local',
                                                            triggerAction: 'all',
                                                            emptyText: 'Selecione tipo de documento...',
                                                            selectOnFocus: true
                                                        }]
                                                }
                                            ]
                                        }
                                    ]
                                });
                                domain.objects.dd = dd;
                                form.insert(form.items.indexOf(cbNroDocumento) + 1, dd);
                                break;
                            case '0':
                                form.remove(domain.objects.dd);
                                break;
                        }
                        form.doLayout();
                    };
                    var cbNroDocumento = new Ext.form.ComboBox({
                        name: 'conNumeroDocumento',
                        msgTarget: 'side',
                        fieldLabel: 'N. Documento',
                        hiddenName: 'conNumeroDocumento',
                        forceSelection: true,
                        anchor: '47.5%',
                        store: new Ext.data.ArrayStore({
                            fields: ['type', 'objeto'],
                            data: [['1', 'SI'], ['0', 'NO']]
                        }),
                        valueField: 'type',
                        displayField: 'objeto',
                        typeAhead: true,
                        mode: 'local',
                        triggerAction: 'all',
                        emptyText: 'Selecione...',
                        selectOnFocus: true,
                        listeners: {
                            select: conNroDoc
                        }
                    });
                    var tipoBusqueda = function (combo, record, index) {
                        switch (record.data.type) {
                            case 'J':
                                form.remove(domain.objects.dj);
                                var dj = new Ext.form.FieldSet({
                                    title: 'Datos Juridicos',
                                    collapsible: true,
                                    autoHeight: true,
                                    items: [{
                                            layout: 'column',
                                            border: false,
                                            items: [
                                                {
                                                    columnWidth: .5,
                                                    layout: 'form',
                                                    border: false,
                                                    items: [
                                                        {
                                                            xtype: 'textfield',
                                                            fieldLabel: 'Razon Social',
                                                            name: 'razonSocial',
                                                            anchor: '95%'
                                                        }]
                                                }, {
                                                    columnWidth: .5,
                                                    layout: 'form',
                                                    border: false,
                                                    items: [{
                                                            xtype: 'textfield',
                                                            fieldLabel: 'Nombre Fantasia',
                                                            name: 'nombreFantasia',
                                                            anchor: '95%'
                                                        }]
                                                }
                                            ]
                                        }
                                    ]
                                });
                                domain.objects.dj = dj;
                                form.insert(form.items.indexOf(comboTipoBusqueda) + 1, dj);
                                break;
                            case 'F':
                                form.remove(domain.objects.dj);
                                break;
                        }
                        form.doLayout();
                    };
                    var comboTipoBusqueda = new Ext.form.ComboBox({
                        name: 'tipoBusqueda',
                        msgTarget: 'side',
                        anchor: '47.5%',
                        fieldLabel: 'Tipo Busqueda',
                        hiddenName: 'tipoBusqueda',
                        forceSelection: true,
                        store: new Ext.data.ArrayStore({
                            fields: ['type', 'objeto'],
                            data: [['F', 'Persona Física'], ['J', 'Persona Jurídica']]
                        }),
                        valueField: 'type',
                        displayField: 'objeto',
                        typeAhead: true,
                        mode: 'local',
                        triggerAction: 'all',
                        emptyText: 'Selecione el tipo...',
                        selectOnFocus: true,
                        listeners: {
                            select: tipoBusqueda
                        }
                    });
                    var form = new Ext.FormPanel({
                        frame: true,
                        collapsible: true,
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side'
                        },
                        items: [{
                                layout: 'column',
                                border: false,
                                items: [
                                    {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [
                                            {
                                                xtype: 'textfield',
                                                fieldLabel: 'Nombre',
                                                name: 'nombre',
                                                anchor: '95%'
                                            }
                                        ]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Apellido',
                                                name: 'apellido',
                                                anchor: '95%'

                                            }]

                                    }]
                            },
                            cbCuit,
                            {
                                layout: 'column',
                                border: false,
                                items: [
                                    {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [
                                            {
                                                xtype: 'numberfield',
                                                fieldLabel: 'Fila inicial',
                                                name: 'filaInicial',
                                                anchor: '95%'
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'numberfield',
                                                fieldLabel: 'Total filas',
                                                name: 'totalFilas',
                                                anchor: '95%'
                                            }]
                                    }]
                            },
                            cbNroDocumento,
                            comboTipoBusqueda,
                            {
                                xtype: 'combo',
                                fieldLabel: 'Unificado',
                                name: 'conUnificado',
                                anchor: '47.5%',
                                hiddenName: 'conUnificado',
                                forceSelection: true,
                                store: new Ext.data.ArrayStore({
                                    fields: ['type', 'objeto'],
                                    data: [['1', 'SI'],
                                        ['0', 'NO']
                                    ]
                                }),
                                valueField: 'type',
                                displayField: 'objeto',
                                typeAhead: true,
                                mode: 'local',
                                triggerAction: 'all',
                                emptyText: 'Selecione si incluye unificado...',
                                selectOnFocus: true
                            }
                        ],
                        buttonAlign: 'center',
                        buttons: [{
                                text: "Buscar",
                                width: 100,
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        if (form.getForm().isValid()) {
                                            var store = new Ext.data.JsonStore({
                                                url: Ext.SROOT + 'simgeisrv/buscarAvanzada',
                                                root: 'data',
                                                fields: [
                                                    {name: 'id'},
                                                    {name: 'nombre'},
                                                    {name: 'codigo'},
                                                    {name: 'apellido', mapping: 'apellido'},
                                                    {name: 'cuit'},
                                                    {name: 'numeroDocumento'},
                                                    {name: 'razonSocial'},
                                                    {name: 'sexo'},
                                                    {name: 'tipoActor'},
                                                    {name: 'tipoDocumento'},
                                                    {name: 'email'},
                                                    {name: 'unificados'},
                                                    {name: 'fechaNacimiento'},
                                                    {name: 'telefonoPrincipal'},
                                                    {name: 'firmaSidom'}
                                                ],
                                                autoLoad: true,
                                                baseParams: form.getForm().getValues()
                                            });
                                            var grid = new Ext.grid.GridPanel({
                                                title: 'Resultados',
                                                height: 300,
                                                region: 'center',
                                                loadMask: true,
                                                selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                                                columns: [new Ext.grid.RowNumberer({
                                                        width: 27
                                                    }),
                                                    {header: "Apellido", width: 100, sortable: true, dataIndex: 'apellido'},
                                                    {header: "Nombre", width: 100, sortable: true, dataIndex: 'nombre'},
                                                    {header: "Código", width: 100, sortable: true, dataIndex: 'codigo'},
                                                    {header: "Cuit", width: 100, sortable: true, dataIndex: 'cuit'},
                                                    {header: "Id", width: 100, sortable: true, dataIndex: 'id'},
                                                    {header: "Nro. Documento", width: 100, sortable: true, dataIndex: 'numeroDocumento'},
                                                    {header: "Razon Social", width: 100, sortable: true, dataIndex: 'razonSocial'},
                                                    {header: "Sexo", width: 100, sortable: true, dataIndex: 'sexo'},
                                                    {header: "Tipo Persona", width: 100, sortable: true, dataIndex: 'tipoActor'},
                                                    {header: "Tipo Documento", width: 100, sortable: true, dataIndex: 'tipoDocumento'},
                                                    {header: "Email", width: 100, sortable: true, dataIndex: 'email'},
                                                    {header: "Unificado", width: 100, sortable: true, dataIndex: 'unificados'},
                                                    {header: "Fecha Nacimiento", width: 100, sortable: true, dataIndex: 'fechaNacimiento'}
                                                ],
                                                store: store,
                                                tbar: [{
                                                        text: 'Detalles',
                                                        iconCls: 'create',
                                                        tooltip: 'Detalles de una persona',
                                                        handler: function () {
                                                            var record = grid.getSelectionModel().getSelected();
                                                            if (record) {
                                                                domain.functions.registrarPersona({
                                                                    grid: grid,
                                                                    record: record
                                                                });
                                                            } else {
                                                                Ext.MessageBox.show({
                                                                    title: 'Aviso',
                                                                    msg: 'Debe seleccionar un <b>Registro</b>.',
                                                                    buttons: Ext.MessageBox.OK,
                                                                    icon: Ext.Msg.INFO
                                                                });
                                                            }
                                                        }
                                                    }]
                                            });
                                            domain.Panel.tabElemAvanzada.remove(1);
                                            domain.Panel.tabElemAvanzada.add(grid);
                                            domain.Panel.tabElemAvanzada.doLayout();
                                        }
                                    }
                                }
                            }]
                    });
                    return form;
                }
            };
            //Ext.SROOT = "/";
            //Main App Init
            domain.functions = {
                registroForm: function (options) {
                    var store = new Ext.data.JsonStore({
                        url: Ext.SROOT + 'simgeisrv/buscarDireccion',
                        root: 'data',
                        fields: [
                            {name: 'activo'},
                            {name: 'codPostal'},
                            {name: 'direccion'},
                            {name: 'distrito', mapping: 'distrito'},
                            {name: 'id'},
                            {name: 'item'},
                            {name: 'nombreCalle'},
                            {name: 'numero'},
                            {name: 'observaciones'},
                            {name: 'provincia'},
                            {name: 'secuencia'},
                            {name: 'tipoDireccion'},
                            {name: 'tipoDomicilio'},
                            {name: 'departamento'},
                            {name: 'zona'},
                            {name: 'edificio'},
                            {name: 'idCalle'},
                            {name: 'letra'},
                            {name: 'local'},
                            {name: 'manzana'},
                            {name: 'monoblock'},
                            {name: 'padron'},
                            {name: 'piso'},
                            {name: 'sector'},
                            {name: 'tipoPortal'},
                            {name: 'torre'},
                            {name: 'vivienda'},
                            {name: 'fecha_activo'}
                        ],
                        autoLoad: true,
                        baseParams: {id: options.record.data.id}
                    });
                    var grid = new Ext.grid.GridPanel({
                        title: 'Direcciones Actor',
                        height: 300,
                        region: 'center',
                        loadMask: true,
                        selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "direccion", width: 100, sortable: true, dataIndex: 'direccion'},
                            {header: "nombreCalle", width: 100, sortable: true, dataIndex: 'nombreCalle'},
                            {header: "numero", width: 100, sortable: true, dataIndex: 'numero'},
                            {header: "zona", width: 100, sortable: true, dataIndex: 'zona'},
                            {header: "provincia", width: 100, sortable: true, dataIndex: 'provincia'},
                            {header: "observaciones", width: 300, sortable: true, dataIndex: 'observaciones'},
                            {header: "secuencia", width: 100, sortable: true, dataIndex: 'secuencia'},
                            {header: "tipoDireccion", width: 100, sortable: true, dataIndex: 'tipoDireccion'},
                            {header: "tipoDomicilio", width: 100, sortable: true, dataIndex: 'tipoDomicilio'},
                            {header: "codPostal", width: 100, sortable: true, dataIndex: 'codPostal'},
                            {header: "Activo", width: 100, sortable: true, dataIndex: 'activo'},
                            {header: "fecha_activo", width: 100, sortable: true, dataIndex: 'fecha_activo'}
                        ],
                        store: store
                    });
                    var form = new Ext.FormPanel({
                        url: Ext.SROOT + 'command/persist/public/persona',
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:5px',
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                layout: 'column',
                                border: false,
                                items: [
                                    {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [
                                            {
                                                xtype: 'textfield',
                                                fieldLabel: 'Nombre',
                                                readOnly: true,
                                                name: 'nombre',
                                                anchor: '95%'
                                            }, {
                                                xtype: 'textfield',
                                                fieldLabel: 'Apellido',
                                                readOnly: true,
                                                name: 'apellido',
                                                anchor: '95%'
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Código',
                                                readOnly: true,
                                                name: 'codigo',
                                                anchor: '95%'
                                            }, {
                                                xtype: 'textfield',
                                                readOnly: true,
                                                fieldLabel: 'CUIT',
                                                name: 'cuit',
                                                anchor: '95%'
                                            }]

                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'IdActor',
                                                readOnly: true,
                                                name: 'id',
                                                anchor: '95%'
                                            }, {
                                                xtype: 'textfield',
                                                fieldLabel: 'Nro. Documento',
                                                readOnly: true,
                                                name: 'numeroDocumento',
                                                anchor: '95%'
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Razon Social',
                                                readOnly: true,
                                                name: 'razonSocial',
                                                anchor: '95%'
                                            }, {
                                                xtype: 'combo',
                                                fieldLabel: 'Sexo',
                                                name: 'sexy',
                                                anchor: '95%',
                                                hiddenName: 'sexo',
                                                forceSelection: true,
                                                store: new Ext.data.ArrayStore({
                                                    fields: ['type', 'objeto'],
                                                    data: [['M', 'Masculino'],
                                                        ['F', 'Femenino'],
                                                        ['N', 'No Informado']
                                                    ]
                                                }),
                                                valueField: 'type',
                                                displayField: 'objeto',
                                                typeAhead: true,
                                                mode: 'local',
                                                readOnly: true,
                                                triggerAction: 'all',
                                                emptyText: '',
                                                selectOnFocus: true
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'combo',
                                                fieldLabel: 'Tipo Persona',
                                                name: 'tipoActor',
                                                anchor: '95%',
                                                hiddenName: 'tipoActor',
                                                forceSelection: true,
                                                store: new Ext.data.ArrayStore({
                                                    fields: ['type', 'objeto'],
                                                    data: [['J', 'Persona Física'],
                                                        ['F', 'Persona Jurídica']
                                                    ]
                                                }),
                                                valueField: 'type',
                                                displayField: 'objeto',
                                                typeAhead: true,
                                                mode: 'local',
                                                readOnly: true,
                                                triggerAction: 'all',
                                                emptyText: '',
                                                selectOnFocus: true
                                            }, {
                                                xtype: 'combo',
                                                fieldLabel: 'Tipo Documento',
                                                name: 'tipoDocumento',
                                                anchor: '95%',
                                                hiddenName: 'tipoDocumento',
                                                forceSelection: true,
                                                store: new Ext.data.ArrayStore({
                                                    fields: ['type', 'objeto'],
                                                    data: [['D', 'DNI'],
                                                        ['F', 'Cédula Federal'],
                                                        ['U', 'Cédula'],
                                                        ['C', 'LC'],
                                                        ['E', 'LE'],
                                                        ['P', 'Pasaporte'],
                                                        ['O', 'Otro'],
                                                        ['N', 'No Informado'],
                                                        ['X', 'Extranjero'],
                                                        ['B', 'Padrón TGI'],
                                                        ['0', 'Sin tipo asignado']
                                                    ]
                                                }),
                                                readOnly: true,
                                                valueField: 'type',
                                                displayField: 'objeto',
                                                typeAhead: true,
                                                mode: 'local',
                                                triggerAction: 'all',
                                                emptyText: '',
                                                selectOnFocus: true
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Fecha Nacimiento',
                                                readOnly: true,
                                                name: 'fechaNacimiento'
                                            }, {
                                                xtype: 'textfield',
                                                fieldLabel: 'Unificados',
                                                readOnly: true,
                                                name: 'unificados',
                                                anchor: '95%'
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Tel. Princial',
                                                readOnly: true,
                                                name: 'telefonoPrincipal',
                                                anchor: '95%'
                                            }]
                                    }, {
                                        columnWidth: .5,
                                        layout: 'form',
                                        border: false,
                                        items: [{
                                                xtype: 'textfield',
                                                fieldLabel: 'Firma Sidom',
                                                readOnly: true,
                                                name: 'firmaSidom',
                                                anchor: '95%'
                                            }]
                                    }]
                            },
                            {
                                xtype: 'textfield',
                                fieldLabel: 'Email',
                                name: 'email',
                                readOnly: true,
                                anchor: '95%'

                            },
                            {
                                xtype: 'tabpanel',
                                plain: true,
                                activeTab: 0,
                                height: 180,
                                deferredRender: false,
                                defaults: {bodyStyle: 'padding:10px'},
                                items: [grid]
                            }]
                    });
                    return form;
                },
                registrarPersona: function (options) {
                    //consulta de direcciones
                    var form = this.registroForm(options);
                    var win = new Ext.Window({
                        title: 'Detalles Persona',
                        autoScroll: true,
                        width: 600,
                        autoHeight: true,
                        minWidth: 550,
                        items: form,
                        maximizable: true,
                        modal: true,
                        buttonAlign: 'center',
                        buttons: [{
                                text: 'Cerrar',
                                handler: function () {
                                    win.close();
                                }
                            }]
                    });
                    win.show();
                    form.getForm().loadRecord(options.record);
                }
            };
            domain.Panel = {
                init: function () {
                    //metodo de la mapa
                    var mapa = new Ext.Panel({
                        region: 'center',
                        title: 'La Mapa',
                        layout: 'fit'
                    });
                    //metodo para el form de busqueda por documento
                    var form = new Ext.FormPanel({
                        frame: true,
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 120,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Nro. Documento',
                                name: 'documento'
                            }],
                        buttons: [{
                                text: "Buscar",
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        if (form.getForm().isValid()) {
                                            var store = new Ext.data.JsonStore({
                                                url: Ext.SROOT + 'simgeisrv/buscarDocumento',
                                                root: 'data',
                                                fields: [
                                                    {name: 'id'},
                                                    {name: 'nombre'},
                                                    {name: 'codigo'},
                                                    {name: 'apellido', mapping: 'apellido'},
                                                    {name: 'cuit'},
                                                    {name: 'numeroDocumento'},
                                                    {name: 'razonSocial'},
                                                    {name: 'sexo'},
                                                    {name: 'tipoActor'},
                                                    {name: 'tipoDocumento'},
                                                    {name: 'email'},
                                                    {name: 'unificados'},
                                                    {name: 'fechaNacimiento'},
                                                    {name: 'telefonoPrincipal'},
                                                    {name: 'firmaSidom'}
                                                ],
                                                autoLoad: true,
                                                baseParams: form.getForm().getValues()
                                            });
                                            var grid = new Ext.grid.GridPanel({
                                                title: 'Resultados',
                                                height: 300,
                                                region: 'center',
                                                loadMask: true,
                                                selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                                                columns: [new Ext.grid.RowNumberer({
                                                        width: 27
                                                    }),
                                                    {header: "Apellido", width: 100, sortable: true, dataIndex: 'apellido'},
                                                    {header: "Nombre", width: 100, sortable: true, dataIndex: 'nombre'},
                                                    {header: "Código", width: 100, sortable: true, dataIndex: 'codigo'},
                                                    {header: "Cuit", width: 100, sortable: true, dataIndex: 'cuit'},
                                                    {header: "Id", width: 100, sortable: true, dataIndex: 'id'},
                                                    {header: "Nro. Documento", width: 100, sortable: true, dataIndex: 'numeroDocumento'},
                                                    {header: "Razon Social", width: 100, sortable: true, dataIndex: 'razonSocial'},
                                                    {header: "Sexo", width: 100, sortable: true, dataIndex: 'sexo'},
                                                    {header: "Tipo Persona", width: 100, sortable: true, dataIndex: 'tipoActor'},
                                                    {header: "Tipo Documento", width: 100, sortable: true, dataIndex: 'tipoDocumento'},
                                                    {header: "Email", width: 100, sortable: true, dataIndex: 'email'},
                                                    {header: "Unificado", width: 100, sortable: true, dataIndex: 'unificados'},
                                                    {header: "Fecha Nacimiento", width: 100, sortable: true, dataIndex: 'fechaNacimiento'}

                                                ],
                                                store: store,
                                                tbar: [{
                                                        text: 'Detalles',
                                                        iconCls: 'create',
                                                        tooltip: 'Detalles de una persona',
                                                        handler: function () {
                                                            var record = grid.getSelectionModel().getSelected();
                                                            if (record) {
                                                                domain.functions.registrarPersona({
                                                                    grid: grid,
                                                                    record: record
                                                                });
                                                            } else {
                                                                Ext.MessageBox.show({
                                                                    title: 'Aviso',
                                                                    msg: 'Debe seleccionar un <b>Registro</b>.',
                                                                    buttons: Ext.MessageBox.OK,
                                                                    icon: Ext.Msg.INFO
                                                                });
                                                            }
                                                        }
                                                    }]
                                            });
                                            tabElemPorDocumento.remove(1);
                                            tabElemPorDocumento.add(grid);
                                            tabElemPorDocumento.doLayout();
                                        }
                                    }
                                }
                            }]
                    });
                    //metodo para la definicion del contenido de busqueda por ID
                    var formSearchID = new Ext.FormPanel({
                        frame: true,
                        url: Ext.SROOT + 'simgeisrv/buscarid',
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 120,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'numberfield',
                                fieldLabel: 'ID persona',
                                name: 'id'
                            }],
                        buttons: [{
                                text: "Buscar",
                                handler: function () {
                                    if (formSearchID.getForm().isValid()) {
                                        formSearchID.getForm().submit({
                                            success: function (form, action) {
                                                var data = action.result.data;
                                                var record = {data: data};

                                                var form = domain.functions.registroForm({record: record});
                                                tabElemPorID.add(form);
                                                tabElemPorID.doLayout();
                                                form.getForm().setValues(data);
                                            },
                                            failure: function (form, action) {
                                                //domain.errors.submitFailure('Error', 'Error en los datos del formularo.<br/>' + action.result.message);
                                            }
                                        });
                                    } else {
                                        //domain.errors.submitFailure('Error', 'Error en los datos del formularo.');
                                    }

                                }
                            }]
                    });
                    //Busqueda de actores unificados
                    var formSearchUnificado = new Ext.FormPanel({
                        frame: true,
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 120,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'ID Persona',
                                name: 'id'
                            }],
                        buttons: [{
                                text: "Buscar",
                                handler: function () {
                                    if (formSearchUnificado.getForm().isValid()) {
                                        if (formSearchUnificado.getForm().isValid()) {
                                            var store = new Ext.data.JsonStore({
                                                url: Ext.SROOT + 'simgeisrv/buscarunificado',
                                                root: 'data',
                                                fields: [
                                                    {name: 'id'},
                                                    {name: 'codigo'}
                                                ],
                                                autoLoad: true,
                                                baseParams: formSearchUnificado.getForm().getValues()
                                            });
                                            var grid = new Ext.grid.GridPanel({
                                                title: 'Resultados',
                                                height: 300,
                                                region: 'center',
                                                loadMask: true,
                                                selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                                                columns: [new Ext.grid.RowNumberer({
                                                        width: 27
                                                    }),
                                                    {header: "ID", width: 100, sortable: true, dataIndex: 'id'},
                                                    {header: "Código", width: 100, sortable: true, dataIndex: 'codigo'}
                                                ],
                                                store: store,
                                                tbar: [{
                                                        text: 'Detalles',
                                                        iconCls: 'create',
                                                        tooltip: 'Detalles de una persona',
                                                        handler: function () {
                                                            var record = grid.getSelectionModel().getSelected();
                                                            if (record) {
                                                                domain.Tools.deleteProduct({
                                                                    grid: grid,
                                                                    record: record
                                                                });
                                                            } else {
                                                                Ext.MessageBox.show({
                                                                    title: 'Aviso',
                                                                    msg: 'Debe seleccionar un <b>Registro</b>.',
                                                                    buttons: Ext.MessageBox.OK,
                                                                    icon: Ext.Msg.INFO
                                                                });
                                                            }

                                                        }
                                                    }]
                                            });
                                            tabElemUnificados.remove(1);
                                            tabElemUnificados.add(grid);
                                            tabElemUnificados.doLayout();
                                        }
                                    }
                                }
                            }]
                    });
                    //metodo para la definicion del contenido de busqueda por ID
                    var tabElemPorID = new Ext.Panel(
                            {
                                title: 'Por ID',
                                items: [formSearchID]
                            }
                    );
                    var tabElemPorDocumento = new Ext.Panel(
                            {
                                title: 'Por Documento',
                                items: [form]
                            }
                    );
                    var tabElemUnificados = new Ext.Panel(
                            {
                                title: 'Unificados',
                                items: [formSearchUnificado]
                            }
                    );
                    var tabElemAvanzada = new Ext.Panel(
                            {
                                title: 'Avanzada',
                                autoScroll: true,
                                items: [domain.objects.busquedaAvanzadaForm({tabElemAvanzada: tabElemAvanzada})]
                            }
                    );
                    this.tabElemAvanzada = tabElemAvanzada;
                    var tabMain = new Ext.TabPanel({
                        activeTab: 0,
                        items: [{
                                title: 'Busqueda',
                                closable: false,
                                layout: 'border',
                                items: [{
                                        frame: true,
                                        border: false,
                                        region: 'north',
                                        height: 60,
                                        bodyStyle: 'padding:5px',
                                        contentEl: 'info-documentation'
                                    }, {
                                        xtype: 'tabpanel',
                                        border: false,
                                        region: 'center',
                                        activeTab: 0,
                                        items: [tabElemPorDocumento, tabElemPorID, tabElemUnificados, tabElemAvanzada]
                                    }]
                            }, {
                                title: 'Ficha Catastral'
                            }, {
                                title: 'Tramites'
                            }, {
                                title: 'Capas'
                            }]
                    });
                    //panel informacion catastral
                    var panelRigth = new Ext.Panel({
                        title: 'Gestión Catastral',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 650,
                        layout: 'fit',
                        autoScroll: true,
                        items: [tabMain]
                    });
                    new Ext.Viewport({
                        layout: 'border',
                        items: [mapa, panelRigth]
                    });
                }
            };
            Ext.onReady(domain.Panel.init, domain.Panel);
        </script> 
    </head>
    <body>      

        <div id="info-documentation">
            <h2>Busqueda de Predios</h2>

            <p class="details-info">
                Esta herramienta le permite lozalizar un Predio o Parcela para su actualizacion o cunsulta.
            </p>
        </div>        
    </body>
</html>

