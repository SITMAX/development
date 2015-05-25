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
        <style>
            #info-documentation h2 {
                padding:10px 10px 0;
                font-size:12px;
                color:#15428B;
            }
            #info-documentation .details-info {
                font-family:'lucida grande',tahoma,arial,sans-serif;
                font-size:11px;
                margin:10px;
                padding:10px;
                border:1px dotted #999;
                color:#555;
                background: #f9f9f9;
            }
        </style>
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
                        fieldLabel: 'Avenida/calle',
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
                                        fieldLabel: 'Nro. portal',
                                        name: 'nro_portal',
                                        anchor: '95%'
                                    }]
                            }]
                    }],
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
                                            fieldLabel: 'Codigo calle ordenanza',
                                            name: 'cod_calle_ordenanza',
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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Padron anterior',
                                            name: 'padron_anterior',
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
                                            fieldLabel: 'Fecha',
                                            name: 'fecha',
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
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
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
                                            fieldLabel: 'Medica frente',
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
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la acera frente al lote según inspección',
                                            name: 'ancho_acera_i',
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
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la calzada frente al lote según inspección',
                                            name: 'abcho_calzada_i',
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
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
                                            fieldLabel: 'Cesto reglamentario',
                                            name: 'cesto',
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
                                            xtype: 'textfield',
                                            fieldLabel: 'Afectada ensanche de calle',
                                            name: 'afectada_ensanche_calle',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación',
                                            name: 'metros_lineales_afectacion',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Fondos de manzana',
                                            name: 'fondo_manzana',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
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
                                            fieldLabel: 'Número ordenanza - Año ordenanza',
                                            name: 'nro_ordenanza',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie afectada',
                                            name: 'superficie_afectada',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación -fondo de manzana',
                                            name: 'fondo_manzana_afectacion',
                                            anchor: '95%'
                                        }, {
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
                                            xtype: 'textfield',
                                            fieldLabel: 'Energía eléctrica',
                                            name: 'energia_electrica',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
                                            fieldLabel: 'Agua potable',
                                            name: 'agua_potable',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
                                            fieldLabel: 'Gas',
                                            name: 'gas',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
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
                                            xtype: 'textfield',
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
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Zona inmobiliaria anterior',
                                            name: 'zona_inmobiliaria_anterior',
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
                                            fieldLabel: 'Costo total servicio',
                                            name: 'costo_servicio',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Exención por baldío',
                                            name: 'exencion_baldio',
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
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha exento',
                                            name: 'fecha_exento',
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
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Categoría',
                                            name: 'categoria',
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
                                            fieldLabel: 'Tipo valuación',
                                            name: 'tipo_valuacion',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Depreciación por antigüedad',
                                            name: 'depreciacion',
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
                                            fieldLabel: 'Porcentaje de inundación',
                                            name: 'porcentaje_inundacion',
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
                /* Propietarios titulares */
                gridPropietarios: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Jose Barabato Porcasi', 'Natural', 'Si', 'DNI', '1234567'],
                        ['Quiroga ASOCIADOS', 'Jurídica', 'No', 'LC', '7654321'],
                        ['Patricia Terrazas', 'Natural', 'Si', 'DNI', '7777777']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'propietario'},
                            {name: 'tipoTitular'},
                            {name: 'representante'},
                            {name: 'tipoDocumento'},
                            {name: 'nroDocumento'}
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
                            {header: "Propietario", width: 300, sortable: true, dataIndex: 'propietario'},
                            {header: "Tipo titular", width: 80, sortable: true, dataIndex: 'tipoTitular'},
                            {header: "Representante", width: 80, sortable: true, dataIndex: 'representante'},
                            {header: "Tipo documento", width: 80, sortable: true, dataIndex: 'tipoDocumento'},
                            {header: "Nro. Documento", width: 90, sortable: true, dataIndex: 'nroDocumento'}
                        ],
                        stripeRows: true,
                        store: store
                    });
                    return gridPropietarios;
                },
                gridEdificaciones: function (options) {
                    //Arreglo bidimensional de datos
                    var myData = [
                        ['Edificación 01', 'Privado', 'Familiar', 'No', '11111111'],
                        ['Edificación 02', 'Privado', 'Comercial', 'No', '22222222'],
                        ['Edificación 03', 'Privado', 'Comercial', 'No', '33333333'],
                        ['Edificación 04', 'Municipal', 'Comercial', 'No', '4444444']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'edificacion'},
                            {name: 'destino'},
                            {name: 'usodestino'},
                            {name: 'baldio'},
                            {name: 'nroLegajoObra'}
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
                            {header: "Destino", width: 80, sortable: true, dataIndex: 'destino'},
                            {header: "Uso destino", width: 80, sortable: true, dataIndex: 'usodestino'},
                            {header: "Baldío", width: 80, sortable: true, dataIndex: 'baldio'},
                            {header: "Nro. Legajo de obra", width: 190, sortable: true, dataIndex: 'nroLegajoObra'}
                        ],
                        stripeRows: true,
                        //height: 250,
                        autoHeight: true,
                                //width: 600,
                                autoWidth: true,
                        store: store
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
                        ['Vigencia 01', '12/03/2003'],
                        ['Vigencia 02', '17/09/2014'],
                        ['Vigencia 03', '31/12/2014'],
                        ['Vigencia 04', '01/05/2015']
                    ];
                    //creando el repositorio de datos
                    var store = new Ext.data.ArrayStore({
                        fields: [
                            {name: 'vigencia'},
                            {name: 'fecha'}
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
                            {header: "Fecha", width: 80, sortable: true, dataIndex: 'fecha'}
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
                                        items: [domain.objects.observacionesForm({})
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
                        zona: '0088',
                        nro_piso: '00',
                        nro_departamento: '0000',
                        cod_calle_scomenclador: '001252',
                        cod_calle_ordenanza: '3000',
                        padron_vigente: '0037499',
                        padron_anterior: '0000894656',
                        centro_distrito: '12598',
                        distrito_rou: 'CENTRAL',
                        vecinal: 'VECINAL',
                        nro_plano_mensura: '1651',
                        nro_lote_mensura: '10',
                        visado_mensura: '95',
                        fecha: '12/03/2014',
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
                        superficie_e: '128,90',
                        frente_e: '8,50',
                        contrafrente_e: '14,50',
                        lado_derecho_e: '11,50',
                        lado_izquierdo_e: '11,50',
                        ancho_acera_m: '2,00',
                        ancho_acera_i: '2,10',
                        ancho_calzada_m: '5,00',
                        abcho_calzada_i: '4,90',
                        linea: 'SI',
                        cinta_verde: 'SI',
                        arbol: 'NO',
                        cesto: 'SI',
                        afectada_ensanche_calle: 'SIN AFECTACION',
                        metros_lineales_afectacion: '0,00',
                        fondo_manzana: 'NO',
                        ochava_reglamentaria: 'SI',
                        nro_ordenanza: '5125/2014',
                        superficie_afectada: '0,00',
                        fondo_manzana_afectacion: '0,00',
                        metros_lineales_ochava: '1,00',
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
                        zona_inmobiliaria_anterior: '05',
                        valor_terreno_zona: '23.000,00',
                        valor_municipal: '21.500,00',
                        costo_servicio: '5.000,00',
                        exencion_baldio: 'NO',
                        valor_terreno: '24.500,00',
                        coef_infraestructura: '1,50',
                        fecha_desde: '12/03/2013',
                        fecha_exento: '-/-/-',
                        valor_metro_edificacion: '1.500,00',
                        valor_catastral_municipal: '21.500,00',
                        fecha_hasta: '17/09/2015',
                        categoria: 'FAMILIAR',
                        valor_mejora_edificada: '0,00',
                        avaluo_fiscal_municipal: '0,00',
                        tipo_valuacion: 'GENERAL',
                        depreciacion: 'NO',
                        porcentaje_inundacion: '0,00'
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

