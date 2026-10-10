{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "TP3 ACT_3 Export"
          },
          "specification": {
            "text": "interface:\r\n    in event evEnter\r\n    in event evNext\r\n    in event evEscape\r\n\r\n    // Variables de navegación\r\n    var motor_sel: integer = 1  // Para elegir entre Motor 1 (1) y Motor 2 (2)\r\n    var param_sel: integer = 1  // Para elegir entre Power (1), Speed (2) y Spin (3)\r\n\r\n    // Valores del Motor 1\r\n    var power1: integer = 0     // 0 = OFF, 1 = ON\r\n    var speed1: integer = 0     // Rango 0 a 9\r\n    var spin1: integer = 0      // 0 = LEFT, 1 = RIGHT\r\n\r\n    // Valores del Motor 2\r\n    var power2: integer = 0\r\n    var speed2: integer = 0\r\n    var spin2: integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -7,
          "y": -210
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "DISPLAY",
            "fontSize": 11
          }
        },
        "id": "1cd87503-b191-448c-b79a-daa53f0e58af",
        "z": 57
      },
      {
        "position": {
          "x": 15.5,
          "y": 10
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "f62dad2d-e77b-48f7-8e17-5d6109ba188f",
        "z": 66
      },
      {
        "position": {
          "x": 165.5,
          "y": 91
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "9b5bf169-8055-461b-98d7-fb3d77642dde",
        "z": 87
      },
      {
        "position": {
          "x": -143.5,
          "y": 91
        },
        "size": {
          "width": 15,
          "height": 15
        },
        "type": "Choice",
        "attrs": {},
        "id": "02e9e302-4e30-4a6f-863c-bc3628a0fff1",
        "z": 89
      },
      {
        "position": {
          "x": 143,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SPEED 2",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / speed2 = (speed2 == 9) ? 0 : speed2 + 1"
          }
        },
        "id": "95c0da94-d74d-4570-8091-7bf4cf6a3a6b",
        "z": 94
      },
      {
        "position": {
          "x": 234,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SPIN 2",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / spin2 = (spin2 == 0) ? 1 : 0"
          }
        },
        "id": "47b4c483-a28e-473b-b22f-e168b62b684b",
        "z": 96
      },
      {
        "position": {
          "x": 53,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "POWER 2",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / power2 = (power2 == 0) ? 1 : 0"
          }
        },
        "id": "48b0e860-cecf-4ff3-a081-d2ea8fd53f87",
        "z": 97
      },
      {
        "position": {
          "x": -166,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SPEED 1",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / speed1 = (speed1 == 9) ? 0 : speed1 + 1"
          }
        },
        "id": "07effa70-15a5-4653-9dbe-acbaf1066db2",
        "z": 99
      },
      {
        "position": {
          "x": -260,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "POWER 1",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / power1 = (power1 == 0) ? 1 : 0"
          }
        },
        "id": "01c420d6-5d53-4bcf-a057-09c5300cf5b2",
        "z": 100
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9b5bf169-8055-461b-98d7-fb3d77642dde"
        },
        "target": {
          "id": "47b4c483-a28e-473b-b22f-e168b62b684b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "43.333%",
              "dy": "21.667%",
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
                "text": "default"
              }
            },
            "position": {
              "distance": 0.3121748691254507,
              "offset": -8.83100514878301,
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
        "id": "ceaac8b2-49af-48d2-98a5-c712fe1498d6",
        "z": 101,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9b5bf169-8055-461b-98d7-fb3d77642dde"
        },
        "target": {
          "id": "95c0da94-d74d-4570-8091-7bf4cf6a3a6b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "43.333%",
              "dy": "43.333%",
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
                "text": "[param_sel == 2]"
              }
            },
            "position": {
              "distance": 0.48146085983123615,
              "offset": -45,
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
        "id": "e8e2097b-1c4e-4fed-9fb5-d527beefd6c0",
        "z": 102,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "02e9e302-4e30-4a6f-863c-bc3628a0fff1"
        },
        "target": {
          "id": "07effa70-15a5-4653-9dbe-acbaf1066db2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "60%",
              "dy": "21.667%",
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
                "text": "[param_sel == 2]"
              }
            },
            "position": {
              "distance": 0.464247386115425,
              "offset": -45,
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
        "id": "fc35efdf-d5ef-4ebf-a8f6-0a0b18a769ee",
        "z": 104,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 121,
          "y": -12.5
        },
        "size": {
          "width": 104,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MOTOR 2",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / param_sel = (param_sel == 3) ? 1 : param_sel + 1"
          }
        },
        "id": "a36da5c9-131d-4901-b322-b99adde8e857",
        "z": 107
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f62dad2d-e77b-48f7-8e17-5d6109ba188f"
        },
        "target": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.667%",
              "dy": "42.5%",
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
                "text": "default"
              }
            },
            "position": {
              "distance": 0.5526315789473685,
              "offset": -11,
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
        "id": "1532710f-94cd-416a-aa24-fd2ce4fb032c",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857"
        },
        "target": {
          "id": "9b5bf169-8055-461b-98d7-fb3d77642dde"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evEnter"
              }
            },
            "position": {
              "distance": 0.43103448275862066,
              "offset": -18,
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
        "id": "8b1b48ea-6eca-44a4-91bb-3a7b6243a0e8",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -188,
          "y": -12.5
        },
        "size": {
          "width": 104,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MOTOR 1",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / param_sel = (param_sel == 3) ? 1 : param_sel + 1"
          }
        },
        "id": "fe997c31-9598-4086-b35e-31e484d515e6",
        "z": 109
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f62dad2d-e77b-48f7-8e17-5d6109ba188f"
        },
        "target": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "103.333%",
              "dy": "42.5%",
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
                "text": "[motor_sel == 1]"
              }
            },
            "position": {
              "distance": 0.49999999392866246,
              "offset": 11,
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
        "id": "3262a16a-98d6-41c3-862c-25299d8aaa3a",
        "z": 110,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6"
        },
        "target": {
          "id": "02e9e302-4e30-4a6f-863c-bc3628a0fff1"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evEnter"
              }
            },
            "position": {
              "offset": -19,
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
        "id": "6af98680-15df-4989-a978-e6d4c609e9c5",
        "z": 110,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "47b4c483-a28e-473b-b22f-e168b62b684b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "65%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.154%",
              "dy": "64.167%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.499999990471579,
              "offset": 24,
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
        "id": "7bb5886a-397a-41c1-b9ef-1f6b8868ecee",
        "z": 111,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 273,
            "y": 73
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9b5bf169-8055-461b-98d7-fb3d77642dde"
        },
        "target": {
          "id": "48b0e860-cecf-4ff3-a081-d2ea8fd53f87",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "63.333%",
              "dy": "0%",
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
                "text": "[param_sel == 1]"
              }
            },
            "position": {
              "distance": 0.38139769723156625,
              "offset": 7.890041254245968,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "37b5de63-6ee9-4271-b0d0-dc45938a7be0",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "48b0e860-cecf-4ff3-a081-d2ea8fd53f87",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "20%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "-3.846%",
              "dy": "64.167%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.5224428228736153,
              "offset": 20,
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
        "id": "3ef2830d-c59e-4a64-b20c-578cf409425e",
        "z": 114,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "95c0da94-d74d-4570-8091-7bf4cf6a3a6b"
        },
        "target": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.154%",
              "dy": "42.5%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.569212110103841,
              "offset": 23,
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
        "id": "f8d44329-4dd7-434a-b701-50f10b5c85d1",
        "z": 115,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 325,
            "y": 247
          },
          {
            "x": 325,
            "y": 39
          }
        ]
      },
      {
        "position": {
          "x": -67,
          "y": 156
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SPIN 1",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / spin1 = (spin1 == 0) ? 1 : 0"
          }
        },
        "id": "4eb85a18-c691-477d-94ff-e8fac2327ccb",
        "z": 117
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "02e9e302-4e30-4a6f-863c-bc3628a0fff1"
        },
        "target": {
          "id": "4eb85a18-c691-477d-94ff-e8fac2327ccb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "46.667%",
              "dy": "21.667%",
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
                "text": "default"
              }
            },
            "position": {
              "distance": 0.34623765874376367,
              "offset": -9.869977047448241,
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
        "id": "5ff5e7b5-2aff-4a84-823e-99b27a3bb2c4",
        "z": 118,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4eb85a18-c691-477d-94ff-e8fac2327ccb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "68.333%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "105.769%",
              "dy": "64.167%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.5168321148265674,
              "offset": 22,
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
        "id": "c5030b51-f052-4ec4-a082-0a378793c827",
        "z": 118,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -26,
            "y": 56
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "02e9e302-4e30-4a6f-863c-bc3628a0fff1"
        },
        "target": {
          "id": "01c420d6-5d53-4bcf-a057-09c5300cf5b2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "65%",
              "dy": "0%",
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
                "text": "[param_sel == 1]"
              }
            },
            "position": {
              "distance": 0.39929363059185374,
              "offset": 10.90881189533572,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "34844017-852d-419e-bbbd-433910debcb9",
        "z": 119,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "01c420d6-5d53-4bcf-a057-09c5300cf5b2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.667%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.769%",
              "dy": "64.167%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.5215946922774721,
              "offset": 20,
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
        "id": "e0664ca9-63da-4309-8ecb-ff347be4a135",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "07effa70-15a5-4653-9dbe-acbaf1066db2"
        },
        "target": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.769%",
              "dy": "42.5%",
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
                "text": "evEnter,\nevEscape"
              }
            },
            "position": {
              "distance": 0.5748485520610268,
              "offset": -25,
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
        "id": "166ab0e0-2f5b-449b-9254-b524942e1003",
        "z": 121,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -130,
            "y": 247
          },
          {
            "x": -286,
            "y": 78
          }
        ]
      },
      {
        "position": {
          "x": -35.5,
          "y": -95
        },
        "size": {
          "width": 117,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MEN-MOTOR",
            "fontSize": 11
          },
          "specification": {
            "text": "evNext / motor_sel = (motor_sel == 1) ? 2 : 1"
          }
        },
        "id": "be494de1-cfda-411a-b3a7-e836d02eba85",
        "z": 126,
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1cd87503-b191-448c-b79a-daa53f0e58af",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "76.667%",
              "dy": "90%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "be494de1-cfda-411a-b3a7-e836d02eba85",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "63.675%",
              "dy": "6.667%",
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
                "text": "evEnter"
              }
            },
            "position": {
              "offset": -20,
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
        "id": "f1a0c6a6-87b2-41c7-9d9b-90f649af3b13",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fe997c31-9598-4086-b35e-31e484d515e6"
        },
        "target": {
          "id": "be494de1-cfda-411a-b3a7-e836d02eba85",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "11.667%",
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
            "attrs": {
              "text": {
                "text": "evEscape"
              }
            },
            "position": {
              "distance": 0.5000000249592718,
              "offset": -9,
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
        "id": "2dfce5db-2406-4870-b3ba-85534a833c98",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -136,
            "y": -52
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a36da5c9-131d-4901-b322-b99adde8e857"
        },
        "target": {
          "id": "be494de1-cfda-411a-b3a7-e836d02eba85",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "76.667%",
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
            "attrs": {
              "text": {
                "text": "evEscape"
              }
            },
            "position": {
              "distance": 0.5000000121862669,
              "offset": 11,
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
        "id": "03e66483-2f0f-4240-8309-329ec83e3b39",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 169,
            "y": -65
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "be494de1-cfda-411a-b3a7-e836d02eba85"
        },
        "target": {
          "id": "f62dad2d-e77b-48f7-8e17-5d6109ba188f"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "evEnter"
              }
            },
            "position": {
              "distance": 0.43333333333333335,
              "offset": -18,
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
        "id": "9de6d740-cd9d-4d78-b8c5-f0c1c2062273",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "be494de1-cfda-411a-b3a7-e836d02eba85"
        },
        "target": {
          "id": "1cd87503-b191-448c-b79a-daa53f0e58af",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "33.333%",
              "dy": "90%",
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
                "text": "evEscape"
              }
            },
            "position": {
              "offset": -28,
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
        "id": "f3e40a9e-be3f-42ae-a7a0-e0c24e9bd522",
        "z": 127,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 13.5,
          "y": -272
        },
        "size": {
          "width": 19,
          "height": 19
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "530a8597-aeea-426e-b80b-9710bb50e404",
        "z": 131,
        "embeds": [
          "a39bb9cf-6025-4448-85e1-12e2fc801c97"
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
          "x": 13.5,
          "y": -253
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "a39bb9cf-6025-4448-85e1-12e2fc801c97",
        "z": 132,
        "parent": "530a8597-aeea-426e-b80b-9710bb50e404"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "530a8597-aeea-426e-b80b-9710bb50e404"
        },
        "target": {
          "id": "1cd87503-b191-448c-b79a-daa53f0e58af",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "55%",
              "dy": "25%",
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
        "id": "30693a7e-8bb8-4334-be02-f54927b5a31c",
        "z": 133,
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
          "moduleName": "Tp3Act3",
          "statemachinePrefix": "tp3Act3",
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