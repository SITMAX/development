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
                propietarioFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Tipo titular',
                            name: 'TIPOTITULAR'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nombre completo',
                            name: 'NOMBRE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo documento',
                            name: 'TIPODOCUMENTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'representante',
                            name: 'REPRESENTANTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo dominio',
                            name: 'TIPO DOMINIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Forma adquisición',
                            name: 'FORMAADQUISICION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Porcentaje tenencia',
                            name: 'PORCENTAJETENENCIA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Dominio',
                            name: 'DOMINIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Documento relacionado',
                            name: 'DOCUMENTORELACIONADO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Domicilio Reparto',
                            name: 'DOMICILIOREPARTO'
                        }];
                },
                propietarioForm: function (options) {

                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.propietarioFields(options)
                    });
                    return form;
                },
                ubicacionParcelaFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Coordenada eje X',
                            name: 'COORDENADAX'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Coordenada eje Y',
                            name: 'COORDENADAY'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. parcela provincial',
                            name: 'NROPARCELAPROV'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. manzana',
                            name: 'NROMANZANA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. parcela',
                            name: 'NROPARCELA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. Subparcela',
                            name: 'NROSUBPARCELA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. unidad',
                            name: 'NROUNIDAD'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. portal',
                            name: 'NROPORTAL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nombre calle',
                            name: 'NOMBRECALLE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Cod. calle s/nomenclador',
                            name: 'CODCALLE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Cod. calle ordenanza',
                            name: 'CODCALLEORDENANZA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Padron vigente',
                            name: 'PADRONVIGENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Padron anterior',
                            name: 'PADRONANTERIOR'
                        }];
                },
                ubicacionParcelaForm: function (options) {

                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.ubicacionParcelaFields(options)
                    });
                    return form;
                },
                parcelaFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Nro. plano mensura',
                            name: 'NROPLANO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. lote plano mensura',
                            name: 'NROLOTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Visado mensura',
                            name: 'VISADO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha',
                            name: 'FECHA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo regimen',
                            name: 'TIPOREGIMEN'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Esquina',
                            name: 'ESQUINA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Interno',
                            name: 'INTERNO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo pasillo',
                            name: 'TIPOPASILLO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Salida mas de una calle',
                            name: 'SALIDA'
                        }];
                },
                parcelaForm: function (options) {

                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.parcelaFields(options)
                    });
                    return form;
                },
                datosFisicosMensuraFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Superficie',
                            name: 'SUPERFICIE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida frente',
                            name: 'FRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida contrafrente',
                            name: 'CONTRAFRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado derecho',
                            name: 'DERECHO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado izquierdo',
                            name: 'IZQUIERDO'
                        }];
                },
                datosFisicosMensuraForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.datosFisicosMensuraFields(options)
                    });
                    return form;
                },
                datosFisicosEscrituraFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Superficie',
                            name: 'SUPERFICIE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida frente',
                            name: 'FRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida contrafrente',
                            name: 'CONTRAFRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado derecho',
                            name: 'DERECHO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado izquierdo',
                            name: 'IZQUIERDO'
                        }];
                },
                datosFisicosEscrituraForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.datosFisicosEscrituraFields(options)
                    });
                    return form;
                },
                datosFisicosCampoFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Medida frente',
                            name: 'FRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida contrafrente',
                            name: 'CONTRAFRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado derecho',
                            name: 'DERECHO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Medida lado izquierdo',
                            name: 'IZQUIERDO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha relevamiento',
                            name: 'FECHARELEVAMIENTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ancho de la acera frente al  lote segun mensura',
                            name: 'ANCHOFRENTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ancho de la calzada frente al  lote segun mensura',
                            name: 'ANCHOCALZADA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ancho de la acera frente al  lote segun inspección',
                            name: 'ANCHOACERAINSP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ancho de la calzada frente al  lote segun inspección',
                            name: 'ANCHOCALZADAINSP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'En línea',
                            name: 'ENLINEA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Cinta verde',
                            name: 'CINTAVERDE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Árbol frente parcela',
                            name: 'ARBOL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Cesto reglamentario',
                            name: 'CESTO'
                        }];
                },
                datosFisicosCampoForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        //labelWidth: 170,
                        waitTitle: 'Procesando...',
                        layout:'form',
                        labelAlign: 'top',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.datosFisicosCampoFields(options)
                    });
                    return form;
                },
                restricionesDominioFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Afectada a ensanche de calle',
                            name: 'AFECTADA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Número ordenanza - año ordenanza',
                            name: 'NROORDENANZA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Metros lineales de afectación',
                            name: 'METROSAFECTACION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Superficie afectada',
                            name: 'SUPERFICIEAFECTADA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fondos de manzana',
                            name: 'FONDOSMANZANA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Metros lineales de afectación - Fondo de manzana',
                            name: 'METROSAFECTACIONFONDO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ochava reglamentaria',
                            name: 'OCHAVA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Metros lineales ochava',
                            name: 'METROSOCHAVA'
                        }];
                },
                restricionesDominioForm: function (options) {
                    var form = new Ext.FormPanel({
                        labelAlign: 'top',
                        frame: true,
                        autoHeight: true,
                        bodyStyle: 'padding:5px 5px 0',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        //items: this.restricionesDominioFields(options)
                        layout: 'column',
                        items: [{
                                columnWidth: .5,
                                layout: 'form',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Afectada a ensanche de calle',
                                        name: 'AFECTADA'
                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Número ordenanza - año ordenanza',
                                        name: 'NROORDENANZA'
                                    }]
                            }, {
                                columnWidth: .5,
                                layout: 'form',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Metros lineales de afectación',
                                        name: 'METROSAFECTACION'
                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Superficie afectada',
                                        name: 'SUPERFICIEAFECTADA'
                                    }]
                            }, {
                                columnWidth: .5,
                                layout: 'form',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Fondos de manzana',
                                        name: 'FONDOSMANZANA'
                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Metros lineales de afectación - Fondo de manzana',
                                        name: 'METROSAFECTACIONFONDO'
                                    }]
                            }, {
                                columnWidth: .5,
                                layout: 'form',
                                items: [{
                                        xtype: 'textfield',
                                        fieldLabel: 'Ochava reglamentaria',
                                        name: 'OCHAVA'
                                    }, {
                                        xtype: 'textfield',
                                        fieldLabel: 'Metros lineales ochava',
                                        name: 'METROSOCHAVA'
                                    }]
                            }]
                    });
                    return form;
                },
                serviciosParcelaFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Energía eléctrica',
                            name: 'ENERGIAELECTRICA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Agua potable',
                            name: 'AGUAPOTABLE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Gas',
                            name: 'GAS'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Alumbrado público',
                            name: 'ALUMBRADOPUBLICO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Cloacas',
                            name: 'CLOACAS'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Recolección de residuos',
                            name: 'RECOLECCIONRESIDUOS'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo calzada',
                            name: 'TIPOCALZADA'
                        }];
                },
                serviciosParcelaForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.serviciosParcelaFields(options)
                    });
                    return form;
                },
                datosEdificacionFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Baldio',
                            name: 'BALDIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Detección de baldio',
                            name: 'DETECCIONBALDIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. de legajo de obra - ultimo aprobado',
                            name: 'NROLEGAJO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Destino',
                            name: 'DESTINO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '1. Superficie cubierta',
                            name: 'SUPERFICIECUBIERTA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '2. Superficie semicubierta',
                            name: 'SUPERFICIESEMICUBIERTA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '3. Superficie piscina',
                            name: 'SUPERFICIEPISCINA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '4. Reconocimiento de superficie cubierta',
                            name: 'RECONOCIMIENTOSUPERFICIE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '5. Reconocimiento de superficie semicubierta',
                            name: 'RECONOCIMIENTOSUPERFICIESEMI'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '6. Reconocimiento de piscina',
                            name: 'RECONOCIMIENTOPISCINA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Superficie total con antecedentes',
                            name: 'TOTALANTECEDENTES'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '7. Superficie cubierta sin permiso',
                            name: 'SUPERFICIECUBIERTASP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '8. Superficie semi cubierta sin permiso',
                            name: 'SUPERFICIESEMICUBIERTASP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '9. Superficie piscina sin permiso',
                            name: 'SUPERFICIEPISCINASP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '10. Demolición sin permiso',
                            name: 'DEMOLICIONSP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Superficie total sin permiso',
                            name: 'SUPERFICIESP'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Superficie total',
                            name: 'SUPERFICIETOTAL'
                        }];
                },
                datosEdificacionForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.datosEdificacionFields(options)
                    });
                    return form;
                },
                valuacionFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Zona inmobiliaria',
                            name: 'ZONAINMOBILIARIA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Zona inmobiliaria anterior',
                            name: 'ZONAINMOBILIARIAANTERIOR'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor M2 de terreno en zona inmobiliaria',
                            name: 'VALORMETROZONA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor del terreno',
                            name: 'VALORTERENO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor M2 de edificación',
                            name: 'VALORMETROEDIFICACION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor mejora edificada',
                            name: 'VALORMEJORAEDIFICADA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor inmobiliario municipal',
                            name: 'VALORINMOBILIARIOMUNICIPAL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Coeficiente de infraestructura de servicios',
                            name: 'COEFICIENTEINFRAESTRUCTURA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Valor catastral municipal',
                            name: 'VALORCATASTRALMUNICIPAL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Avalúo fiscal municipal',
                            name: 'AVALUOFISCAL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Costo total del servicio',
                            name: 'COSTOTOTALSERVICIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha desde',
                            name: 'FECHADESDE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha hasta',
                            name: 'FECHAHASTA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo de valuación',
                            name: 'TIPOVALUACION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Exención sobretasa por baldío',
                            name: 'EXENCIONSOBRETASA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha exento',
                            name: 'FECHAEXENTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Categoría',
                            name: 'CATEGORIA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Depreciación por antiguedad',
                            name: 'DEPRECIACIONANTIGUEDAD'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Porcentaje de inundación',
                            name: 'PORCENTAJEINUNDACION'
                        }];
                },
                valuacionForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
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
                informacionAdicionalFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Fotografía parcela',
                            name: 'FOTOGRAFIAPARCELA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Imagen plano de mensura',
                            name: 'IMAGENPLANOMENSURA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Imagen ficha catastral',
                            name: 'IMAGENFICHACATASTRAL'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Expedientes asociados',
                            name: 'EXPEDIENTESASOCIADOS'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Vigencias',
                            name: 'VIGENCIAS'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Observaciones',
                            name: 'OBSERVACIONES'
                        }];
                },
                informacionAdicionalForm: function (options) {
                    var form = new Ext.FormPanel({
                        frame: false,
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 150,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: this.informacionAdicionalFields(options)
                    });
                    return form;
                }
            };

            domain.functions = {
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

                    var panelFicha = new Ext.Panel({
                        title: 'Ficha Catastral',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 700,
                        autoScroll: true,
                        //layout: 'fit',                        
                        items: [{
                                xtype: 'panel',
                                title: 'Datos propietario',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: domain.objects.propietarioForm({})
                            }, {
                                xtype: 'panel',
                                title: 'Unidad Catastral',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: [{
                                        xtype: 'tabpanel',
                                        border: false,
                                        region: 'center',
                                        activeTab: 0,
                                        items: [{
                                                title: 'Datos de ubicación',
                                                items: domain.objects.ubicacionParcelaForm({})
                                            }, {
                                                title: 'Datos grales. parcela',
                                                items: domain.objects.parcelaForm({})
                                            }, {
                                                title: 'Datos físicos',
                                                xtype: 'tabpanel',
                                                border: false,
                                                autoHeight: true,
                                                region: 'center',
                                                activeTab: 0,
                                                items: [{
                                                        title: 'Según mensura',
                                                        items: domain.objects.datosFisicosMensuraForm({})
                                                    }, {
                                                        title: 'Según escritura',
                                                        items: domain.objects.datosFisicosEscrituraForm({})
                                                    }, {
                                                        title: 'En campo',
                                                        items: domain.objects.datosFisicosCampoForm({})
                                                    }]
                                            }, {
                                                title: 'Restricciones dominio',
                                                items: domain.objects.restricionesDominioForm({})
                                            }, {
                                                title: 'Servicios en la parcela',
                                                items: domain.objects.serviciosParcelaForm({})
                                            }]

                                    }]
                            }, {
                                xtype: 'panel',
                                title: 'Edificación',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: domain.objects.datosEdificacionForm({})
                            }, {
                                xtype: 'panel',
                                title: 'Valuación',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: domain.objects.valuacionForm({})
                            }, {
                                xtype: 'panel',
                                title: 'Información adicional',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: domain.objects.informacionAdicionalForm({})
                            }]

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

