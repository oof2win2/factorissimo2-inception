local lib = {}
lib.factoryPosition = {x = 10, y = 10}
lib.outdoorPos = {
    offsets = {
        [defines.direction.north] = {
            x = {0, 1, 2, 3, 8, 9, 10, 11},
            y = {0, 0, 0, 0, 0, 0, 0, 0}
        },
        [defines.direction.east] = {
            x = {0, 0, 0, 0, 0, 0, 0, 0},
            y = {0, 1, 2, 3, 8, 9, 10, 11}
        },
        [defines.direction.south] = {
            x = {0, 1, 2, 3, 8, 9, 10, 11},
            y = {0, 0, 0, 0, 0, 0, 0, 0}
        },
        [defines.direction.west] = {
            x = {0, 0, 0, 0, 0, 0, 0, 0},
            y = {0, 1, 2, 3, 8, 9, 10, 11}
        }
    },
    positions = {
        [defines.direction.north] = {
            chest = {4, -2},
            loader = {4, 0},
            belt = {4, 1},
            infpipe = {4, 0},
            bulkpipe = {4, 1}
        },
        [defines.direction.east] = {
            chest = {21, 4},
            loader = {20, 4},
            belt = {18, 4},
            infpipe = {19, 4},
            bulkpipe = {18, 4}
        },
        [defines.direction.south] = {
            chest = {4, 21},
            loader = {4, 20},
            belt = {4, 18},
            infpipe = {4, 19},
            bulkpipe = {4, 18}
        },
        [defines.direction.west] = {
            chest = {-2, 4},
            loader = {0, 4},
            belt = {1, 4},
            infpipe = {0, 4},
            bulkpipe = {1, 4}
        }
    }
}
lib.indoorPos = {
    offsets = {
        [defines.direction.north] = {
            x = {0, 4, 15, 19, 30, 34, 45, 49},
            y = {0, 0, 0, 0, 0, 0, 0, 0}
        },
        [defines.direction.east] = {
            x = {0, 0, 0, 0, 0, 0, 0, 0},
            y = {0, 4, 15, 19, 30, 34, 45, 49}
        },
        [defines.direction.south] = {
            x = {0, 4, 15, 19, 30, 34, 45, 49},
            y = {0, 0, 0, 0, 0, 0, 0, 0}
        },
        [defines.direction.west] = {
            x = {0, 0, 0, 0, 0, 0, 0, 0},
            y = {0, 4, 15, 19, 30, 34, 45, 49}
        }
    },
    positions = {
        [defines.direction.north] = {
            belt = {-25, -31},
            bulkpipe = {-25, -31},
        },
        [defines.direction.east] = {
            belt = {30, -25},
            bulkpipe = {30, -25},
        },
        [defines.direction.south] = {
            belt = {-25, 30},
            bulkpipe = {-25, 30},
        },
        [defines.direction.west] = {
            belt = {-31, -25},
            bulkpipe = {-31, -25},
        }
    }
}

lib.directions = {
    defines.direction.north, defines.direction.east,
    defines.direction.south, defines.direction.west
}

return lib
