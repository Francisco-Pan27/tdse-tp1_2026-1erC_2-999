{
  "graph": {
    "cells": [
      {
        "position": {
          "x": -117,
          "y": -59.5
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "e231e707-a282-46eb-b836-0e0cdfcbdfba",
        "attrs": {
          "name": {
            "text": "LightSwitch TP1 Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event switch\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -740,
          "y": -1600
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fontSize": 11
          }
        },
        "id": "77b738eb-5aa7-43fa-aed4-106595811bf5",
        "z": 4
      },
      {
        "position": {
          "x": -823,
          "y": -1626
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "cecd6a6f-1ec3-4dbb-a7b7-46bdcaba8a98",
        "embeds": [
          "dbdde81d-599c-4776-9437-98ca9c8a70f0"
        ],
        "z": 398
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -823,
          "y": -1611
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "dbdde81d-599c-4776-9437-98ca9c8a70f0",
        "parent": "cecd6a6f-1ec3-4dbb-a7b7-46bdcaba8a98",
        "z": 399
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cecd6a6f-1ec3-4dbb-a7b7-46bdcaba8a98"
        },
        "target": {
          "id": "77b738eb-5aa7-43fa-aed4-106595811bf5"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "c3d9c4c3-7d3c-47d1-8dd8-fa6f6ff51736",
        "z": 400
      },
      {
        "position": {
          "x": -743,
          "y": -1480
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fontSize": 11
          }
        },
        "id": "d1482c8e-44b1-4b61-bedb-0acf4e068502",
        "z": 401
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "77b738eb-5aa7-43fa-aed4-106595811bf5"
        },
        "target": {
          "id": "d1482c8e-44b1-4b61-bedb-0acf4e068502"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "switch"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "aa817c64-3356-4cd4-bb35-425734a3430e",
        "z": 402,
        "vertices": [
          {
            "x": -656,
            "y": -1570
          },
          {
            "x": -656,
            "y": -1447
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d1482c8e-44b1-4b61-bedb-0acf4e068502"
        },
        "target": {
          "id": "77b738eb-5aa7-43fa-aed4-106595811bf5"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "switch"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "961836d9-0819-4034-a8aa-f9ff4f883254",
        "z": 402,
        "vertices": [
          {
            "x": -766,
            "y": -1447
          },
          {
            "x": -766,
            "y": -1570
          }
        ]
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "LightSwitchTp1",
          "statemachinePrefix": "lightSwitchTp1",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}