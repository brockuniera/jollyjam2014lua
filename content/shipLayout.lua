return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 64,
  height = 36,
  tilewidth = 20,
  tileheight = 20,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      name = "ship",
      x = 0,
      y = 0,
      visible = true,
      opacity = 1,
      image = "../images/Body_Small.png",
      properties = {}
    },
    {
      type = "objectgroup",
      name = "thruster",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "left",
          shape = "rectangle",
          x = -349.5,
          y = -139.5,
          width = 601,
          height = 225,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "thruster",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "right",
          shape = "rectangle",
          x = -350,
          y = -140,
          width = 601,
          height = 225,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "ground",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 164,
          y = 124,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 17.3333, y = -107.333 },
            { x = 43.3333, y = -116 },
            { x = 81.3333, y = -114 },
            { x = 136.667, y = -100 },
            { x = 160.667, y = -90.6667 },
            { x = 174.545, y = 0.727273 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 340,
          y = 125.334,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 36.4167, y = 7.14583 },
            { x = 90.6667, y = -52 },
            { x = 124.667, y = -17.3333 },
            { x = 152, y = 18 },
            { x = 166.667, y = 54.6667 },
            { x = 164.667, y = 90.6667 },
            { x = 149.333, y = 117.333 },
            { x = 119.333, y = 156 },
            { x = 97.3333, y = 182.667 },
            { x = 38, y = 112 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 338.667,
          y = 246.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -15.3333, y = 101.333 },
            { x = -85.3333, y = 121.333 },
            { x = -126, y = 126 },
            { x = -157.333, y = 124 },
            { x = -175.333, y = 11.3333 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 123.333,
          y = 132,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -62, y = -66.6667 },
            { x = -78.6667, y = -56.6667 },
            { x = -96, y = -26 },
            { x = -109.333, y = 13.3333 },
            { x = -116, y = 64.6667 },
            { x = -109.333, y = 118 },
            { x = -87.3333, y = 164 },
            { x = -61.3333, y = 186.667 },
            { x = 0, y = 116 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 123.333,
          y = 132,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 41.3333, y = -10 },
            { x = 215.485, y = -7.21212 },
            { x = 253.271, y = 0.354167 },
            { x = 254.667, y = 106.667 },
            { x = 216, y = 116 },
            { x = 40, y = 126.667 },
            { x = 0, y = 118.667 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "spawns",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 249.109,
          y = 32.846,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 314.377,
          y = 187.802,
          width = 0,
          height = 0,
          rotation = 0,
          visible = false,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 247.077,
          y = 347.243,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 195.134,
          y = 190.659,
          width = 0,
          height = 0,
          rotation = 0,
          visible = false,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "navigation",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "left",
          shape = "rectangle",
          x = 402,
          y = 125,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "back",
          shape = "rectangle",
          x = 357,
          y = 170,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "right",
          shape = "rectangle",
          x = 402,
          y = 215,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "forward",
          shape = "rectangle",
          x = 446,
          y = 170,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "weapons",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      name = "walls",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 327,
          y = 36,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 12, y = 88.25 },
            { x = 49.5909, y = 95.8636 },
            { x = 107, y = 36 },
            { x = -4, y = -4 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 379,
          y = 243,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -0.602273, y = -3.82955 },
            { x = 57, y = 67 },
            { x = -56, y = 109 },
            { x = -40, y = 6 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 164,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 16, y = 110 },
            { x = -102, y = 60 },
            { x = -41, y = -10 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 181.5,
          y = 15,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -20, y = 109 },
            { x = -58, y = 117 },
            { x = -121, y = 48.5 },
            { x = -83, y = 25 },
            { x = -26, y = 3 },
            { x = 1, y = -1.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 182.5,
          y = 14,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 25.5, y = -5.5 },
            { x = 25, y = -13.5 },
            { x = -5.5, y = -8 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 208.5,
          y = 9.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 41, y = 2 },
            { x = 41, y = -6 },
            { x = -0.5, y = -8.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 250.5,
          y = 13.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 74.5, y = 21.5 },
            { x = 78, y = 11.5 },
            { x = -0.5, y = -10.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 432,
          y = 76,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 63.5, y = 70.5 },
            { x = 73.5, y = 38.5 },
            { x = 3.5, y = -12 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 494.5,
          y = 147,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 13, y = 36.5 },
            { x = 45.5, y = 18 },
            { x = 10.5, y = -30 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 508,
          y = 184,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -5, y = 47 },
            { x = 36, y = 46 },
            { x = 32.5, y = -17.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 505,
          y = 219,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -30, y = 45 },
            { x = -0.5, y = 82 },
            { x = 36.5, y = 14.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 475.5,
          y = 265.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -39, y = 44 },
            { x = -21.5, y = 65.5 },
            { x = 27, y = 35.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 323.5,
          y = 351.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -82.5, y = 18.5 },
            { x = -68.5, y = 51.5 },
            { x = 14.5, y = 21.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 241.5,
          y = 370.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -27.5, y = 2.5 },
            { x = -27, y = 41.5 },
            { x = 14, y = 33.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 215,
          y = 375,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -35.5, y = -5.5 },
            { x = -40.5, y = 33.5 },
            { x = 1, y = 37 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 63,
          y = 320.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -27.5, y = -24 },
            { x = -44, y = -1 },
            { x = -8.5, y = 13.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 36.5,
          y = 297,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -25, y = -49.5 },
            { x = -30, y = -26.5 },
            { x = -14.5, y = 12.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 13.5,
          y = 251,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -6.5, y = -56.5 },
            { x = -11, y = -31 },
            { x = -11, y = 3 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 8.5,
          y = 197,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 6.5, y = -49.5 },
            { x = -4, y = -61 },
            { x = -5.5, y = -0.5 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 13.5,
          y = 147.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 13, y = -41.5 },
            { x = -7, y = -62.5 },
            { x = -10, y = -16 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 27,
          y = 108.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 18, y = -33 },
            { x = -1, y = -47 },
            { x = -19.5, y = -23 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 45.5,
          y = 77.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 18.5, y = -13 },
            { x = 8, y = -27.5 },
            { x = -21.5, y = -19 }
          },
          properties = {}
        }
      }
    },
    {
      type = "imagelayer",
      name = "shield",
      x = -521,
      y = -436,
      visible = true,
      opacity = 1,
      image = "../images/Shield.png",
      properties = {}
    }
  }
}
