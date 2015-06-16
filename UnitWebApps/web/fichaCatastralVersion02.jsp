<%-- 
    Document   : fichaCatastralVersion03
    Created on : 19-05-2015, 11:39:29 AM
    Author     : RubenQuintin
--%>
<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ficha Catastral v.02</title>

        <%@include file="ExtJSScripts-ES.jsp"%>   
        <script type="text/javascript">
            /**
             * @author Ruben Huanacuni / rhuanacuni
             * @class 
             * @extends 
             * @constructor
             * @param
             * @version 0.2.0
             * Ficha Catastral
             */

            Ext.ns('domain');
            domain.dummyData = {
            };
            domain.objects = {
                /*Campos para formulario de Identificacion parcela*/
                identificacionParcelaFields: [{
                        layout: 'column',
                        items: [{
                                columnWidth: .5,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Código catastral',
                                        name: 'codigocatastral'
                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Nro. parcela',
                                        name: 'nro_parcela'
                                    }, {
                                        xtype: 'compositefield',
                                        fieldLabel: 'Superficie',
                                        //anchor: '-20',
                                        defaults: {
                                            //flex: 1
                                        },
                                        items: [{
                                                xtype: 'textfield',
                                                name: 'superficie'
                                            }, {
                                                xtype: 'displayfield',
                                                value: 'm2'
                                            }]
                                    }]
                            }, {
                                columnWidth: .5,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Padron vigente',
                                        name: 'padron_vigente'
                                    }, {
                                        xtype: 'combo',
                                        fieldLabel: 'Tipo predio',
                                        name: 'tipo_predio'
                                    }]
                            }]
                    }],
                /*Campos para formulario de Direccion parcela*/
                direccionParcelaFields: [{
                        xtype: 'textfield',
                        fieldLabel: 'Nombre de calle',
                        name: 'calle',
                        readOnly: true,
                        msgTarget: 'side',
                        anchor: '93%'
                    }, {
                        layout: 'column',
                        items: [{
                                columnWidth: .25,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Nro. piso',
                                        name: 'nro_piso',
                                        anchor: '95%'
                                    }]
                            }, {
                                columnWidth: .25,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Nro. departamento',
                                        name: 'nro_departamento',
                                        anchor: '95%'
                                    }]
                            }, {
                                columnWidth: .25,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Zona',
                                        name: 'zona',
                                        anchor: '95%'
                                    }]
                            }, {
                                columnWidth: .25,
                                layout: 'form',
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Nro. portal',
                                        name: 'nro_portal',
                                        anchor: '95%'
                                    }]
                            }]
                    }],
                /* Datos de Propietarios o titulares */
                gridPropietarios: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Jose Barabato Porcasi', 'Persona física', 'Si', 'DNI', '1234567', 'Masculino'],
                        ['Quiroga ASOCIADOS', 'Persona jurídica', 'No', 'LC', '7654321', ' '],
                        ['Patricia Terrazas', 'Persona física', 'Si', 'DNI', '7777777', 'Femenino']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'propietario'},
                            {name: 'tipoTitular'},
                            {name: 'representante'},
                            {name: 'tipo_documento'},
                            {name: 'nro_documento'},
                            {name: 'sexo'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridPropietarios = new Ext.grid.GridPanel({
                        title: 'Datos de propietario o titular',
                        autoHeight: true,
                        collapsible: true,
                        titleCollapse: true,
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Nombre completo o razón social titular", width: 300, sortable: true, dataIndex: 'propietario'},
                            {header: "Tipo titular", width: 120, sortable: true, dataIndex: 'tipoTitular'},
                            {header: "Representante", width: 80, sortable: true, dataIndex: 'representante'},
                            {header: "Tipo documento", width: 80, sortable: true, dataIndex: 'tipo_documento'},
                            {header: "Nro. Documento", width: 90, sortable: true, dataIndex: 'nro_documento'},
                            {header: "Sexo", width: 90, sortable: true, dataIndex: 'sexo'}
                        ],
                        stripeRows: true,
                        store: store
                    });
                    return gridPropietarios;
                },
                //Grilla de Datos de Titularidad 
                gridDatosTitularidad: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Jose Barabato Porcasi', 'Natural', 'Si', 'DNI', '1234567', 'PRIVADO', '12/03/1982', '60', 'DECLARATORIA DE HEREDEROS', '1', '8', '0012', '1', 'RES 03/2003', 'DECLARATORIA DEL HEREDEROS - RESOL. JUEZ'],
                        ['Quiroga ASOCIADOS', 'Jurídica', 'No', 'LC', '7654321', 'PUBLICO', '11/03/1989', '30', 'COMPRA-VENTA', '2', '5', '0125', '6', 'RES 11/2011', 'BOLETO DE COMPRA Y VENTA'],
                        ['Patricia Terrazas', 'Natural', 'Si', 'DNI', '7777777', 'PRIVADO', '17/09/2014', '10', 'PARTICION', '3', '12', '888', '2', 'RES 28/2014', 'ESCRITURA O FICHA REGISTRAL']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'propietario'},
                            {name: 'tipo_titular'},
                            {name: 'representante'},
                            {name: 'tipo_documento'},
                            {name: 'nro_documento'},
                            {name: 'tipo_titularidad'},
                            {name: 'fecha_adquisicion'},
                            {name: 'porcentaje'},
                            {name: 'forma_adquisicion'},
                            {name: 'tomo'},
                            {name: 'folio'},
                            {name: 'nro_inscripcion'},
                            {name: 'folio_real'},
                            {name: 'resolucion'},
                            {name: 'juridica'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridDatosTitularidad = new Ext.grid.GridPanel({
                        //title: 'Datos de propietario o titular',
                        //autoHeight: true,
                        //collapsible: true,
                        //titleCollapse: true,
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Nombre completo o razón social titular", width: 300, sortable: true, dataIndex: 'propietario'},
                            {header: "Tipo titular", width: 80, sortable: true, dataIndex: 'tipo_titular'},
                            {header: "Representante", width: 80, sortable: true, dataIndex: 'representante'},
                            {header: "Tipo documento", width: 80, sortable: true, dataIndex: 'tipo_documento'},
                            {header: "Nro. Documento", width: 90, sortable: true, dataIndex: 'nro_documento'},
                            {header: "% Tenencia", width: 90, sortable: true, dataIndex: 'porcentaje'}
                        ],
                        stripeRows: true,
                        store: store,
                        tbar: [{
                                text: 'Detalles...',
                                iconCls: 'user',
                                handler: function () {
                                    var record = gridDatosTitularidad.getSelectionModel().getSelected();
                                    if (record) {
                                        domain.functions.titularDetails({
                                            record: record
                                        });
                                    } else {
                                        com.icg.errors.mustSelect();
                                    }
                                }
                            }]
                    });
                    return gridDatosTitularidad;
                },
                /*Grilla para Padrones anteriores*/
                gridPadronesAnteriores: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Padron 01'],
                        ['Padron 02'],
                        ['Padron 03'],
                        ['Padron 04']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'padron_anterior'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridPadronesAnteriores = new Ext.grid.GridPanel({
                        //title: 'Padrón(es) anterior(es)',
                        //region: 'center',
                        //collapsible: true,                        
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Padrón(es) anterior(es)", width: 350, sortable: true, dataIndex: 'padron_anterior'}
                        ],
                        stripeRows: true,
                        //height: 250,
                        autoHeight: true,
                        //width: 600,
                        autoWidth: true,
                        store: store
                    });
                    return gridPadronesAnteriores;
                },
                /*Campos para formulario de Datos de Ubicación parcela*/
                ubicacionParcelaFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Coordenada eje X',
                                            name: 'coordenada_x',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Coordenada eje Y',
                                            name: 'coordenada_y',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. parcela provincial',
                                            name: 'nro_parcel_prov',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. partida provincial',
                                            name: 'nro_partida_prov',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. manzana',
                                            name: 'nro_manzana',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. parcela',
                                            name: 'nro_parcela',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. subparcela',
                                            name: 'nro_subparcela',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. unidad',
                                            name: 'nro_unidad',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nombre calle',
                                            name: 'nombre_calle',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. portal',
                                            name: 'nro_portal',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Codigo calle sin nomenclador',
                                            name: 'cod_calle_scomenclador',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Codigo calle ordenanza nueva',
                                            name: 'cod_calle_ordenanza',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. piso',
                                            name: 'nro_piso',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. departamento',
                                            name: 'nro_departamento',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Padrón vigente',
                                            name: 'padron_vigente',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [domain.objects.gridPadronesAnteriores({})
                                    ]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Centro de distrito al que pertenece',
                                            name: 'centro_distrito',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Distrito ROU',
                                            name: 'distrito_rou',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Vecinal',
                                            name: 'vecinal',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                ubicacionParcelaForm: function (options) {

                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.ubicacionParcelaFields(options)
                    });
                    return form;
                },
                parcelaFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. plano mensura',
                                            name: 'nro_plano_mensura',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. lote plano mensura',
                                            name: 'nro_lote_mensura',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha del plano',
                                            name: 'fecha_plano',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Visado mensura o Certificado de límite',
                                            name: 'visado_mensura',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha visado',
                                            name: 'fecha_visado',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Tipo regimen',
                                            name: 'tipo_regimen',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Esquina',
                                            name: 'esquina',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Interno',
                                            name: 'interno',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Tipo pasillo',
                                            name: 'tipo_pasillo',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Salida mas de una calle',
                                            name: 'salida_calle',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nivel',
                                            name: 'nivel',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                parcelaForm: function (options) {

                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.parcelaFields(options)
                    });
                    return form;
                },
                datosFisicosMensuraFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie',
                                            name: 'superficie_m',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida frente',
                                            name: 'frente_m',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida contrafrente',
                                            name: 'contrafrente_m',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado derecho',
                                            name: 'lado_derecho_m',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado izquierdo',
                                            name: 'lado_izquierdo_m',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .50,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la acera frente al lote según mensura',
                                            name: 'ancho_acera_mensura',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .50,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la calzada frente al lote según mensura',
                                            name: 'ancho_calzada_mensura',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosMensuraForm: function (options) {
                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.datosFisicosMensuraFields(options)
                    });
                    return form;
                },
                datosFisicosEscrituraFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie',
                                            name: 'superficie_e',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medica frente',
                                            name: 'frente_e',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida contrafrente',
                                            name: 'contrafrente_e',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado derecho',
                                            name: 'lado_derecho_e',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado izquierdo',
                                            name: 'lado_izquierdo_e',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosEscrituraForm: function (options) {
                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.datosFisicosEscrituraFields(options)
                    });
                    return form;
                },
                datosFisicosCampoFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la acera frente al lote según mensura',
                                            name: 'ancho_acera_m',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la calzada frente al lote según mensura',
                                            name: 'ancho_calzada_m',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'En línea',
                                            name: 'linea',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Cinta verde',
                                            name: 'cinta_verde',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Arbol frente parcela',
                                            name: 'arbol',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Cesto reglamentario',
                                            name: 'cesto',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha relevado',
                                            name: 'fecha_relevado',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosCampoForm: function (options) {
                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.datosFisicosCampoFields(options)
                    });
                    return form;
                },
                restricionesDominioFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Afectada ensanche de calle',
                                            name: 'afectada_ensanche_calle',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Número ordenanza',
                                            name: 'nro_ordenanza',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha ordenanza',
                                            name: 'fecha_ordenanza',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación',
                                            name: 'metros_lineales_afectacion',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie afectada',
                                            name: 'superficie_afectada',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Fondos de manzana',
                                            name: 'fondo_manzana',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación - fondo de manzana',
                                            name: 'fondo_manzana_afectacion',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Ochava reglamentaria',
                                            name: 'ochava_reglamentaria',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales ochava',
                                            name: 'metros_lineales_ochava',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                restricionesDominioForm: function (options) {
                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.restricionesDominioFields(options)
                    });
                    return form;
                },
                serviciosParcelaFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Energía eléctrica',
                                            name: 'energia_electrica',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'combo',
                                            fieldLabel: 'Cloacas',
                                            name: 'cloacas',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Agua potable',
                                            name: 'agua_potable',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'combo',
                                            fieldLabel: 'Recolección de residuos',
                                            name: 'recoleccion_residuos',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Gas',
                                            name: 'gas',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'combo',
                                            fieldLabel: 'Tipo calzada',
                                            name: 'tipo_calzada',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'combo',
                                            fieldLabel: 'Alumbrado público',
                                            name: 'alumbrado_publico',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                serviciosParcelaForm: function (options) {
                    var form = new Ext.Panel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            labelAlign: 'top'
                        },
                        items: this.serviciosParcelaFields(options)
                    });
                    return form;
                },
                valuacionFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Zona inmobiliaria',
                                            name: 'zona_inmobiliaria',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor m2 terreno en zona',
                                            name: 'valor_terreno_zona',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor inmobiliario muni.',
                                            name: 'valor_municipal',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Tipo valuación',
                                            name: 'tipo_valuacion',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor del terreno',
                                            name: 'valor_terreno',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Coef. infraestructura serv.',
                                            name: 'coef_infraestructura',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha desde',
                                            name: 'fecha_desde',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor m2 de edificación',
                                            name: 'valor_metro_edificacion',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor catastral municipal',
                                            name: 'valor_catastral_municipal',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha hasta',
                                            name: 'fecha_hasta',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    defaults: {
                                        anchor: '95%',
                                        readOnly: true,
                                        msgTarget: 'side'
                                    },
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Valor mejora edificada',
                                            name: 'valor_mejora_edificada',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Avalúo fiscal municipal',
                                            name: 'avaluo_fiscal_municipal',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Categoría',
                                            name: 'categoria',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                valuacionForm: function (options) {
                    var form = new Ext.FormPanel({
                        labelAlign: 'top',
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.valuacionFields(options)
                    });
                    return form;
                },
                gridEdificaciones: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Edificación 01', 'No', 'POR INSPECCION', '11111111', 'RESIDENCIAL', 'VIVIENDA UNIFAMILIAR', '10,00', '20,00', '30,00', '40,00', '50,00', '60,00', '15,00', '25,00', '35,00', '45,00'],
                        ['Edificación 02', 'No', 'POR INSPECCION', '22222222', 'INSTITUCIONAL', 'CLINICA', '10,00', '20,00', '30,00', '40,00', '50,00', '60,00', '15,00', '25,00', '35,00', '45,00'],
                        ['Edificación 03', 'No', 'OTRO', '33333333', 'COMERCIALES', 'DEPOSITOS', '10,00', '20,00', '30,00', '40,00', '50,00', '60,00', '15,00', '25,00', '35,00', '45,00'],
                        ['Edificación 04', 'Si', 'LEGAJO DE DEMOLICIÓN', '4444444', 'RESIDENCIAL', 'VIVIENDA COLECTIVA', '10,00', '20,00', '30,00', '40,00', '50,00', '60,00', '15,00', '25,00', '35,00', '45,00']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'edificacion'},
                            {name: 'baldio'},
                            {name: 'deteccion_baldio'},
                            {name: 'nro_legajo_obra'},
                            {name: 'destino'},
                            {name: 'tipo_destino'},
                            {name: 'superficie_cubierta'},
                            {name: 'superficie_semicubierta'},
                            {name: 'superficie_piscina'},
                            {name: 'rec_superficie_cubierta'},
                            {name: 'rec_superficie_semicubierta'},
                            {name: 'rec_piscina'},
                            {name: 'superficie_cubierta_sp'},
                            {name: 'superficie_semicubierta_sp'},
                            {name: 'superficie_piscina_sp'},
                            {name: 'demolicion_sp'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridEdificaciones = new Ext.grid.GridPanel({
                        title: 'Edificaciones',
                        collapsed: true,
                        autoHeight: true,
                        collapsible: true,
                        titleCollapse: true,
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Edificación", width: 200, sortable: true, dataIndex: 'edificacion'},
                            {header: "Baldío", width: 80, sortable: true, dataIndex: 'baldio'},
                            {header: "Detección de baldío", width: 120, sortable: true, dataIndex: 'deteccion_baldio'},
                            {header: "Nro. Legajo de obra", width: 190, sortable: true, dataIndex: 'nro_legajo_obra'},
                            {header: "Destino", width: 80, sortable: true, dataIndex: 'destino'},
                            {header: "Tipo destino", width: 80, sortable: true, dataIndex: 'tipo_destino'}
                        ],
                        stripeRows: true,
                        store: store,
                        tbar: [{
                                text: 'Detalles...',
                                iconCls: 'user',
                                handler: function () {
                                    var record = gridEdificaciones.getSelectionModel().getSelected();
                                    if (record) {
                                        domain.functions.edificacionDetails({
                                            record: record
                                        });
                                    } else {
                                        com.icg.errors.mustSelect();
                                    }
                                }
                            }]
                    });
                    return gridEdificaciones;
                },
                gridExpedientes: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Expediente 01', 'Nombre documento 01'],
                        ['Expediente 02', 'Nombre documento 02'],
                        ['Expediente 03', 'Nombre documento 03'],
                        ['Expediente 04', 'Nombre documento 04'],
                        ['Expediente 05', 'Nombre documento 05'],
                        ['Expediente 06', 'Nombre documento 06'],
                        ['Expediente 07', 'Nombre documento 07'],
                        ['Expediente 08', 'Nombre documento 08']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'expediente'},
                            {name: 'documento'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridExpedientes = new Ext.grid.GridPanel({
                        //title: 'Propietarios',
                        //region: 'center',
                        //collapsible: true,                        
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Expediente", width: 200, sortable: true, dataIndex: 'expediente'},
                            {header: "Documento", width: 200, sortable: true, dataIndex: 'documento'}
                        ],
                        stripeRows: true,
                        //height: 250,
                        autoHeight: true,
                        //width: 600,
                        autoWidth: true,
                        store: store
                    });
                    return gridExpedientes;
                },
                gridVigencias: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Vigencia 01', '12/03/2003', '17/09/2014'],
                        ['Vigencia 02', '17/09/2014', '31/12/2014'],
                        ['Vigencia 03', '31/12/2014', '01/05/2015'],
                        ['Vigencia 04', '01/05/2015', ' ']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'vigencia'},
                            {name: 'fecha_alta'},
                            {name: 'fecha_baja'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridVigencias = new Ext.grid.GridPanel({
                        //title: 'Propietarios',
                        //region: 'center',
                        //collapsible: true,                        
                        loadMask: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Vigencia", width: 200, sortable: true, dataIndex: 'vigencia'},
                            {header: "Fecha de alta padrón", width: 150, sortable: true, dataIndex: 'fecha_alta'},
                            {header: "Fecha de baja padrón", width: 150, sortable: true, dataIndex: 'fecha_baja'}
                        ],
                        stripeRows: true,
                        //height: 250,
                        autoHeight: true,
                        //width: 600,
                        autoWidth: true,
                        store: store
                    });
                    return gridVigencias;
                },
                gridObservaciones: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Completar datos faltantes', 'En la migración de información a la nueva base de datos del Sitmax se evidenció la falta de datos en algunos campos obligatorios.', '01/02/2014'],
                        ['Mensura errónea', 'Se evidencia el intervalo de medidas muy alejado de lo permitidoy establecido.', '12/03/2015'],
                        ['Ficha sin fotografía', 'Se debe actualizar la fotografía de la parcela.', '16/06/2015']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'titulo_observacion'},
                            {name: 'observacion'},
                            {name: 'fecha_observacion'}
                        ]
                    });
                    store.loadData(myData);
                    //Creando el objeto Ext.grid.GridPanel
                    var gridObservaciones = new Ext.grid.GridPanel({
                        loadMask: true,
                        autoHeight: true,
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Observación", width: 300, sortable: true, dataIndex: 'titulo_observacion'},
                            {header: "Fecha", width: 80, sortable: true, dataIndex: 'fecha_observacion'}
                        ],
                        stripeRows: true,
                        store: store,
                        tbar: [{
                                text: 'Detalles...',
                                iconCls: 'user',
                                handler: function () {
                                    var record = gridObservaciones.getSelectionModel().getSelected();
                                    if (record) {
                                        domain.functions.observacionDetails({
                                            record: record
                                        });
                                    } else {
                                        com.icg.errors.mustSelect();
                                    }
                                }
                            }]
                    });
                    return gridObservaciones;
                },
                observacionesFields: function (options) {
                    return [{
                            xtype: 'textarea',
                            fieldLabel: 'Observaciones',
                            name: 'OBSERVACIONES',
                            readOnly: true,
                            anchor: '100% - 53'
                        }];
                },
                observacionesForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        items: this.observacionesFields(options)
                    });
                    return form;
                },
                unidadCatastral: function (options) {
                    var tabPanel = {
                        border: false,
                        anchor: '100%',
                        items: [{
                                xtype: 'tabpanel',
                                activeTab: 0,
                                autoHeight: true,
                                items: [{
                                        title: 'Datos grales. de titularidad',
                                        items: [domain.objects.gridDatosTitularidad({})
                                        ]
                                    }, {
                                        title: 'Datos de ubicación',
                                        items: [domain.objects.ubicacionParcelaForm({})
                                        ]
                                    }, {
                                        title: 'Datos grales. parcela',
                                        items: [domain.objects.parcelaForm({})
                                        ]
                                    }, {
                                        title: 'Datos físicos',
                                        xtype: 'tabpanel',
                                        bodyStyle: 'padding:10x;',
                                        border: false,
                                        autoHeight: true,
                                        region: 'center',
                                        activeTab: 0,
                                        items: [{
                                                title: 'Según mensura',
                                                items: [domain.objects.datosFisicosMensuraForm({})
                                                ]
                                            }, {
                                                title: 'Según escritura',
                                                items: [domain.objects.datosFisicosEscrituraForm({})
                                                ]
                                            }, {
                                                title: 'En campo',
                                                items: [domain.objects.datosFisicosCampoForm({})
                                                ]
                                            }]
                                    }, {
                                        title: 'Restricciones dominio',
                                        items: [domain.objects.restricionesDominioForm({})
                                        ]
                                    }, {
                                        title: 'Servicios en la parcela',
                                        items: [domain.objects.serviciosParcelaForm({})
                                        ]
                                    }]

                            }]
                    };
                    return tabPanel;
                },
                informacionAdicional: function (options) {
                    var o = {
                        xtype: 'panel',
                        layout: 'fit',
                        title: 'Información adicional',
                        collapsed: true,
                        autoHeight: true,
                        border: false,
                        collapsible: true,
                        titleCollapse: true,
                        items: [{
                                xtype: 'tabpanel',
                                bodyStyle: 'padding:10x;',
                                border: false,
                                region: 'center',
                                activeTab: 0,
                                items: [{
                                        title: 'Fotografía parcela',
                                        items: [
                                            {html: '<img src="frente-casa.jpg" height="800" width="800" />'}
                                        ]
                                    }, {
                                        title: 'Plano mensura',
                                        items: [
                                            {html: '<img src="plano-mensura.jpg" height="800" width="800" />'}
                                        ]
                                    }, {
                                        title: 'Fichas Catastrales',
                                        items: [
                                            {html: '<img src="ficha-catastral.jpg" height="800" width="800" />'}
                                        ]
                                    }, {
                                        title: 'Expedientes asociados',
                                        items: [domain.objects.gridExpedientes({})
                                        ]
                                    }, {
                                        title: 'Vigencias',
                                        items: [domain.objects.gridVigencias({})
                                        ]
                                    }, {
                                        title: 'Observaciones',
                                        items: [domain.objects.gridObservaciones({})
                                        ]
                                    }]
                            }]
                    };
                    return o;
                }
            };
            domain.functions = {
                buildViewForm: function (options) {
                    var o = {
                        title: options.title,
                        titleCollapse: true,
                        collapsed: true,
                        border: false,
                        collapsible: true,
                        labelAlign: options.labelAlign,
                        frame: true,
                        autoHeight: true,
                        bodyStyle: options.bodyStyle,
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: options.fields
                    };
                    return o;
                },
                titularDetails: function (options) {
                    console.log(options.record);
                    var form = new Ext.FormPanel({
                        frame: true,
                        //url: Ext.SROOT + 'guardarusuario',
                        border: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 130,
                        defaults: {
                            anchor: '95%',
                            readOnly: true,
                            msgTarget: 'side'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Nombre completo o Razón social titular',
                                name: 'propietario'

                            }, {
                                xtype: 'combo',
                                fieldLabel: 'Tipo titular',
                                name: 'tipo_titular'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Representante',
                                name: 'representante'

                            }, {
                                xtype: 'combo',
                                fieldLabel: 'Tipo de documento',
                                name: 'tipo_documento'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Nro. de documento',
                                name: 'nro_documento'

                            }, {
                                xtype: 'combo',
                                fieldLabel: 'Tipo de titularidad',
                                name: 'tipo_titularidad'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Fecha de adquisición',
                                name: 'fecha_adquisicion'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Porcentaje de tenencia',
                                name: 'porcentaje'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Forma de adquisición',
                                name: 'forma_adquisicion'

                            }, {
                                xtype: 'fieldset',
                                title: 'Documentación de titularidad 1',
                                collapsible: true,
                                collapsed: true,
                                autoHeight: true,
                                defaults: {
                                    width: 210,
                                    readOnly: true
                                },
                                defaultType: 'textfield',
                                items: [{
                                        fieldLabel: 'Tomo',
                                        name: 'tomo'
                                    }, {
                                        fieldLabel: 'Folio',
                                        name: 'folio'
                                    }, {
                                        fieldLabel: 'Nro. inscripción',
                                        name: 'nro_inscripcion'
                                    }
                                ]
                            }, {
                                xtype: 'fieldset',
                                title: 'Documentación de titularidad 2',
                                collapsible: true,
                                collapsed: true,
                                autoHeight: true,
                                defaults: {
                                    width: 210,
                                    readOnly: true
                                },
                                defaultType: 'textfield',
                                items: [{
                                        fieldLabel: 'Folio real',
                                        name: 'folio_real'
                                    }
                                ]
                            }, {
                                xtype: 'fieldset',
                                title: 'Documentación de titularidad 3',
                                collapsible: true,
                                collapsed: true,
                                autoHeight: true,
                                defaults: {
                                    width: 210,
                                    readOnly: true
                                },
                                defaultType: 'textfield',
                                items: [{
                                        fieldLabel: 'Resolución',
                                        name: 'resolucion'
                                    }
                                ]
                            }, {
                                xtype: 'combo',
                                fieldLabel: 'Documentación jurídica relacionada',
                                name: 'juridica'
                            }, {
                                xtype: 'hidden',
                                fieldLabel: '',
                                name: 'id'
                            }
                        ]
                    });
                    var win = new Ext.Window({
                        title: 'Detalle Propietario',
                        autoScroll: true,
                        width: 600,
                        height: 450,
                        minHeight: 250,
                        minWidth: 550,
                        items: form,
                        maximizable: true,
                        modal: true,
                        buttonAlign: 'center'
                    });
                    win.show();
                    if (options.record) {
                        form.getForm().loadRecord(options.record);
                    }
                },
                edificacionDetails: function (options) {
                    console.log(options.record);
                    var form = new Ext.FormPanel({
                        //url: Ext.SROOT + 'guardarusuario',
                        frame: true,
                        border: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 130,
                        defaults: {
                            anchor: '95%',
                            readOnly: true,
                            msgTarget: 'side'
                        },
                        items: [{
                                xtype: 'fieldset',
                                title: 'Datos de edificación',
                                collapsible: true,
                                autoHeight: true,
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                defaultType: 'textfield',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Edificación',
                                        name: 'edificacion'

                                    }, {
                                        xtype: 'combo',
                                        fieldLabel: 'Baldío',
                                        name: 'baldio'

                                    }, {
                                        xtype: 'combo',
                                        fieldLabel: 'Detección de baldío',
                                        name: 'deteccion_baldio'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Nro. de Legajo de obra',
                                        name: 'nro_legajo_obra'

                                    }, {
                                        xtype: 'combo',
                                        fieldLabel: 'Destino',
                                        name: 'destino'

                                    }, {
                                        xtype: 'combo',
                                        fieldLabel: 'Tipo destino',
                                        name: 'tipo_destino'

                                    }
                                ]
                            }, {
                                xtype: 'fieldset',
                                title: 'Antecedentes de la edificación',
                                collapsible: true,
                                autoHeight: true,
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                defaultType: 'textfield',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie cubierta según último legajo aprobado',
                                        name: 'superficie_cubierta'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie semi-cubierta según último legajo aprobado',
                                        name: 'superficie_semicubierta'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie piscina según último legajo aprobado',
                                        name: 'superficie_piscina'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Reconocimiento de superficie cubierta',
                                        name: 'rec_superficie_cubierta'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Reconocimiento de superficie semi-cubierta',
                                        name: 'rec_superficie_semicubierta'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Reconocimiento de piscina',
                                        name: 'rec_piscina'

                                    }
                                ]
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Superficie total con antecedentes',
                                value: '210,00',
                                name: 'superficie_total_antecedentes'

                            }, {
                                xtype: 'fieldset',
                                title: 'Antecedentes de la edificación sin permiso',
                                collapsible: true,
                                autoHeight: true,
                                defaults: {
                                    anchor: '95%',
                                    readOnly: true,
                                    msgTarget: 'side'
                                },
                                defaultType: 'textfield',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie cubierta sin permiso',
                                        name: 'superficie_cubierta_sp'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie semi-cubierta sin permiso',
                                        name: 'superficie_semicubierta_sp'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie piscina sin permiso',
                                        name: 'superficie_piscina_sp'

                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Demolición sin permiso',
                                        name: 'demolicion_sp'

                                    }
                                ]
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Superficie total sin permiso',
                                value: '120,00',
                                name: 'superficie_total_sp'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Superficie total',
                                value: '330,00',
                                name: 'superficie_total'

                            }, {
                                xtype: 'hidden',
                                name: 'id'
                            }
                        ]
                    });
                    var win = new Ext.Window({
                        title: 'Detalles de la edificación',
                        autoScroll: true,
                        width: 600,
                        height: 500,
                        minHeight: 250,
                        minWidth: 550,
                        items: form,
                        maximizable: true,
                        modal: true,
                        buttonAlign: 'center'
                    });
                    win.show();
                    if (options.record) {
                        form.getForm().loadRecord(options.record);
                    }
                },
                observacionDetails: function (options) {
                    console.log(options.record);
                    var form = new Ext.FormPanel({
                        frame: true,
                        //url: Ext.SROOT + 'guardarusuario',
                        border: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 130,
                        defaults: {
                            anchor: '95%',
                            readOnly: true,
                            msgTarget: 'side'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Título observación',
                                name: 'titulo_observacion'

                            }, {
                                xtype: 'textarea',
                                fieldLabel: 'Observacion',
                                name: 'observacion'

                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Fecha observacion',
                                name: 'fecha_observacion'
                            }
                        ]
                    });
                    var win = new Ext.Window({
                        title: 'Detalle observación',
                        autoScroll: true,
                        width: 600,
                        height: 200,
                        minHeight: 250,
                        minWidth: 550,
                        items: form,
                        maximizable: true,
                        modal: true,
                        buttonAlign: 'center'
                    });
                    win.show();
                    if (options.record) {
                        form.getForm().loadRecord(options.record);
                    }
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
                    var identificacionParcelaForm = new Ext.FormPanel(domain.functions.buildViewForm({
                        fields: domain.objects.identificacionParcelaFields,
                        title: 'Identificación de la parcela',
                        labelAlign: 'top',
                        bodyStyle: 'padding:10px'
                    }));
                    var dummyIdentificacionParcela = {
                        codigocatastral: '100050608090',
                        nro_parcela: '878',
                        superficie: '160.80',
                        padron_vigente: '0037499',
                        tipo_predio: 'FAMILIAR'
                    };
                    identificacionParcelaForm.getForm().setValues(dummyIdentificacionParcela);
                    var direccionParcelaForm = new Ext.FormPanel(domain.functions.buildViewForm({
                        fields: domain.objects.direccionParcelaFields,
                        title: 'Dirección de la parcela',
                        labelAlign: 'top',
                        bodyStyle: 'padding:10px'
                    }));
                    var dummyDireccionParcela = {
                        calle: 'LIBERTADOR SAN MARTIN ESQUINA AVENIDA BELGRANO',
                        zona: 'ZONA 8',
                        nro_piso: '1',
                        nro_departamento: '8',
                        nro_portal: '104'
                    };
                    direccionParcelaForm.getForm().setValues(dummyDireccionParcela);
                    var gridPropietarios = domain.objects.gridPropietarios({});
                    var unidadCatastral = new Ext.FormPanel(domain.functions.buildViewForm({
                        fields: domain.objects.unidadCatastral({}),
                        title: 'Unidad catastral',
                        labelAlign: 'top',
                        bodyStyle: 'padding:0px'
                    }));
                    var dummyUnidadCatastral = {
                        coordenada_x: '100056.23',
                        coordenada_y: '562050.60',
                        nro_parcel_prov: '00284',
                        nro_partida_prov: '1011051266010019',
                        nro_manzana: '006830',
                        nro_parcela: '284',
                        nro_subparcela: '00001',
                        nro_unidad: '0000',
                        nombre_calle: 'CALLE DE SANTA FE',
                        nro_portal: '3012',
                        cod_calle_scomenclador: '001252',
                        cod_calle_ordenanza: '3000',
                        padron_vigente: '0037499',
                        padron_anterior: '0000894656',
                        nro_piso: '00',
                        nro_departamento: '0000',
                        centro_distrito: '12598',
                        distrito_rou: 'CENTRAL',
                        vecinal: 'VECINAL',
                        nro_plano_mensura: '1651',
                        nro_lote_mensura: '10',
                        fecha_plano: '12/06/2015',
                        visado_mensura: '95',
                        fecha_visado: '12/03/2014',
                        tipo_regimen: 'NORMAL',
                        esquina: 'SI',
                        interno: 'NO',
                        tipo_pasillo: 'NORMAL',
                        salida_calle: 'SI',
                        nivel: 'SI',
                        superficie_m: '129,00',
                        frente_m: '9,00',
                        contrafrente_m: '14,00',
                        lado_derecho_m: '12,00',
                        lado_izquierdo_m: '12,00',
                        ancho_acera_mensura: '777,88',
                        ancho_calzada_mensura: '888,77',
                        superficie_e: '128,90',
                        frente_e: '8,50',
                        contrafrente_e: '14,50',
                        lado_derecho_e: '11,50',
                        lado_izquierdo_e: '11,50',
                        ancho_acera_m: '2,00',
                        ancho_calzada_m: '5,00',
                        linea: 'SI',
                        cinta_verde: 'SI',
                        arbol: 'NO',
                        cesto: 'SI',
                        fecha_relevado: '17/09/2014',
                        afectada_ensanche_calle: 'SIN AFECTACION',
                        metros_lineales_afectacion: '0,00',
                        fondo_manzana: 'NO',
                        ochava_reglamentaria: 'SI',
                        nro_ordenanza: '5125',
                        superficie_afectada: '0,00',
                        fondo_manzana_afectacion: '0,00',
                        metros_lineales_ochava: '1,00',
                        fecha_ordenanza: '25/12/2004',
                        energia_electrica: 'SI',
                        cloacas: 'SI',
                        agua_potable: 'SI',
                        recoleccion_residuos: 'SI',
                        gas: 'SI',
                        tipo_calzada: 'ASFALTO',
                        alumbrado_publico: 'SI'
                    };
                    unidadCatastral.getForm().setValues(dummyUnidadCatastral);
                    var gridEdificaciones = domain.objects.gridEdificaciones({});
                    var valuacionForm = new Ext.FormPanel(domain.functions.buildViewForm({
                        fields: domain.objects.valuacionFields({}),
                        title: 'Valuación',
                        labelAlign: 'top'
                    }));
                    var dummyValuacion = {
                        zona_inmobiliaria: '6',
                        valor_terreno_zona: '23.000,00',
                        valor_municipal: '21.500,00',
                        valor_terreno: '24.500,00',
                        coef_infraestructura: '1,50',
                        fecha_desde: '12/03/2013',
                        valor_metro_edificacion: '1.500,00',
                        valor_catastral_municipal: '21.500,00',
                        fecha_hasta: '17/09/2015',
                        categoria: 'FAMILIAR',
                        valor_mejora_edificada: '0,00',
                        avaluo_fiscal_municipal: '0,00',
                        tipo_valuacion: 'GENERAL'
                    };
                    valuacionForm.getForm().setValues(dummyValuacion);
                    var informacionAdicional = domain.objects.informacionAdicional({});
                    var panelFicha = new Ext.Panel({
                        title: 'Ficha Catastral',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 800,
                        minWidth: 700,
                        autoScroll: true,
                        items: [
                            identificacionParcelaForm,
                            direccionParcelaForm,
                            gridPropietarios,
                            unidadCatastral,
                            gridEdificaciones,
                            valuacionForm,
                            informacionAdicional
                        ]
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

