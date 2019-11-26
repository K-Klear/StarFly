components {
  id: "crew"
  component: "/main/ship/crew.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "head"
  type: "sprite"
  data: "tile_set: \"/main/ship/crew.atlas\"\n"
  "default_animation: \"head_idle_1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 19.5
    z: -0.002
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "legs"
  type: "sprite"
  data: "tile_set: \"/main/ship/crew.atlas\"\n"
  "default_animation: \"legs_idle_1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 19.5
    z: -0.002
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "torso"
  type: "sprite"
  data: "tile_set: \"/main/ship/crew.atlas\"\n"
  "default_animation: \"torso_idle_1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 19.5
    z: -0.002
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "hand"
  type: "sprite"
  data: "tile_set: \"/main/ship/crew.atlas\"\n"
  "default_animation: \"hand_idle_1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 19.5
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "hair"
  type: "sprite"
  data: "tile_set: \"/main/ship/crew.atlas\"\n"
  "default_animation: \"hair_idle_1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 19.5
    z: -0.001
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
