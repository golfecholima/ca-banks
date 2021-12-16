mapboxgl.accessToken = 'pk.eyJ1IjoiY2FsbmV3c3Jvb20iLCJhIjoiY2ttYzhwZ2wyMDVobTJwbXhiaG81bXpzdSJ9.xnkn2BlbVZvFfGukyV_-0g';

const bounds = [
    [-179.691800, 0.572312], // Southwest coordinates 
    [-31.805816, 76.179739] // Northeast coordinates 
];

const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/calnewsroom/ckx6l8sfn4wyo14mxp414cb5v', // style URL
    center: [-119.5788478538649, 36.498509688945572], // starting position [lng, lat]
    maxZoom: 16, // sets max zoom
    minZoom: 2, // sets min zoom
    zoom: 2, // starting zoom
    maxBounds: bounds, // restrict panning area
    pitchWithRotate: false, // restrict picth
    hash: true // enable custon center/zoom via URL
});

// Add icons

// map.loadImage('./assets/outline_local_fire_department_black_18dp_2x.png', (error, image) => {
//     if (error) throw error;
//     // add image to the active style and make it SDF-enabled
//     map.addImage('fire', image, { sdf: true });
// });

// map.loadImage('./assets/pattern.png', (error, image) => {
//     if (error) throw error;
//     // add image to the active style and make it SDF-enabled
//     map.addImage('pattern', image, { sdf: true });
// });

map.on('load', () => {

    // Add sources

    map.addSource('centroids', {
        type: 'vector',
        // Use any Mapbox-hosted tileset using its tileset id.
        // Learn more about where to find a tileset id:
        // https://docs.mapbox.com/help/glossary/tileset-id/
        url: 'mapbox://calnewsroom.2w0fzrho'
        // cluster: true,
        // clusterMaxZoom: 10, // Max zoom to cluster points on
        // clusterRadius: 50
    });

    // Add layers w/ styling

    // // Add clusters
    // map.addLayer({
    //     'id': 'clusters',
    //     'type': 'circle',
    //     'source': 'centroids',
    //     'source-layer': 'blocks',
    //     'layout': {
    //         'visibility': 'visible'
    //     },
    //     'filter': ['has', 'point_count'],
    //     'paint': {
    //         // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
    //         // with three steps to implement three types of circles:
    //         //   * Blue, 20px circles when point count is less than 100
    //         //   * Yellow, 30px circles when point count is between 100 and 750
    //         //   * Pink, 40px circles when point count is greater than or equal to 750
    //         'circle-color': [
    //             'step',
    //             ['get', 'point_count'],
    //             '#51bbd6',
    //             100,
    //             '#f1f075',
    //             750,
    //             '#f28cb1'
    //         ],
    //         'circle-radius': [
    //             'step',
    //             ['get', 'point_count'],
    //             20,
    //             100,
    //             30,
    //             750,
    //             40
    //         ]
    //     }
    //     // 'paint': {
    //     //     'circle-color': 'cornflowerblue',
    //     //     'circle-radius': [
    //     //         'step',
    //     //         ['get', 'point_count'], 6, 2, 8, 4, 10, 6, 12, 8, 14, 10, 16
    //     //     ]
    //     // }
    // });

    // // Add cluster text
    // map.addLayer({
    //     'id': 'cluster-count',
    //     'type': 'symbol',
    //     'source': 'centroids',
    //     'source-layer': 'blocks',
    //     'filter': ['has', 'point_count'],
    //     'layout': {
    //         'visibility': 'visible',
    //         'text-field': '{point_count}',
    //         'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
    //         'text-size': 10
    //     },
    //     'paint': {
    //         'text-color': 'white'
    //     }
    // });

    // Add race/ethnicity >1mi
    map.addLayer({
        'id': '>1mi race/ethnicity',
        'type': 'circle',
        'source': 'centroids',
        'source-layer': 'distancetobanksblockdemographics',
        'filter': [
            'all',
            ['<', 1, ['number', ['get', 'HubDist']]]
        ],
        'layout': {
            'visibility': 'visible'
        },
        'paint': {
            // Make circles larger as the user zooms
            'circle-radius': {
                'base': 1.75,
                'stops': [
                    [5, 2],
                    [12, 3],
                    [16, 6]
                ]
            },
            // Color circles by race/ethnicity, using a `match` expression.
            'circle-color': [
                'match',
                ['get', 'Block Group'],
                'White',
                'orange',
                'Black',
                'purple',
                'Latinx',
                'green',
                'Asian',
                'pink',
                'Native Continental',
                'blue',
                'Native Islands',
                'cornflowerblue',
                'cyan'
            ]
        }
    });

    // Add race/ethnicity >10mi
    map.addLayer({
        'id': '>10mi race/ethnicity',
        'type': 'circle',
        'source': 'centroids',
        'source-layer': 'distancetobanksblockdemographics',
        'filter': [
            'all',
            ['<', 10, ['number', ['get', 'HubDist']]]
        ],
        'layout': {
            'visibility': 'visible'
        },
        'paint': {
            // Make circles larger as the user zooms
            'circle-radius': {
                'base': 4,
                'stops': [
                    [5, 6],
                    [16, 6]
                ]
            },
            // Color circles by race/ethnicity, using a `match` expression.
            'circle-color': [
                'match',
                ['get', 'Block Group'],
                'White',
                'orange',
                'Black',
                'purple',
                'Latinx',
                'green',
                'Asian',
                'pink',
                'Native Continental',
                'blue',
                'Native Islands',
                'cornflowerblue',
                'cyan'
            ]
        }
    });

    // Add >1mi Majority-minority
    map.addLayer({
        'id': '>1mi Majority-minority',
        'type': 'circle',
        'source': 'centroids',
        'source-layer': 'distancetobanksblockdemographics',
        'filter': [
            'all',
            ['>', 50, ['number', ['get', 'pct_white']]],
            ['<', 1, ['number', ['get', 'HubDist']]]
        ],
        'layout': {
            'visibility': 'visible'
        },
        'paint': {
            // Make circles larger as the user zooms
            'circle-radius': {
                'base': 1.75,
                'stops': [
                    [5, 2],
                    [12, 3],
                    [16, 6]
                ]
            },
            // Color circles by race/ethnicity, using a `match` expression.
            'circle-color': 'red'
        }
    });

    // Add <1mi Majority-white
    map.addLayer({
        'id': '<1mi Majority-white',
        'type': 'circle',
        'source': 'centroids',
        'source-layer': 'distancetobanksblockdemographics',
        'filter': [
            'all',
            ['<', 50, ['number', ['get', 'pct_white']]],
            ['>', 1, ['number', ['get', 'HubDist']]]
        ],
        'layout': {
            'visibility': 'visible'
        },
        'paint': {
            // Make circles larger as the user zooms
            'circle-radius': {
                'base': 1.75,
                'stops': [
                    [5, 2],
                    [12, 3],
                    [16, 6]
                ]
            },
            // Color circles by race/ethnicity, using a `match` expression.
            'circle-color': 'yellow'
        }
    });

    // Add distance 'heatmap'
    map.addLayer({
        'id': 'Distance',
        'type': 'circle',
        'source': 'centroids',
        'source-layer': 'distancetobanksblockdemographics',
        // 'filter': [
        //     'all',
        //     ['<', 10, ['number', ['get', 'HubDist']]]
        // ],
        'layout': {
            'visibility': 'visible'
        },
        'paint': {
            // Make circles larger as the user zooms
            'circle-radius': {
                'base': 1.75,
                'stops': [
                    [5, 2],
                    [12, 3],
                    [16, 6]
                ]
            },
            'circle-color': {
                property: 'HubDist',
                type: 'exponential',
                stops: [
                    [0, '#f2f0f7'],
                    [0.5, '#dadaeb'],
                    [1, '#bcbddc'],
                    [2, '#9e9ac8'],
                    [4, '#807dba'],
                    [8, '#6a51a3'],
                    [16, '#4a1486']
                ]
            },
        }
    });

    // Mouse pointer behavior
    map.on('mousemove', (e) => {
        const layers = ['>1mi race/ethnicity', '>10mi race/ethnicity', '>1mi Majority-minority', '<1mi Majority-white', 'Distance'];
        const features = map.queryRenderedFeatures(e.point, {
            layers: layers
        });

        if (features.length) {
            map.getCanvas().style.cursor = 'pointer'
        } else {
            map.getCanvas().style.cursor = ''
        }

    });

    // inspect a cluster on click
    map.on('click', 'clusters', (e) => {
        const features = map.queryRenderedFeatures(e.point, {
            layers: ['clusters']
        });
        const clusterId = features[0].properties.cluster_id;
        map.getSource('centroids').getClusterExpansionZoom(
            clusterId,
            (err, zoom) => {
                if (err) return;

                map.easeTo({
                    center: features[0].geometry.coordinates,
                    zoom: zoom
                });
            }
        );
    });

    // When a click event occurs on a feature in
    // the unclustered-point layer, open a popup at
    // the location of the feature, with
    // description HTML from its properties.

    layers = ['>1mi race/ethnicity', '>10mi race/ethnicity', '>1mi Majority-minority', '<1mi Majority-white', 'Distance']

    for (let i = 0; i < layers.length; i++) {

        map.on('click', layers[i], (e) => {
            const coordinates = e.features[0].geometry.coordinates.slice();
            const plur = e.features[0].properties['Block Group'];
            const dist = e.features[0].properties.HubDist;
            const pop = e.features[0].properties.total;
            const wht = e.features[0].properties.pct_white;
            const blk = e.features[0].properties.geographic_area_name;

            // Ensure that if the map is zoomed out such that
            // multiple copies of the feature are visible, the
            // popup appears over the copy being pointed to.
            while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
                coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
            }

            new mapboxgl.Popup()
                .setLngLat(coordinates)
                .setHTML(
                    `Block plurality: ${plur}<br>
                    Miles to bank: ${dist}<br>
                    Population total: ${pop}<br>
                    Pct. White: ${wht}<br>
                    ${blk}`
                )
                .addTo(map);
        });
    }

    map.on('mouseenter', 'clusters', () => {
        map.getCanvas().style.cursor = 'pointer';
    });
    map.on('mouseleave', 'clusters', () => {
        map.getCanvas().style.cursor = '';
    });

});

// MOBILE FIRST ZOOM LEVELS/CENTERS

var width = window.innerWidth;

if (width >= '1000') {
    setTimeout(function () {
        map.flyTo({
            zoom: 5.5,
            center: [-122.914, 37.695]
        }), 5000
    })
} else if (width >= '750') {
    setTimeout(function () {
        map.flyTo({
            zoom: 4.5,
            center: [-122.914, 35.695]
        }), 5000
    })
} else {
    setTimeout(function () {
        map.flyTo({
            zoom: 4.5,
            center: [-120.914, 35.695]
        }), 5000
    })
}

// CONTROLS

// TOGGLING LAYERS
// After the last frame rendered before the map enters an "idle" state.
map.on('idle', () => {

    // If these layers were not added to the map, abort
    if (!map.getLayer('>1mi race/ethnicity') || !map.getLayer('>10mi race/ethnicity') || !map.getLayer('>1mi Majority-minority') || !map.getLayer('<1mi Majority-white') || !map.getLayer('Distance')) {
        return;
    }

    // Enumerate layer ids and svgs.
    const layerSVG = {
        '>1mi race/ethnicity': '',
        '>10mi race/ethnicity': '',
        '>1mi Majority-minority': '',
        '<1mi Majority-white': '',
        'Distance': '',
    }

    // Set up the corresponding toggle button for each layer.
    for (const [layer, svg] of Object.entries(layerSVG)) {
        // Skip layers that already have a button set up.
        if (document.getElementById(layer)) {
            continue;
        }

        // Create a button.
        const button = document.createElement('button');
        var checkbox = '<label class="container">' + layer + '<input id="' + layer.replace(/\s+/g, '') + '-check" type="checkbox" checked="checked" tabindex ="-1"><label for="' + layer.replace(/\s+/g, '') + '"></label><span class="checkmark"></span></label>'
        button.id = layer;
        button.innerHTML += checkbox + svg;
        button.className = 'active';

        // Show or hide layer when the toggle is clicked.
        button.onclick = function (e) {
            const check = document.getElementById(layer.replace(/\s+/g, '') + '-check')
            const clickedLayer = this.id;
            e.preventDefault();
            e.stopPropagation();

            const visibility = map.getLayoutProperty(
                clickedLayer,
                'visibility'
            );

            // Toggle layer visibility by changing the layout object's visibility property.
            if (visibility === 'visible') {
                map.setLayoutProperty(clickedLayer, 'visibility', 'none');
                this.className = '';
                check.checked = !check.checked;

                if (button.id === 'Fire origins') {
                    map.setLayoutProperty('clusters', 'visibility', 'none');
                    // map.setLayoutProperty('cluster-count', 'visibility', 'none');
                }

            } else {
                map.setLayoutProperty(clickedLayer, 'visibility', 'visible');
                this.className = 'active';
                check.checked = !check.checked;

                if (button.id === 'Fire origins') {
                    map.setLayoutProperty('clusters', 'visibility', 'visible');
                    // map.setLayoutProperty('cluster-count', 'visibility', 'visible');
                }

            }

        };

        const layers = document.getElementById('menu');
        layers.appendChild(button);

    }

});

// Search
map.addControl(
    new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        countries: 'us ca',
        mapboxgl: mapboxgl
    }),
    'top-left',
);

document.querySelector('.mapboxgl-ctrl-geocoder--input').placeholder = "State, City, Zip, Address";

// Zoom in/out, compass, fullscreen
const nav = new mapboxgl.NavigationControl({
    visualizePitch: true
});
map.addControl(nav, 'bottom-right');

// Disable rotate and pitch
map.dragRotate.disable();

map.addControl(new mapboxgl.FullscreenControl({
    container: document.querySelector('body')
}));

// Geolocation option
map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: { enableHighAccuracy: true },
    trackUserLocation: true,
    showUserHeading: true
}));

// Scale ruler
const scale = new mapboxgl.ScaleControl({
    maxWidth: 80,
    unit: 'imperial'
});
map.addControl(scale);

scale.setUnit('imperial');



// // Clusters / Popups
// // Inspect a cluster on click
// map.on('click', 'clusters', (e) => {
//     const features = map.queryRenderedFeatures(e.point, {
//         layers: ['clusters']
//     });
//     const clusterId = features[0].properties.cluster_id;
//     map.getSource('NIFC Points').getClusterExpansionZoom(
//         clusterId,
//         (err, zoom) => {
//             if (err) return;

//             map.easeTo({
//                 center: features[0].geometry.coordinates,
//                 zoom: zoom
//             });
//         }
//     );
// });

// // Bespoke popup behavior for points v polygons
// map.on('click', function (e) {

//     let f = map.queryRenderedFeatures(e.point, { layers: ['Fire origins', 'Fire perimeters', 'clusters'] }); // Needed to avoid duplicate popups for origin points that fall on top of polygons

//     if (f.length) { // Needed to avoid duplicate popups for origin points that fall on top of polygons

//         // Points - Fire origins section
//         if (f[0].properties.IncidentName) {

//             // Query all features from a single layer
//             const poly_features = map.querySourceFeatures('NIFC Polygons', {
//                 sourceLayer: 'nifc_polygons'
//             });

//             var irwinid = f[0].properties.IrwinID

//             for (let i = 0; i < poly_features.length; i++) {

//                 var poly_id = poly_features[i].properties.irwin_IrwinID

//                 if (irwinid === poly_id) {
//                     var mp = turf.multiPolygon(poly_features[i].geometry)
//                     var bbox = turf.bbox(mp.geometry.coordinates)
//                     var cen = turf.centroid(poly_features[i].geometry)


//                     if (window.innerHeight <= '700') {
//                         map.fitBounds(bbox, {
//                             padding:
//                                 { top: 50, bottom: 150, left: 50, right: 50 }
//                         });
//                     } else {
//                         map.fitBounds(bbox, {
//                             padding:
//                                 { top: 100, bottom: 100, left: 100, right: 100 }
//                         });
//                     }

//                     var fire_name = poly_features[i].properties.poly_IncidentName.toUpperCase()
//                     var cost = 'Unknown'
//                     var acres = 'Unknown'
//                     var contained = 'Unknown'

//                     if (poly_features[i].properties.irwin_PercentContained >= 0) {
//                         contained = poly_features[i].properties.irwin_PercentContained + '%'
//                     }

//                     if (poly_features[i].properties.irwin_DailyAcres >= 0) {
//                         acres = Math.round(poly_features[i].properties.irwin_DailyAcres).toLocaleString()
//                     }

//                     if (poly_features[i].properties.irwin_EstimatedCostToDate >= 0) {
//                         cost = '$' + Math.round(poly_features[i].properties.irwin_EstimatedCostToDate).toLocaleString()
//                     }

//                     if (fire_name == null || fire_name == 'N/A') {
//                         fire_name = 'Unknown';
//                     }

//                     popup_html = `<strong>${fire_name}</strong><br/>Containment: ${contained}<br/>Acres: ${acres}<br/>Cost: ${cost}`;

//                     new mapboxgl.Popup()
//                         .setLngLat(cen.geometry.coordinates)
//                         .setHTML(popup_html)
//                         .addTo(map)

//                     break;
//                 }
//             }

//         } else { // Polys - Fire perimeters section

//             var mp = turf.multiPolygon(f[0].geometry)
//             var bbox = turf.bbox(mp.geometry.coordinates)
//             var cen = turf.centroid(f[0].geometry)

//             if (window.innerHeight <= '700') {
//                 map.fitBounds(bbox, {
//                     padding:
//                         { top: 50, bottom: 150, left: 50, right: 50 }
//                 });
//             } else {
//                 map.fitBounds(bbox, {
//                     padding: { top: 100, bottom: 100, left: 100, right: 100 }
//                 });
//             }

//             if (f[0].properties.poly_IncidentName !== undefined) {
//                 var fire_name = f[0].properties.poly_IncidentName.toUpperCase()
//                 var cost = 'Unknown'
//                 var acres = 'Unknown'
//                 var contained = 'Unknown'

//                 if (f[0].properties.irwin_PercentContained >= 0) {
//                     contained = f[0].properties.irwin_PercentContained + '%'
//                 }

//                 if (f[0].properties.irwin_DailyAcres >= 0) {
//                     acres = Math.round(f[0].properties.irwin_DailyAcres).toLocaleString()
//                 }

//                 if (f[0].properties.irwin_EstimatedCostToDate >= 0) {
//                     cost = '$' + Math.round(f[0].properties.irwin_EstimatedCostToDate).toLocaleString()
//                 }

//                 if (fire_name == null || fire_name == 'N/A') {
//                     fire_name = 'Unknown';
//                 }

//                 popup_html = `<strong>${fire_name}</strong><br/>Containment: ${contained}<br/>Acres: ${acres}<br/>Cost: ${cost}`;

//                 new mapboxgl.Popup()
//                     .setLngLat(cen.geometry.coordinates)
//                     .setHTML(popup_html)
//                     .addTo(map);
//             }
//         }
//     }
// });

// // ABOUT MODAL

// const close = document.getElementById("close");
// const container = document.getElementById('modal');
// const content = document.getElementById('modal-content');

// const ft = focusTrap.createFocusTrap('#modal-content', {
//     clickOutsideDeactivates: true,
//     escapeDeactivates: true,
//     delayInitialFocus: true,
//     // Called before focus is sent
//     onActivate: () => container.classList.add('is-active') || content.classList.add('is-active'),

//     // There is a delay between when the class is applied
//     // and when the element is focusable
//     checkCanFocusTrap: (trapContainers) => {
//         const results = trapContainers.map((trapContainer) => {
//             return new Promise((resolve) => {
//                 const interval = setInterval(() => {
//                     if (getComputedStyle(trapContainer).visibility !== 'hidden') {
//                         resolve();
//                         clearInterval(interval);
//                     }
//                 }, 5);
//             });
//         });
//         // Return a promise that resolves when all the trap containers are able to receive focus
//         return Promise.all(results);
//     },

//     // Called after focus is sent to the focus trap
//     onDeactivate: () => container.classList.remove('is-active') || content.classList.remove('is-active')
// });

// document
//     .getElementById('modalBtn')
//     .addEventListener('click', ft.activate);

// document
//     .getElementById('close')
//     .addEventListener('click', ft.deactivate);

// // WARNING

// var elem = document.getElementById("warning");

// window.setTimeout(function () {
//     elem.style.opacity = '0';
// }, 5000);

// window.setTimeout(function () {
//     elem.style.display = 'none';
// }, 6000);