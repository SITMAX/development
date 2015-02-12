<%-- 
    Document   : Gestion edicion - Zonas
    Created on : 31-01-2012, 05:27:49 PM
    Author     : John Castillo V.
                 john.gnu@gmail.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es" id="sitmax">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion edición - zonas</title>

        <%@include file="../ExtJSScripts-ES_.jsp"%>   

        <script src="/openlayers-2.12/lib/OpenLayers.js"></script>
        <script type="text/javascript" src="/geoext/lib/GeoExt.js"></script>
        <script type="text/javascript" src="/geoserver/pdf/info.json?var=printCapabilities"></script>


        <script type="text/javascript" src="<c:url value="/js/PrintPreview.js"/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/printpreview.css"/>" />
        <!--        <script src="http://maps.google.com/maps/api/js?v=3&amp;sensor=false"></script>-->

        <script type="text/javascript">
            Ext.ns('domain');

            domain.controlSwitches = {
                geoEditing: false
            };

            domain.objects = {
                proxy: '/http_proxy/proxy?url=',
                geoserverUrl: 'http://localhost:8090/geoserver/sitmax/wms',
                treeLayer: function (map) {
                    //ROOT NODE
                    var layerRoot = new Ext.tree.TreeNode({
                        text: "",
                        expanded: true
                    });
                    layerRoot.appendChild(new GeoExt.tree.BaseLayerContainer({
                        text: "Mapas",
                        map: map,
                        expanded: true
                    }));
                    layerRoot.appendChild(new GeoExt.tree.OverlayLayerContainer({
                        text: "Capas",
                        map: map,
                        expanded: true
                    }));

                    // create the tree with the configuration from above
                    var tree = new Ext.tree.TreePanel({
                        split: true,
                        root: layerRoot,
                        width: 250,
                        expanded: true,
                        rootVisible: false
                    });

                    new Ext.Window({
                        title: "Capas",
                        modal: false,
                        border: false,
                        resizable: false,
                        width: 250,
                        autoHeight: true,
                        layout: 'fit',
                        collapsible: true,
                        items: [tree]
                    }).show().center();
                },
                legend: function (map) {
                    var legendPanel = new GeoExt.LegendPanel({
                        defaults: {
                            labelCls: 'mylabel',
                            style: 'padding:5px'
                        },
                        bodyStyle: 'padding:5px',
                        width: 250,
                        autoScroll: true
                    });

                    new Ext.Window({
                        title: "Leyenda",
                        modal: false,
                        border: false,
                        resizable: false,
                        width: 250,
                        autoHeight: true,
                        layout: 'fit',
                        items: [legendPanel]
                    }).show().center();
                },
                showPrintWindow: function (map) {
                    var printWindow = new Ext.Window({
                        title: "Impresión de cartografía",
                        modal: true,
                        border: false,
                        resizable: false,
                        width: 370,
                        autoHeight: true,
                        items: new GeoExt.ux.PrintPreview({
                            autoHeight: true,
                            printMapPanel: {
                                // limit scales to those that can be previewed
                                limitScales: true,
                                // no zooming on the map
                                map: {controls: [
                                        new OpenLayers.Control.Navigation({
                                            zoomBoxEnabled: true,
                                            zoomWheelEnabled: true
                                        }),
                                        new OpenLayers.Control.PanPanel()
                                    ]}
                            },
                            printProvider: {
                                capabilities: printCapabilities
                            },
                            includeLegend: false,
                            mapTitle: "Imprimir",
                            comment: "",
                            sourceMap: map
                        })
                    }).show().center();
                },
                mapa: function (options) {
                    OpenLayers.ProxyHost = domain.objects.proxy;

//                    var bounds = new OpenLayers.Bounds(
//                            621962.3613443433, 8258496.016155729,
//                            666691.2181644263, 8332214.638722589
//                            );
                    var bounds = new OpenLayers.Bounds(
                            5426192.5, 6493078,
                            5444828, 6509433
                            );
                    var options1 = {
                        maxExtent: bounds,
                        maxResolution: 72.794921875,
                        projection: "EPSG:5347",
                        units: 'm'
                    };

                    var map = new OpenLayers.Map("map", options1);
                    map.addControl(new OpenLayers.Control.LayerSwitcher());
                    //Base layers
                    var mapa = new OpenLayers.Layer.WMS("Mapa Santa Fe",
                            domain.objects.geoserverUrl,
                            {layers: 'visor1',
                                format: 'image/png'
                            },
                    {
                        isBaseLayer: true,
                        projection: "EPSG:5347",
                        singleTile: true,
                        ratio: 2
                    });

//                    var foto = new OpenLayers.Layer.WMS("Raster",
//                            domain.objects.geoserverUrl,
//                            {layers: 'visor2',
//                                format: 'image/png'
//                            },
//                    {
//                        isBaseLayer: true,
//                        projection: "EPSG:5347"
//                    });

                    //Overlays Layers
                    var predio = new OpenLayers.Layer.WMS("Parcelas",
                            domain.objects.geoserverUrl,
                            {layers: 'parcela',
                                transparent: true,
                                format: 'image/png'
                            },
                    {
                        isBaseLayer: false,
                        projection: "EPSG:5347",
                        visibility: false
                    });

                    var edificacion = new OpenLayers.Layer.WMS("Mejoras",
                            domain.objects.geoserverUrl,
                            {layers: 'edificacion',
                                transparent: true,
                                format: 'image/png'
                            },
                    {
                        isBaseLayer: false,
                        projection: "EPSG:5347",
                        visibility: false
                    });

                    var manzana = new OpenLayers.Layer.WMS("Zonas",
                            domain.objects.geoserverUrl,
                            {layers: 'zona',
                                transparent: true,
                                format: 'image/png'
                            },
                    {
                        isBaseLayer: false,
                        projection: "EPSG:5347",
                        visibility: true,
                        singleTile: true,
                        ratio: 2
                    });
                    //Editable Layer
                    this.layerWriteable = manzana;
                    //Map layers
                    map.addLayers([mapa, manzana, predio, edificacion]);

                    //Work layers
                    this.canvas = new OpenLayers.Layer.Vector("canvas", {
                        displayInLayerSwitcher: false,
                        styleMap: domain.objects.styles
                    });
                    map.addLayer(this.canvas);
                    this.objectselected = new OpenLayers.Layer.Vector("objectselected", {
                        displayInLayerSwitcher: false//,
                                //styleMap: domain.objects.styles
                    });
                    map.addLayer(this.objectselected);


                    var toggleGroup = "measureControls";

                    var lengthButton = new Ext.Button({
                        iconCls: 'ruler',
                        tooltip: 'Medir Distancia',
                        enableToggle: true,
                        toggleGroup: toggleGroup,
                        handler: function () {
                            toggleControl(lengthButton, 'line');
                        }
                    });

                    var areaButton = new Ext.Button({
                        iconCls: 'ruler_square',
                        tooltip: 'Medir Area',
                        enableToggle: true,
                        toggleGroup: toggleGroup,
                        handler: function () {
                            toggleControl(areaButton, 'polygon');
                        }
                    });

                    var zoomButton = new Ext.Button({
                        iconCls: 'zoomin',
                        tooltip: 'Enfocar',
                        enableToggle: true,
                        toggleGroup: toggleGroup,
                        handler: function (element) {
                            toggleControl(zoomButton, 'zoom');
                            control.deactivate();
                            if (element.pressed) {
                                zoomBox.activate();
                            } else {
                                zoomBox.deactivate();
                            }
                        }
                    });

                    var infoCtl = new Ext.Button({
                        iconCls: 'information',
                        text: 'Seleccionar',
                        tooltip: 'Seleccionar en el mapa',
                        enableToggle: true,
                        toggleGroup: toggleGroup,
                        handler: function (element) {
                            //console.log(domain.objects.proxy + domain.objects.geoserverUrl);
                            toggleControl(zoomButton, 'info');
                            zoomBox.deactivate();
                            if (element.pressed) {
                                control.activate();
                            } else {
                                control.deactivate();
                            }
                        }
                    });

                    var tbtext = new Ext.Toolbar.TextItem({
                        text: '',
                        width: 100
                    });
                    //Map panel
                    var mapPanel = new GeoExt.MapPanel({
                        title: 'Mapa',
                        tbar: [{
                                iconCls: 'layers',
                                tooltip: 'Lista de capas',
                                tooltipType: 'title',
                                handler: function () {
                                    domain.objects.treeLayer(map);
                                }
                            }, {
                                iconCls: 'legend',
                                tooltip: 'Leyenda',
                                tooltipType: 'title',
                                handler: function () {
                                    domain.objects.legend(map);
                                }
                            }, '-', zoomButton, lengthButton, areaButton, infoCtl,
                            tbtext],
                        map: map
                    });

                    // style the sketch fancy
                    var sketchSymbolizers = {
                        "Point": {
                            pointRadius: 4,
                            graphicName: "square",
                            fillColor: "white",
                            fillOpacity: 1,
                            strokeWidth: 1,
                            strokeOpacity: 1,
                            strokeColor: "#333333"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#666666",
                            strokeDashstyle: "dash"
                        },
                        "Polygon": {
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            strokeColor: "#666666",
                            fillColor: "white",
                            fillOpacity: 0.3
                        }
                    };
                    var style = new OpenLayers.Style();
                    style.addRules([
                        new OpenLayers.Rule({symbolizer: sketchSymbolizers})
                    ]);
                    var styleMap = new OpenLayers.StyleMap({"default": style});

                    // allow testing of specific renderers via "?renderer=Canvas", etc
                    var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
                    renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

                    var ZoomBoxNav = OpenLayers.Class(OpenLayers.Control.Navigation, {
                        zoomBoxKeyMask: null // this ensures that a box is always drawn
                    });

                    var zoomBox = new ZoomBoxNav();

                    map.addControl(zoomBox);
                    zoomBox.deactivate();

                    var measureControls = {
                        line: new OpenLayers.Control.Measure(
                                OpenLayers.Handler.Path, {
                                    persist: true,
                                    handlerOptions: {
                                        layerOptions: {
                                            renderers: renderer,
                                            styleMap: styleMap
                                        }
                                    }
                                }
                        ),
                        polygon: new OpenLayers.Control.Measure(
                                OpenLayers.Handler.Polygon, {
                                    persist: true,
                                    handlerOptions: {
                                        layerOptions: {
                                            renderers: renderer,
                                            styleMap: styleMap
                                        }
                                    }
                                }
                        )
                    };

                    for (var key in measureControls) {
                        var control = measureControls[key];
                        control.setImmediate(true);
                        control.events.on({
                            "measure": handleMeasurements,
                            "measurepartial": handleMeasurements
                        });
                        map.addControl(control);
                    }

                    function handleMeasurements(event) {
                        var geometry = event.geometry;
                        var units = event.units;
                        var order = event.order;
                        var measure = event.measure;
                        var out = "";
                        if (order === 1) {
                            out += "medir: " + measure.toFixed(2) + " " + units;
                        } else {
                            out += "medir: " + measure.toFixed(2) + " " + units + "<sup>2</" + "sup>";
                        }
                        tbtext.setText(out);
                    }

                    function toggleControl(element, value) {
                        for (key in measureControls) {
                            var ctrl = measureControls[key];
                            if (value === key && element.pressed) {
                                zoomBox.deactivate();
                                control.deactivate();
                                ctrl.activate();
                            } else {
                                ctrl.deactivate();
                            }
                        }
                    }

                    map.addControl(new OpenLayers.Control.MousePosition());

                    //WMSGetFeatureInfo Control for Parcela
                    var control = new OpenLayers.Control.WMSGetFeatureInfo({
                        url: domain.objects.geoserverUrl,
                        title: 'Identify features by clicking',
                        autoActivate: true,
                        infoFormat: "application/vnd.ogc.gml",
                        maxFeatures: 1,
                        layers: [manzana]
                    });
                    var winfo = null;
                    control.events.on({
                        getfeatureinfo: function (e) {
                            var feature = e.features[0];
                            if (feature) {
//                                if (!winfo) {
//                                    winfo = new Ext.Window({
//                                        title: "Descripción",
//                                        width: 300,
//                                        height: 250,
//                                        layout: "fit",
//                                        collapsible: true,
//                                        x: 200,
//                                        y: 130,
//                                        closeAction: 'hide',
//                                        items: [{
//                                                xtype: "propertygrid",
//                                                title: feature.fid,
//                                                source: feature.attributes
//                                            }]
//                                    }).show();
//                                } else {
//                                    winfo.removeAll();
//                                    winfo.add({
//                                        xtype: "propertygrid",
//                                        title: feature.fid,
//                                        source: feature.attributes
//                                    });
//                                    winfo.doLayout();
//                                    winfo.show();
//                                }
                                //renombrando el ID
                                var s = feature.fid;
                                //console.log(feature);
                                s = s.substring(s.indexOf('.') + 1);
                                domain.Panel.grid.store.load({
                                    params: {
                                        id: s
                                    }
                                });
                                //domain.Panel.grid.getSelectionModel().selectFirstRow();
                                //domain.Panel.grid.getSelectionModel().select(domain.Panel.grid.store.getById(s));
                                domain.objects.selectFeature(map, feature, false);
                                control.deactivate();
                            } else {
                                com.icg.errors.warn('Ningun objeto seleccionado');
                            }
                        }
                    });
                    map.addControl(control);
                    control.deactivate();
                    //Draw control
                    this.drawControl = new OpenLayers.Control.DrawFeature(this.canvas, OpenLayers.Handler.Polygon);
                    map.addControl(this.drawControl);
                    this.drawControl.deactivate();
                    //Modifi control
                    this.modifyControl = new OpenLayers.Control.ModifyFeature(this.canvas);
                    map.addControl(this.modifyControl);
                    this.modifyControl.deactivate();
                    //Drag Control
                    this.dragControl = new OpenLayers.Control.DragFeature(this.canvas);
                    map.addControl(this.dragControl);
                    this.dragControl.deactivate();
                    return mapPanel;
                },
                styles: new OpenLayers.StyleMap({
                    "default": new OpenLayers.Style(null, {
                        rules: [
                            new OpenLayers.Rule({
                                symbolizer: {
                                    "Point": {
                                        pointRadius: 5,
                                        //graphicName: "square",
                                        fillColor: "#66FF33",
                                        fillOpacity: 0.25,
                                        strokeWidth: 2,
                                        strokeOpacity: 1,
                                        strokeColor: "#33CC33"
                                    },
                                    "Line": {
                                        strokeWidth: 5,
                                        strokeOpacity: 0.7,
                                        strokeColor: "#FF9900"
                                    },
                                    "Polygon": {
                                        strokeWidth: 2,
                                        strokeOpacity: 1,
                                        fillColor: "#66FF33",
                                        strokeColor: "#33CC33"
                                    }
                                }
                            })
                        ]
                    }),
                    "select": new OpenLayers.Style(null, {
                        rules: [
                            new OpenLayers.Rule({
                                symbolizer: {
                                    "Point": {
                                        pointRadius: 5,
                                        graphicName: "square",
                                        fillColor: "red",
                                        fillOpacity: 0.25,
                                        strokeWidth: 2,
                                        strokeOpacity: 1,
                                        strokeColor: "#0000ff"
                                    },
                                    "Line": {
                                        strokeWidth: 3,
                                        strokeOpacity: 1,
                                        strokeColor: "#0000ff"
                                    },
                                    "Polygon": {
                                        strokeWidth: 2,
                                        strokeOpacity: 1,
                                        fillColor: "#0000ff",
                                        strokeColor: "#0000ff"
                                    }
                                }
                            })
                        ]
                    }),
                    "temporary": new OpenLayers.Style(null, {
                        rules: [
                            new OpenLayers.Rule({
                                symbolizer: {
                                    "Point": {
                                        //graphicName: "square",
                                        pointRadius: 5,
                                        fillColor: "#ff0000",
                                        fillOpacity: 0.25,
                                        strokeWidth: 2,
                                        strokeColor: "#ff0000"
                                    },
                                    "Line": {
                                        strokeWidth: 3,
                                        strokeOpacity: 1,
                                        strokeColor: "#ff0000"
                                    },
                                    "Polygon": {
                                        strokeWidth: 2,
                                        strokeOpacity: 1,
                                        strokeColor: "#ff0000",
                                        fillColor: "#ff0000"
                                    }
                                }
                            })
                        ]
                    })
                }),
                featureFromText: function (the_geom, attrs) {
                    var feature = new OpenLayers.Feature.Vector(OpenLayers.Geometry.fromWKT(the_geom)
                            );
                    return feature;
                },
                selectFeature: function (map, feature, zoomto) {
                    var geographic = new OpenLayers.Projection("EPSG:4326");
                    var mercator = new OpenLayers.Projection("EPSG:5347");
                    feature.geometry.transform(
                            geographic, mercator
                            );
                    this.objectselected.removeAllFeatures();
                    this.objectselected.addFeatures([feature]);
                    if (zoomto) {
                        map.zoomToExtent(feature.geometry.getBounds());
                    }
                },
                searchForm: function (options) {
                    //Store for parcela
                    var store = new Ext.data.JsonStore({
                        url: Ext.SROOT + 'command/select/paramlist/public/parcela',
                        propertyId: 'id',
                        root: 'data',
                        fields: [
                            {name: 'id', mapping: 'parcela_id'},
                            {name: 'nombre'},
                            {name: 'nomenclatura'},
                            {name: 'origen'},
                            {name: 'the_geom'}
                        ]
                    });
                    //Grid for parcela
                    var grid = new Ext.grid.GridPanel({
                        title: 'Resultados',
                        region: 'center',
                        loadMask: true,
                        selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Código", width: 150, sortable: true, dataIndex: 'nomenclatura'},
                            {header: "Nombre", width: 150, sortable: true, dataIndex: 'nombre'},
                            {header: "Origen", width: 50, dataIndex: 'origen'}
                        ],
                        store: store
                    });

                    grid.getSelectionModel().on('rowselect', function (sm, rowindex, record) {
                        var feature = domain.objects.featureFromText(record.data.the_geom, {
                            fid: record.data.id
                        });
                        domain.objects.selectFeature(options.map, feature, true);
                    });

                    var form = new Ext.FormPanel({
                        //border: true,
                        //frame: true,
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 100,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '92%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Código catastral',
                                name: 'value',
                                allowBlank: false
                            }, {
                                xtype: 'hidden',
                                name: 'operator',
                                value: 'like'
                            }, {
                                xtype: 'hidden',
                                name: 'key',
                                value: 'nomenclatura'
                            }],
                        buttons: [{
                                text: "Buscar",
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        store.load({
                                            params: form.getForm().getValues()
                                        });
                                    }
                                }
                            }]
                    });

                    new Ext.Window({
                        title: 'Buscar parcela',
                        border: false,
                        collapsible: true,
                        width: 300,
                        height: 400,
                        minWidth: 250,
                        maxWidth: 400,
                        x: 20,
                        y: 130,
                        layout: 'border',
                        items: [form, grid],
                        tbar: [{
                                iconCls: 'refresh',
                                handler: function () {
                                    grid.store.reload();
                                }
                            }, '->', /* {
                             text: 'Editar',
                             iconCls: 'update',
                             tooltip: 'Editar',
                             handler: function () {
                             var record = grid.getSelectionModel().getSelected();
                             if (record) {
                             var feature = featureFromText(record.data.the_geom);
                             mapPanel1.map.zoomToExtent(feature.geometry.getBounds());
                             canvas.removeAllFeatures();
                             canvas.addFeatures(feature);
                             modifyControl.activate();
                             } else {
                             com.icg.errors.mustSelect();
                             }
                             }
                             }, {
                             text: 'Enfocar',
                             iconCls: 'zoomin',
                             tooltip: 'Enfocar el objeto',
                             handler: function () {
                             var record = grid.getSelectionModel().getSelected();
                             if (record) {
                             var feature = featureFromText(record.data.the_geom);
                             mapPanel1.map.zoomToExtent(feature.geometry.getBounds());
                             } else {
                             com.icg.errors.mustSelect();
                             }
                             }
                             }, {
                             text: 'Cargar todo',
                             iconCls: 'zoomin',
                             tooltip: 'Cargar todo el resultado',
                             handler: function () {
                             objectselected.removeAllFeatures();
                             grid.store.each(function (record) {
                             console.log(record.data);
                             var feature = featureFromText(record.data.the_geom);
                             objectselected.addFeatures([feature]);
                             });
                             
                             //                                        var feature = featureFromText(record.data.the_geom);
                             //                                        mapPanel1.map.zoomToExtent(feature.geometry.getBounds());
                             //                                        canvas.removeAllFeatures();
                             //                                        canvas.addFeatures(feature);
                             //                                        modifyControl.activate();
                             
                             }
                             }, '-', {
                             text: 'Dar de baja',
                             iconCls: 'delete',
                             tooltip: 'Dar de baja un stock',
                             handler: function () {
                             var record = grid.getSelectionModel().getSelected();
                             if (record) {
                             if (record.data.expirado) {
                             domain.Tools.deleteStock({
                             grid: grid,
                             record: record
                             });
                             } else {
                             Ext.MessageBox.show({
                             title: 'Aviso',
                             msg: 'El stock aún no ha expirado.',
                             buttons: Ext.MessageBox.OK,
                             icon: Ext.Msg.WARNING
                             });
                             }
                             } else {
                             com.icg.errors.mustSelect();
                             }
                             }
                             }, '-', {
                             text: 'Informe...',
                             iconCls: 'printer',
                             tooltip: 'Imprimir un informe.',
                             handler: function () {
                             domain.Tools.imprimirInforme();
                             }
                             }, '-',*/ {
                                text: 'Acercar',
                                iconCls: 'zoomin',
                                tooltip: 'Acercar al objeto',
                                handler: function () {
                                    options.map.zoomIn();
                                }
                            }, {
                                text: 'Alejar',
                                iconCls: 'zoomout',
                                tooltip: 'Alejar',
                                handler: function () {
                                    options.map.zoomOut();
                                }
                            }
                        ]
                    }).show();
                },
                editFeature: function (options) {
                    if (this.objectselected.features.length === 1) {
                        options.map.zoomToExtent(this.objectselected.features[0].geometry.getBounds());
                        var feature = this.featureFromText(this.objectselected.features[0].geometry.toString());
                        this.canvas.removeAllFeatures();
                        this.canvas.addFeatures(feature);

                        var wintool = new Ext.Window({
                            title: 'Herramientas',
                            border: false,
                            collapsible: true,
                            resizable: false,
                            width: 400,
                            height: 40,
                            x: 200,
                            y: 90,
                            layout: 'border',
                            items: [],
                            tbar: [{
                                    iconCls: 'zoomin',
                                    tooltip: 'Acercar',
                                    handler: function () {
                                        options.map.zoomIn();
                                    }
                                }, {
                                    iconCls: 'zoomout',
                                    tooltip: 'Alejar',
                                    handler: function () {
                                        options.map.zoomOut();
                                    }
                                }, '-', {
                                    iconCls: 'save',
                                    tooltip: 'Guardar',
                                    scope: this,
                                    handler: function () {
                                        var f = this.objectselected.features[0];
                                        console.log(f);
                                        domain.objects.submitFeature({
                                            id: f.attributes['parcela_id'],
                                            control: wintool
                                        });
                                    }
                                }, '->', {
                                    text: 'Cancelar',
                                    iconCls: 'cancel',
                                    tooltip: 'Cancelar',
                                    scope: this,
                                    handler: function () {
                                        this.canvas.removeAllFeatures();
                                        this.modifyControl.deactivate();
                                        wintool.close();
                                    }
                                }
                            ]
                        }).show();

                        this.modifyControl.activate();
                    } else {
                        com.icg.errors.mustSelectFeature();
                    }
                },
                cancelEditing: function (options) {
                    domain.objects.drawControl.deactivate();
                    domain.objects.modifyControl.deactivate();
                    domain.objects.dragControl.deactivate();
                    domain.objects.canvas.removeAllFeatures();
                    domain.controlSwitches.geoEditing = false;
                    if (options.panel) {
                        //options.panel.removeAll();
                        //options.panel.doLayout();
                    }
                },
                /* New FeatureEditingTool v 2.0 01/2015
                 * Params options {map}
                 */
                newFeatures: function (options) {
                    if (!domain.controlSwitches.geoEditing) {
                        //Start Editing Switch
                        domain.controlSwitches.geoEditing = true;

                        this.canvas.removeAllFeatures();
                        //Editing toolBar
                        var wintool = new Ext.Window({
                            title: 'Herramientas',
                            border: false,
                            collapsible: true,
                            resizable: false,
                            width: 400,
                            height: 40,
                            x: 400,
                            y: 90,
                            layout: 'border',
                            items: [],
                            listeners: {
                                "close": function () {
                                    domain.objects.cancelEditing({
                                        panel: options.panel
                                    });
                                }
                            },
                            tbar: [{
                                    iconCls: 'zoomin',
                                    tooltip: 'Acercar mapa',
                                    handler: function () {
                                        options.map.zoomIn();
                                    }
                                }, {
                                    iconCls: 'zoomout',
                                    tooltip: 'Alejar mapa',
                                    handler: function () {
                                        options.map.zoomOut();
                                    }
                                }, {
                                    iconCls: 'featureextent',
                                    tooltip: 'Enfocar objeto',
                                    scope: this,
                                    handler: function () {
                                        if (this.canvas.features.length === 1) {
                                            options.map.zoomToExtent(this.canvas.features[0].geometry.getBounds());
                                        } else {

                                        }
                                    }
                                }, '-', {
                                    text: 'Editar',
                                    iconCls: 'featureedit',
                                    tooltip: 'Editar objeto',
                                    scope: this,
                                    handler: function () {
                                        if (this.canvas.features.length === 1) {
                                            this.drawControl.deactivate();
                                            this.dragControl.deactivate();
                                            this.modifyControl.activate();
                                            this.modifyControl.selectControl.select(this.canvas.features[0]);
                                        } else {

                                        }
                                    }
                                }, {
                                    text: 'Mover',
                                    iconCls: 'featuremove',
                                    tooltip: 'Mover objeto',
                                    scope: this,
                                    handler: function () {
                                        if (this.canvas.features.length === 1) {
                                            this.drawControl.deactivate();
                                            this.modifyControl.deactivate();
                                            this.dragControl.activate();
                                        } else {

                                        }
                                    }
                                }, '-', {
                                    iconCls: 'information',
                                    tooltip: 'Información de objeto',
                                    scope: this,
                                    handler: function () {
                                        if (this.canvas.features.length === 1) {
                                            var dataFeature = {
                                                "Área": this.canvas.features[0].geometry.getArea(),
                                                "Longitud": this.canvas.features[0].geometry.getLength()
                                            };
                                            new Ext.Window({
                                                title: "Información",
                                                width: 300,
                                                height: 120,
                                                layout: "fit",
                                                collapsible: true,
                                                x: 400,
                                                y: 150,
                                                closeAction: 'hide',
                                                items: [{
                                                        xtype: "propertygrid",
                                                        source: dataFeature
                                                    }]
                                            }).show();
                                        } else {

                                        }
                                    }
                                }, '->', {
                                    iconCls: 'canvasclean',
                                    tooltip: 'Limpiar / Borrar',
                                    scope: this,
                                    handler: function () {
                                        this.canvas.removeAllFeatures();
                                        this.drawControl.activate();
                                        this.modifyControl.deactivate();
                                        this.dragControl.deactivate();
                                    }
                                }, '-', {
                                    text: 'Cancelar',
                                    iconCls: 'cancel',
                                    tooltip: 'Cancelar edición',
                                    scope: this,
                                    handler: function () {
                                        domain.objects.cancelEditing({
                                            panel: options.panel
                                        });
                                        wintool.close();
                                    }
                                }]
                        }).show();

                        //Control draw activate
                        this.drawControl.activate();

                        //Listener for addFeature : When Draw is finish
                        this.drawControl.featureAdded = function (feature) {
                            domain.objects.drawControl.deactivate();
                        };

                        //Alphanumeric DATA FORM
                        options.wintool = wintool;
                        domain.objects.editForm(options);

                    } else {
                        //geoEditing is true
                        com.icg.errors.warn("Actualmente esta editando.");
                    }
                },
                editFeatures: function (options) {
                    if (!domain.controlSwitches.geoEditing) {
                        if (this.objectselected.features.length === 1) {
                            domain.controlSwitches.geoEditing = true;
                            options.map.zoomToExtent(this.objectselected.features[0].geometry.getBounds());
                            var feature = this.featureFromText(this.objectselected.features[0].geometry.toString());
                            this.canvas.removeAllFeatures();
                            this.canvas.addFeatures(feature);
//                            if(this.objectselected.features[0].fid) {
//                                //feature from WFS service
//                                options.record = feature;
//                            }
                            //Editing toolBar
                            var wintool = new Ext.Window({
                                title: 'Herramientas',
                                border: false,
                                collapsible: true,
                                resizable: false,
                                width: 400,
                                height: 40,
                                x: 400,
                                y: 90,
                                layout: 'border',
                                items: [],
                                listeners: {
                                    "close": function () {
                                        domain.objects.cancelEditing({
                                            panel: options.panel
                                        });
                                        options.panelSearch.enable();
                                    }
                                },
                                tbar: [{
                                        iconCls: 'zoomin',
                                        tooltip: 'Acercar mapa',
                                        handler: function () {
                                            options.map.zoomIn();
                                        }
                                    }, {
                                        iconCls: 'zoomout',
                                        tooltip: 'Alejar mapa',
                                        handler: function () {
                                            options.map.zoomOut();
                                        }
                                    }, {
                                        iconCls: 'featureextent',
                                        tooltip: 'Enfocar objeto',
                                        scope: this,
                                        handler: function () {
                                            if (this.canvas.features.length === 1) {
                                                options.map.zoomToExtent(this.canvas.features[0].geometry.getBounds());
                                            } else {

                                            }
                                        }
                                    }, '-', {
                                        text: 'Editar',
                                        iconCls: 'featureedit',
                                        tooltip: 'Editar objeto',
                                        scope: this,
                                        handler: function () {
                                            if (this.canvas.features.length === 1) {
                                                this.drawControl.deactivate();
                                                this.dragControl.deactivate();
                                                this.modifyControl.activate();
                                                this.modifyControl.selectControl.select(this.canvas.features[0]);
                                            } else {

                                            }
                                        }
                                    }, {
                                        text: 'Mover',
                                        iconCls: 'featuremove',
                                        tooltip: 'Mover objeto',
                                        scope: this,
                                        handler: function () {
                                            if (this.canvas.features.length === 1) {
                                                this.drawControl.deactivate();
                                                this.modifyControl.deactivate();
                                                this.dragControl.activate();
                                            } else {

                                            }
                                        }
                                    }, '-', {
                                        iconCls: 'information',
                                        tooltip: 'Información de objeto',
                                        scope: this,
                                        handler: function () {
                                            if (this.canvas.features.length === 1) {
                                                var dataFeature = {
                                                    "Área": this.canvas.features[0].geometry.getArea(),
                                                    "Longitud": this.canvas.features[0].geometry.getLength()
                                                };
                                                new Ext.Window({
                                                    title: "Información",
                                                    width: 300,
                                                    height: 120,
                                                    layout: "fit",
                                                    collapsible: true,
                                                    x: 400,
                                                    y: 150,
                                                    closeAction: 'hide',
                                                    items: [{
                                                            xtype: "propertygrid",
                                                            source: dataFeature
                                                        }]
                                                }).show();
                                            } else {

                                            }
                                        }
                                    }, '->', {
                                        iconCls: 'canvasclean',
                                        tooltip: 'Limpiar / Borrar',
                                        scope: this,
                                        disabled: true,
                                        handler: function () {
                                            this.canvas.removeAllFeatures();
                                            this.drawControl.activate();
                                            this.modifyControl.deactivate();
                                            this.dragControl.deactivate();
                                        }
                                    }, '-', {
                                        text: 'Cancelar',
                                        iconCls: 'cancel',
                                        tooltip: 'Cancelar edición',
                                        scope: this,
                                        handler: function () {
                                            domain.objects.cancelEditing({
                                                panel: options.panel
                                            });
                                            options.panelSearch.enable();
                                            wintool.close();
                                        }
                                    }]
                            }).show();
                            options.panelSearch.disable();
                            //Modify control activate
                            this.modifyControl.activate();

                            //Alphanumeric DATA FORM
                            options.wintool = wintool;
                            domain.objects.editForm(options);
                        } else {
                            //not any object is selected
                            com.icg.errors.mustSelectFeature();
                        }
                    } else {
                        //geoEditing is true
                        com.icg.errors.warn("Actualmente esta editando.");
                    }
                },
                submitNewFeatures: function (options) {
                    var array = new Array();
                    Ext.each(this.canvas.features, function (f) {
                        array.push(f.geometry.toString());
                    });
                    Ext.Ajax.request({
                        url: Ext.SROOT + 'gestion/savefeatures',
                        method: 'POST',
                        scope: this,
                        params: {
                            name: 'parcela',
                            features: array,
                            length: array.length
                        },
                        success: function (result, request) {
                            this.canvas.removeAllFeatures();
                            this.drawControl.deactivate();
                            this.layerWriteable.redraw(true);
                            options.control.close();
                        },
                        failure: function (result, request) {

                        }
                    });
                },
                submitFeature: function (options) {

                    var f = this.canvas.features[0];

                    Ext.Ajax.request({
                        url: Ext.SROOT + 'gestion/updatefeature',
                        method: 'POST',
                        scope: this,
                        params: {
                            name: 'parcela',
                            pk: 'parcela_id',
                            feature: f.geometry.toString(),
                            id: options.id
                        },
                        success: function (result, request) {
                            this.canvas.removeAllFeatures();
                            this.modifyControl.deactivate();
                            this.layerWriteable.redraw(true);
                            options.control.close();
                        },
                        failure: function (result, request) {

                        }
                    });
                },
                deleteFeature: function (options) {
                    if (!domain.controlSwitches.geoEditing) {
                        if (this.objectselected.features.length === 1) {
                            options.map.zoomToExtent(this.objectselected.features[0].geometry.getBounds());
                            var f = this.objectselected.features[0];
                            Ext.MessageBox.confirm('Confirmar', '¿Confirma eliminar el objeto?', function (r) {
                                if (r === 'yes') {
                                    Ext.Ajax.request({
                                        url: Ext.SROOT + 'zona/eliminarzona',
                                        method: 'POST',
                                        params: {
                                            id: options.record.get("zona_id")
                                        },
                                        success: function (result, request) {
                                            domain.objects.layerWriteable.redraw(true);
                                            options.panel.removeAll();
                                            options.panel.doLayout();
                                            options.grid.store.reload();
                                            domain.objects.objectselected.removeAllFeatures();
                                        },
                                        failure: function (result, request) {

                                        }
                                    });
                                }
                            });

                            this.modifyControl.activate();
                        } else {
                            com.icg.errors.mustSelectFeature();
                        }
                    } else {
                        //geoEditing is true
                        com.icg.errors.warn("Actualmente esta editando.");
                    }
                },
                viewForm: function (options) {

                    var form = new Ext.FormPanel({
                        //border: true,
                        frame: false,
                        //region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 100,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%',
                            readOnly: true
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Nombre zona',
                                name: 'nombre',
                                allowBlank: false
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Clave',
                                name: 'clave',
                                allowBlank: false
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Origen',
                                name: 'origen',
                                allowBlank: false
                            }, {
                                xtype: 'numberfield',
                                fieldLabel: 'Superficie',
                                name: 'superficie',
                                allowBlank: false
                            }, {
                                xtype: 'numberfield',
                                fieldLabel: 'Perimetro',
                                name: 'perimetro',
                                allowBlank: false
                            }, {
                                xtype: 'textarea',
                                fieldLabel: 'Observaciones',
                                name: 'observaciones'
                            }]
                    });

                    options.panel.removeAll();
                    options.panel.add(form);
                    options.panel.doLayout();
                    //form.disable();
                    form.getForm().loadRecord(options.record);
                },
                editForm: function (options) {

                    //The_geom field hidden
                    var geomfield = new Ext.form.Hidden({
                        name: 'the_geom'
                    });
                    var form = new Ext.FormPanel({
                        frame: true,
                        url: Ext.SROOT + (options.record ? 'zona/guardarzona' : 'zona/crearzona'),
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 100,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Nombre zona',
                                name: 'nombre',
                                allowBlank: false
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Clave',
                                name: 'clave',
                                allowBlank: false
                            }, {
                                xtype: 'textfield',
                                fieldLabel: 'Origen',
                                name: 'origen',
                                allowBlank: false
                            }, {
                                xtype: 'numberfield',
                                fieldLabel: 'Superficie',
                                name: 'superficie',
                                allowBlank: false
                            }, {
                                xtype: 'numberfield',
                                fieldLabel: 'Perimetro',
                                name: 'perimetro',
                                allowBlank: false
                            }, {
                                xtype: 'textarea',
                                fieldLabel: 'Observaciones',
                                name: 'observaciones'
                            }, {
                                xtype: 'hidden',
                                name: 'zona_id',
                            }, geomfield],
                        buttons: [{
                                text: "Guardar",
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        if (domain.controlSwitches.geoEditing && domain.objects.canvas.features.length === 1) {
                                            geomfield.setValue(domain.objects.canvas.features[0].geometry.toString());
                                            form.getForm().submit({
                                                success: function (form, action) {
                                                    options.wintool.close();
                                                    domain.objects.cancelEditing({
                                                        panel: options.panel
                                                    });
                                                    if (options.grid) {
                                                        domain.objects.objectselected.removeAllFeatures();
                                                        options.grid.store.reload();
                                                    }
                                                    domain.objects.layerWriteable.redraw(true);
                                                },
                                                failure: function (form, action) {
                                                    domain.errors.submitFailure('Error', 'Error en los datos del formularo.');
                                                }
                                            });
                                        } else {
                                            com.icg.errors.error("No está en edición ningun objeto..");
                                        }
                                    } else {
                                        //if form is invalid
                                    }
                                }
                            }]
                    });

                    options.panel.removeAll();
                    options.panel.add(form);
                    options.panel.doLayout();
                    //load editing record
                    if (options.record) {
                        form.getForm().loadRecord(options.record);
//                        setTimeout(function () {
//                            form.getForm().loadRecord(options.record);
//                        }, 1000);
                    }
                }
            };

            domain.Panel = {
                init: function () {
                    var mapPanel1 = domain.objects.mapa({});

                    var mapa = new Ext.Panel({
                        region: 'center',
                        layout: 'fit',
                        items: [mapPanel1]
                    });

                    //Store for manzanas
                    var store = new Ext.data.JsonStore({
                        url: Ext.SROOT + 'zona/list/zonas',
                        propertyId: 'zona_id',
                        root: 'data',
                        fields: [
                            {name: 'zona_id'},
                            {name: 'clave'},
                            {name: 'nombre'},
                            {name: 'origen'},
                            {name: 'observaciones'},
                            {name: 'superficie'},
                            {name: 'perimetro'},
                            {name: 'the_geom'}
                        ],
                        listeners: {
                            load: function (selModel, record, index, options) {
                                grid.getSelectionModel().selectFirstRow();
                            }
                        }
                    });
                    //Grid for manzanas
                    var grid = new Ext.grid.GridPanel({
                        title: 'Zonas',
                        region: 'center',
                        loadMask: true,
                        selModel: new Ext.grid.RowSelectionModel({singleSelect: true}),
                        columns: [new Ext.grid.RowNumberer({
                                width: 27
                            }),
                            {header: "Clave", width: 90, sortable: true, dataIndex: 'clave'},
                            {header: "Nombre", width: 130, sortable: true, dataIndex: 'nombre'},
                            {header: "Superficie", width: 70, sortable: true, dataIndex: 'superficie'},
                            {header: "Perímetro", width: 70, sortable: true, dataIndex: 'perimetro'}
                        ],
                        store: store
                    });
                    //Grid select Action
                    grid.getSelectionModel().on('rowselect', function (sm, rowindex, record) {
                        if (!domain.controlSwitches.geoEditing) {
                            var feature = domain.objects.featureFromText(record.data.the_geom, {
                                fid: record.data.id
                            });
                            domain.objects.selectFeature(mapPanel1.map, feature, true);
                            domain.objects.viewForm({
                                panel: panelRigth,
                                record: record
                            });
                        } else {
                            //geoEditing is true
                            com.icg.errors.warn("Actualmente esta editando.");
                        }
                    });
                    //Global Access
                    domain.Panel.grid = grid;

                    //Search Form
                    var form = new Ext.FormPanel({
                        frame: true,
                        region: 'north',
                        autoHeight: true,
                        bodyStyle: 'padding:10px',
                        labelWidth: 80,
                        waitTitle: 'Procesando...',
                        defaults: {
                            msgTarget: 'side',
                            anchor: '95%'
                        },
                        items: [{
                                xtype: 'textfield',
                                fieldLabel: 'Zona (Clave)',
                                name: 'clave',
                                allowBlank: false
                            }],
                        buttons: [{
                                text: "Buscar",
                                handler: function () {
                                    if (form.getForm().isValid()) {
                                        store.load({
                                            params: form.getForm().getValues()
                                        });
                                    }
                                }
                            }]
                    });

                    var panelLeft = new Ext.Panel({
                        title: 'Buscar',
                        region: 'west',
                        split: true,
                        collapsible: true,
                        width: 350,
                        layout: 'border',
                        items: [form, grid]
                    });

                    var panelRigth = new Ext.Panel({
                        title: 'Informacion',
                        region: 'east',
                        split: true,
                        collapsible: true,
                        width: 350,
                        layout: 'fit',
                        items: [],
                        tbar: [{
                                text: 'Nuevo',
                                iconCls: 'create',
                                tooltip: 'Crear nuevo',
                                handler: function () {
                                    domain.objects.newFeatures({
                                        map: mapPanel1.map,
                                        panel: panelRigth
                                    });
                                }
                            }, {
                                text: 'Editar',
                                iconCls: 'update',
                                tooltip: 'Editar datos',
                                handler: function () {
                                    domain.objects.editFeatures({
                                        map: mapPanel1.map,
                                        panel: panelRigth,
                                        grid: grid,
                                        panelSearch: panelLeft,
                                        record: grid.getSelectionModel().getSelected()
                                    });
                                }
                            }, {
                                text: 'Eliminar',
                                iconCls: 'delete',
                                tooltip: 'Eliminar objeto',
                                handler: function () {
                                    domain.objects.deleteFeature({
                                        map: mapPanel1.map,
                                        panel: panelRigth,
                                        grid: grid,
                                        panelSearch: panelLeft,
                                        record: grid.getSelectionModel().getSelected()
                                    });
                                }
                            }]
                    });

                    new Ext.Viewport({
                        layout: 'border',
                        items: [panelLeft, mapa, panelRigth]
                    });

                    //mapPanel1.map.zoomTo(16);
                }
            };

            Ext.onReady(domain.Panel.init, domain.Panel);
        </script> 
    </head>
    <body>        
    </body>
</html>

