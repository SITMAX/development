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
                identificacionParcelaFields: function (options) {
                    return [
                        {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Código Catastral',
                                            name: 'CODIGOCATASTRAL',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. parcela',
                                            name: 'NROPARCELA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie',
                                            name: 'SUPERFICIE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Padron vigente',
                                            name: 'PADRONVIGENTE',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Tipo predio',
                                            name: 'TIPOPREDIO',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                /*Formulario para bloque de Identificacion parcela*/
                identificacionParcelaForm: function (options) {
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
                        items: this.identificacionParcelaFields(options)
                    });
                    return form;
                },
                /*Campos para formulario de Direccion parcela*/
                direccionParcelaFields: function (options) {
                    return [
                        {
                            xtype: 'textfield',
                            fieldLabel: 'Avenida/calle',
                            name: 'CALLE',
                            anchor: '93%'
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Zona',
                                            name: 'ZONA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. piso',
                                            name: 'NROPISO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. departamento',
                                            name: 'NRODEPARTAMENTO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. portal',
                                            name: 'NROPORTAL',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                /*Formulario para bloque de Direccion parcela*/
                direccionParcelaForm: function (options) {

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
                        items: this.direccionParcelaFields(options)
                    });
                    return form;
                },
                /*Campos para formulario de Datos de propietario o Titular*/
                propietarioFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Nombre completo o Razón social',
                            name: 'NOMBRECOMPLETO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo titular',
                            name: 'TIPOTITULAR'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Representante',
                            name: 'REPRESENTANTE'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo de documento',
                            name: 'TIPODOCUMENTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. de documento',
                            name: 'NRODOCUMENTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Sexo',
                            name: 'SEXO'
                        }];
                },
                /*Formulario para bloque de Datos de propietario o Titular*/
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
                /*Campos para formulario de Datos de Ubicación parcela*/
                ubicacionParcelaFields: function (options) {
                    return [
                        {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Coordenada eje X',
                                            name: 'COORDENADAX',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Coordenada eje Y',
                                            name: 'COORDENADAY',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. parcela provincial',
                                            name: 'NROPARCELAPROV',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. partida provincial',
                                            name: 'NRODEPARTIDAPROV',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. manzana',
                                            name: 'NROMANZANA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. parcela',
                                            name: 'NROPARCELA',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. subparcela',
                                            name: 'NROSUBPARCELA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. unidad',
                                            name: 'NROUNIDAD',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nombre calle',
                                            name: 'NOMCALLE',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. portal',
                                            name: 'NROPORTAL',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Zona',
                                            name: 'ZONA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. piso',
                                            name: 'NROPISO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. departamento',
                                            name: 'NRODEPARTAMENTO',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Codigo calle sin nomenclador',
                                            name: 'CODSINNOMENCLADOR',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Codigo calle ordenanza',
                                            name: 'CODCALLEORDENANZA',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Padrón vigente',
                                            name: 'PADRONVIGENTE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Padron anterior',
                                            name: 'PADRONANTERIOR',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Centro de distrito al que pertenece',
                                            name: 'CENTRODISTRITO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Distrito ROU',
                                            name: 'DISTRITOROU',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Vecinal',
                                            name: 'VECINAL',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                ubicacionParcelaForm: function (options) {

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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. plano mensura',
                                            name: 'NROPLANOMENSURA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nro. lote plano mensura',
                                            name: 'NROLOTEMENSURA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Visado mensura o Certificado de límite',
                                            name: 'VISADOMENSURA',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Fecha',
                                            name: 'FECHA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Tipo regimen',
                                            name: 'TIPOREGIMEN',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Esquina',
                                            name: 'ESQUINA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Interno',
                                            name: 'INTERNO',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Tipo pasillo',
                                            name: 'TIPOPASILLO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Salida mas de una calle',
                                            name: 'SALIDACALLE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Nivel',
                                            name: 'NIVEL',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                parcelaForm: function (options) {

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
                        items: this.parcelaFields(options)
                    });
                    return form;
                },
                titularesFields: function (options) {
                    return [{
                            xtype: 'textfield',
                            fieldLabel: 'Tomo',
                            name: 'TOMO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Folio',
                            name: 'FOLIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Nro. de inscripción',
                            name: 'NROINSCRIPCION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Fecha de adquisición',
                            name: 'FECHAADQUISICION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Tipo de dominio',
                            name: 'TIPODOMINIO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Porcentaje de tenencia',
                            name: 'PORCENTAJETENENCIA'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Forma de adquisición',
                            name: 'FORMAADQUISICION'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Domicilio reparto',
                            name: 'DOMICILIOREPARTO'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Documentación jurídica relacionada',
                            name: 'DOCUMENTACIONJURIDICA'
                        }];
                },
                titularesForm: function (options) {

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
                        items: this.titularesFields(options)
                    });
                    return form;
                },
                datosFisicosMensuraFields: function (options) {
                    return [{
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie',
                                            name: 'SUPERFICIE',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medica frente',
                                            name: 'FRENTE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida contrafrente',
                                            name: 'CONTRAFRENTE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado derecho',
                                            name: 'DERECHO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado izquierdo',
                                            name: 'IZQUIERDO',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosMensuraForm: function (options) {
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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie',
                                            name: 'SUPERFICIE',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medica frente',
                                            name: 'FRENTE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida contrafrente',
                                            name: 'CONTRAFRENTE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado derecho',
                                            name: 'DERECHO',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Medida lado izquierdo',
                                            name: 'IZQUIERDO',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosEscrituraForm: function (options) {
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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la acera frente al lote según mensura',
                                            name: 'ANCHOACERAMENSURA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la acera frente al lote según inspección',
                                            name: 'ANCHOACERAINSPECCION',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la calzada frente al lote según mensura',
                                            name: 'ANCHOCALZADAMENSURA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Ancho de la calzada frente al lote según inspección',
                                            name: 'ANCHOCALZADAINSPECCION',
                                            anchor: '95%'
                                        }]
                                }]
                        }, {
                            layout: 'column',
                            items: [{
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'En línea',
                                            name: 'LINEA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Cinta verde',
                                            name: 'CINTAVERDE',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Arbol frente parcela',
                                            name: 'ARBOL',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Cesto reglamentario',
                                            name: 'CESTO',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                datosFisicosCampoForm: function (options) {
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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Afectada ensanche de calle',
                                            name: 'AFECTADAENSANCHECALLE',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación',
                                            name: 'METROSLINEALESAFECTACION',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Fondos de manzana',
                                            name: 'FONDOMANZANA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Ochava reglamentaria',
                                            name: 'OCHAVAREGLAMENTARIA',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .5,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Número ordenanza - Año ordenanza',
                                            name: 'NROORDENANZA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Superficie afectada',
                                            name: 'SUPERFICIEAFECTADA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales de afectación -fondo de manzana',
                                            name: 'FONDOMANZANAAFECTACION',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Metros lineales ochava',
                                            name: 'METROSLINEALESOCHAVA',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                restricionesDominioForm: function (options) {
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
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Energía eléctrica',
                                            name: 'ENERGIAELECTRICA',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Cloacas',
                                            name: 'CLOACAS',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Agua potable',
                                            name: 'AGUAPOTABLE',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Gas',
                                            name: 'GAS',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Gas',
                                            name: 'GAS2',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Recolección de residuos',
                                            name: 'RECOLECCIONRESIDUOS',
                                            anchor: '95%'
                                        }]
                                }, {
                                    columnWidth: .25,
                                    layout: 'form',
                                    items: [{
                                            xtype: 'textfield',
                                            fieldLabel: 'Alumbrado público',
                                            name: 'ALUMBRADOPUBLICO',
                                            anchor: '95%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Tipo calzada',
                                            name: 'TIPOCALZADA',
                                            anchor: '95%'
                                        }]
                                }]
                        }];
                },
                serviciosParcelaForm: function (options) {
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
                },
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
                        //title: 'Propietarios',
                        //region: 'center',
                        //collapsible: true,                        
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
                        //height: 250,
                        autoHeight: true,
                        //width: 600,
                        autoWidth: true,
                        store: store
                    });
                    return gridPropietarios;
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
                                title: 'Identificación de la parcela',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: [domain.objects.identificacionParcelaForm({})
                                ]
                            }, {
                                xtype: 'panel',
                                title: 'Dirección de la parcela',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: [domain.objects.direccionParcelaForm({})
                                ]
                            }, {
                                xtype: 'panel',
                                title: 'Datos de propietario o titular',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: [domain.objects.gridPropietarios({})
                                ]
                            }, {
                                xtype: 'panel',
                                title: 'Unidad catastral',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
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
                            }, {
                                xtype: 'panel',
                                title: 'Edificaciones',
                                collapsed: true,
                                autoHeight: true,
                                bodyStyle: 'padding:10x;',
                                //height: 200,
                                border: false,
                                collapsible: true,
                                titleCollapse: true,
                                items: [domain.objects.datosEdificacionForm({})
                                ]
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
                                items: [domain.objects.valuacionForm({})
                                ]
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
                                items: [{
                                        html: '<br><br><p>Aqui insertamos el formulario correspondiente.</p><br><br>'
                                    }
                                ]
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

