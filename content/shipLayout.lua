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
          x = 247.109,
          y = 107.513,
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
          x = 405.71,
          y = 231.802,
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
          x = 254.41,
          y = 263.91,
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
          x = 104.801,
          y = 187.993,
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
          x = 430,
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
          x = 385,
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
          x = 430,
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
          x = 430,
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
    }
  }
}
