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
            "text": "TP3 ACT-2 Export"
          },
          "specification": {
            "text": "interface:\n    in event evTick\n    var init_done : boolean = false\n    var has_data : boolean = false\n    var bytes_left : integer = 0\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -593,
          "y": -1529
        },
        "size": {
          "width": 108,
          "height": 101
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SYS_IDLE",
            "fontSize": 11
          }
        },
        "id": "ef42e40f-54eb-47d7-89fe-9e7b19a2bf59",
        "z": 10
      },
      {
        "position": {
          "x": -593,
          "y": -1719
        },
        "size": {
          "width": 117,
          "height": 102
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SYS_INIT",
            "fontSize": 11
          }
        },
        "id": "0f297fee-ecc1-4c96-88df-698e2978b1ea",
        "z": 17
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0f297fee-ecc1-4c96-88df-698e2978b1ea"
        },
        "target": {
          "id": "ef42e40f-54eb-47d7-89fe-9e7b19a2bf59",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "55.556%",
              "dy": "2.97%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evTick [init_done == true]"
              }
            },
            "position": {
              "offset": 90,
              "angle": 0
            }
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
        "id": "412fec10-ebd5-410d-9dc1-06e913f6acd1",
        "z": 22,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -170,
          "y": -1530
        },
        "size": {
          "width": 108,
          "height": 100
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SYS_SENDBIT",
            "fontSize": 11
          }
        },
        "id": "1368f0a1-b5ed-4b45-9575-935484898cc7",
        "z": 25,
        "embeds": [
          "ea58ab88-0993-4a1c-80e4-22a1b71d39de"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ef42e40f-54eb-47d7-89fe-9e7b19a2bf59",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.222%",
              "dy": "20.792%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "1368f0a1-b5ed-4b45-9575-935484898cc7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "19.444%",
              "dy": "22%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evTick [has_data == true]"
              }
            },
            "position": {
              "distance": 0.5204159691220238,
              "offset": -16,
              "angle": 0
            }
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
        "id": "d63aed64-3d9f-4562-ac3d-47b32067ed26",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1368f0a1-b5ed-4b45-9575-935484898cc7"
        },
        "target": {
          "id": "ef42e40f-54eb-47d7-89fe-9e7b19a2bf59",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.593%",
              "dy": "80.198%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evTick [bytes_left == 0] / has_data = false"
              }
            },
            "position": {
              "distance": 0.48987407381572423,
              "offset": 13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "5adaf1cf-4244-43fe-ba48-11cbaae6be4b",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1368f0a1-b5ed-4b45-9575-935484898cc7"
        },
        "target": {
          "id": "1368f0a1-b5ed-4b45-9575-935484898cc7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "91.667%",
              "dy": "43%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evTick [bytes_left > 0] / bytes_left--"
              }
            },
            "position": {
              "distance": 0.30424857704965685,
              "offset": -20.3992919921875,
              "angle": 0
            }
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
        "id": "ea58ab88-0993-4a1c-80e4-22a1b71d39de",
        "z": 30,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -103,
            "y": -1577
          },
          {
            "x": 22,
            "y": -1487
          }
        ],
        "parent": "1368f0a1-b5ed-4b45-9575-935484898cc7"
      },
      {
        "position": {
          "x": -394,
          "y": -1676
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "4a63c7d6-12f8-4bcb-a9e8-337d36584a8d",
        "z": 31,
        "embeds": [
          "7ee7def2-8a84-4982-8dfb-fde86b9301cd"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -394,
          "y": -1661
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "7ee7def2-8a84-4982-8dfb-fde86b9301cd",
        "z": 32,
        "parent": "4a63c7d6-12f8-4bcb-a9e8-337d36584a8d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4a63c7d6-12f8-4bcb-a9e8-337d36584a8d"
        },
        "target": {
          "id": "0f297fee-ecc1-4c96-88df-698e2978b1ea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.128%",
              "dy": "50%",
              "rotate": true
            }
          },
          "priority": true
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
        "id": "1ae3cd1c-3c47-42e8-a60d-76b461e1dc53",
        "z": 33,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
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
          "moduleName": "Tp3Act2",
          "statemachinePrefix": "tp3Act2",
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