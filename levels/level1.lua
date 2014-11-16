return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 100,
  height = 100,
  tilewidth = 100,
  tileheight = 100,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      name = "Goal",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "Goal",
          type = "",
          shape = "rectangle",
          x = 837.131,
          y = 201.487,
          width = 91.149,
          height = 98.3449,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Asteroids",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "Asteroid Belt",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 10000,
          height = 590.07,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Spawn",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 604.462,
          y = 500.284,
          width = 88.7503,
          height = 91.149,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
