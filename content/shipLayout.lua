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
      visible = true,
      opacity = 1,
      image = "../images/Body_Small.png",
      properties = {}
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
          x = 592,
          y = 239.333,
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
          x = 768,
          y = 240.667,
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
          x = 766.667,
          y = 362,
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
          x = 551.333,
          y = 247.333,
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
          x = 551.333,
          y = 247.333,
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
          x = 675.109,
          y = 222.846,
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
          x = 833.71,
          y = 347.135,
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
          x = 682.41,
          y = 379.243,
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
          x = 532.801,
          y = 303.326,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
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
          x = 856,
          y = 241,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "back",
          shape = "rectangle",
          x = 808,
          y = 287,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "right",
          shape = "rectangle",
          x = 856,
          y = 332,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "forward",
          shape = "rectangle",
          x = 856,
          y = 287,
          width = 42,
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
    }
  }
}
