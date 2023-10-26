//
//  Day20Description.swift
//  aoc2020
//
//  Created by Andrew McKnight on Dec 4, 2022.
//

/**
## --- Day 20: Jurassic Jigsaw ---

The high-speed train leaves the forest and quickly carries you south.
You can even see a desert in the distance! Since you have some spare
time, you <span title="Just in case. Maybe they missed something.">might
as well</span> see if there was anything interesting in the image the
Mythical Information Bureau satellite captured.

After decoding the satellite messages, you discover that the data
actually contains many small images created by the satellite's *camera
array*. The camera array consists of many cameras; rather than produce a
single square image, they produce many smaller square image *tiles* that
need to be *reassembled back into a single image*.

Each camera in the camera array returns a single monochrome *image tile*
with a random unique *ID number*. The tiles (your puzzle input) arrived
in a random order.

Worse yet, the camera array appears to be malfunctioning: each image
tile has been *rotated and flipped to a random orientation*. Your first
task is to reassemble the original image by orienting the tiles so they
fit together.

To show how the tiles should be reassembled, each tile's image data
includes a border that should line up exactly with its adjacent tiles.
All tiles have this border, and the border lines up exactly when the
tiles are both oriented correctly. Tiles at the edge of the image also
have this border, but the outermost edges won't line up with any other
tiles.

For example, suppose you have the following nine tiles:

Tile 2311:
..##.#..#.
##..#.....
#...##..#.
####.#...#
##.##.###.
##...#.###
.#.#.#..##
..#....#..
###...#.#.
..###..###

Tile 1951:
#.##...##.
#.####...#
.....#..##
#...######
.##.#....#
.###.#####
###.##.##.
.###....#.
..#.#..#.#
#...##.#..

Tile 1171:
####...##.
#..##.#..#
##.#..#.#.
.###.####.
..###.####
.##....##.
.#...####.
#.##.####.
####..#...
.....##...

Tile 1427:
###.##.#..
.#..#.##..
.#.##.#..#
#.#.#.##.#
....#...##
...##..##.
...#.#####
.#.####.#.
..#..###.#
..##.#..#.

Tile 1489:
##.#.#....
..##...#..
.##..##...
..#...#...
#####...#.
#..#.#.#.#
...#.#.#..
##.#...##.
..##.##.##
###.##.#..

Tile 2473:
#....####.
#..#.##...
#.##..#...
######.#.#
.#...#.#.#
.#########
.###.#..#.
########.#
##...##.#.
..###.#.#.

Tile 2971:
..#.#....#
#...###...
#.#.###...
##.##..#..
.#####..##
.#..####.#
#..#.#..#.
..####.###
..#.#.###.
...#.#.#.#

Tile 2729:
...#.#.#.#
####.#....
..#.#.....
....#..#.#
.##..##.#.
.#.####...
####.#.#..
##.####...
##..#.##..
#.##...##.

Tile 3079:
#.#.#####.
.#..######
..#.......
######....
####.#..#.
.#...#.##.
#.#####.##
..#.###...
..#.......
..#.###...

By rotating, flipping, and rearranging them, you can find a square
arrangement that causes all adjacent borders to line up:

#...##.#.. ..###..### #.#.#####.
..#.#..#.# ###...#.#. .#..######
.###....#. ..#....#.. ..#.......
###.##.##. .#.#.#..## ######....
.###.##### ##...#.### ####.#..#.
.##.#....# ##.##.###. .#...#.##.
#...###### ####.#...# #.#####.##
.....#..## #...##..#. ..#.###...
#.####...# ##..#..... ..#.......
#.##...##. ..##.#..#. ..#.###...

#.##...##. ..##.#..#. ..#.###...
##..#.##.. ..#..###.# ##.##....#
##.####... .#.####.#. ..#.###..#
####.#.#.. ...#.##### ###.#..###
.#.####... ...##..##. .######.##
.##..##.#. ....#...## #.#.#.#...
....#..#.# #.#.#.##.# #.###.###.
..#.#..... .#.##.#..# #.###.##..
####.#.... .#..#.##.. .######...
...#.#.#.# ###.##.#.. .##...####

...#.#.#.# ###.##.#.. .##...####
..#.#.###. ..##.##.## #..#.##..#
..####.### ##.#...##. .#.#..#.##
#..#.#..#. ...#.#.#.. .####.###.
.#..####.# #..#.#.#.# ####.###..
.#####..## #####...#. .##....##.
##.##..#.. ..#...#... .####...#.
#.#.###... .##..##... .####.##.#
#...###... ..##...#.. ...#..####
..#.#....# ##.#.#.... ...##.....

For reference, the IDs of the above tiles are:

1951    2311    3079
2729    1427    2473
2971    1489    1171

To check that you've assembled the image correctly, multiply the IDs of
the four corner tiles together. If you do this with the assembled tiles
from the example above, you get `1951 * 3079 * 2971 * 1171` =
*`20899048083289`*.

Assemble the tiles into an image. *What do you get if you multiply
together the IDs of the four corner tiles?*

*/
public enum Day20: String {
case sample = """
ile 2311:
..##.#..#.
##..#.....
#...##..#.
####.#...#
##.##.###.
##...#.###
.#.#.#..##
..#....#..
###...#.#.
..###..###

Tile 1951:
#.##...##.
#.####...#
.....#..##
#...######
.##.#....#
.###.#####
###.##.##.
.###....#.
..#.#..#.#
#...##.#..

Tile 1171:
####...##.
#..##.#..#
##.#..#.#.
.###.####.
..###.####
.##....##.
.#...####.
#.##.####.
####..#...
.....##...

Tile 1427:
###.##.#..
.#..#.##..
.#.##.#..#
#.#.#.##.#
....#...##
...##..##.
...#.#####
.#.####.#.
..#..###.#
..##.#..#.

Tile 1489:
##.#.#....
..##...#..
.##..##...
..#...#...
#####...#.
#..#.#.#.#
...#.#.#..
##.#...##.
..##.##.##
###.##.#..

Tile 2473:
#....####.
#..#.##...
#.##..#...
######.#.#
.#...#.#.#
.#########
.###.#..#.
########.#
##...##.#.
..###.#.#.

Tile 2971:
..#.#....#
#...###...
#.#.###...
##.##..#..
.#####..##
.#..####.#
#..#.#..#.
..####.###
..#.#.###.
...#.#.#.#

Tile 2729:
...#.#.#.#
####.#....
..#.#.....
....#..#.#
.##..##.#.
.#.####...
####.#.#..
##.####...
##..#.##..
#.##...##.

Tile 3079:
#.#.#####.
.#..######
..#.......
######....
####.#..#.
.#...#.##.
#.#####.##
..#.###...
..#.......
..#.###...
"""

case input = """
Tile 3469:
.##..#.#.#
##..#...##
...#..##.#
....#.#..#
#..#.##...
.#.##.#.##
..#.#.....
..###.#..#
#.##.#...#
....#...##

Tile 3739:
..##..#..#
#.#...#..#
.....#.##.
.#..#....#
#.....#...
#..##.#..#
####.#.##.
##..#.#..#
..#......#
#..#.##.##

Tile 3581:
####.#..##
..#......#
.##...#...
#....#.###
..#..#.#..
#...#.....
#..####...
......#...
..#...#.##
##.#..#..#

Tile 2521:
..#.##..##
..#.#..##.
#.........
#.#.......
.#........
#.....#..#
..........
.#........
#........#
#.....#.#.

Tile 2729:
...##...##
....#..#..
#...##....
##.#......
#..#..#.##
.#...#...#
....#.##..
#.....##.#
#....##..#
......#.#.

Tile 2137:
#.#...#.##
#.......#.
.#.#..#..#
##.....#.#
.....#...#
...#......
#........#
....#....#
.......#..
.#.#.#####

Tile 1451:
...#.#.##.
##.#......
.###...#.#
..##....##
....##....
...#..#...
...#..#.#.
##..#....#
#..#...##.
.###....##

Tile 2927:
.#...#....
.#.......#
#...#....#
##.......#
..#....#.#
#.#....#..
#....#..##
#........#
#.#.......
#########.

Tile 2179:
...#..#..#
#....##...
....#...##
...#.#..##
#........#
..#.#...##
.#........
.###.####.
....#.#..#
..#.#.....

Tile 2267:
#.##...##.
.....#...#
..###...##
.....#..##
.....#...#
##........
#..#..#...
....##....
....#....#
###.####..

Tile 2423:
....###.##
#....#.#..
#......#.#
...#.....#
......#..#
.#......##
#.#......#
..........
...#..##..
##.##...##

Tile 3989:
.#.#....#.
#........#
..##....##
.#.###.##.
.....#....
#...##.##.
#....##..#
#.........
#....#....
.#..###...

Tile 1913:
.####...##
#.........
....#...#.
#.......##
#...#....#
#...#.....
.#.##...#.
.......#..
##..#...#.
.##..#.##.

Tile 2017:
.#.##.###.
#.....#...
..#..#...#
#........#
......#.#.
#...#....#
#.#.#...#.
.###.#....
.##...####
#.##.#####

Tile 1277:
.##...#.##
#..#.....#
#.#.#...##
#.#.#...##
.####....#
....#....#
.....#....
#....####.
#.........
#...#...#.

Tile 1999:
.##.##..#.
#.........
#...#.....
...#......
#.#.....#.
....#....#
........##
#......#.#
..#.#....#
.#.#.#....

Tile 2803:
#......##.
..##.##...
...#.#....
#...#....#
....#.#..#
#...#...##
.........#
#...#.##..
....##.#.#
#..#..#.#.

Tile 1801:
...#.###.#
...#.###..
...##..#.#
....##.###
##.......#
....#.#..#
##.###..#.
...#...#.#
#.##..##..
###......#

Tile 1009:
...#..#.#.
#.##.#....
#.....##..
#.#..#....
#.........
#....#.#.#
#....##..#
..##......
..#.#...#.
##.###.#.#

Tile 3329:
..#.###...
.#....#.#.
..........
#....##..#
##.##..###
..........
..........
#...#.#...
###.#..###
#####.##.#

Tile 3719:
..#.###.#.
#....#...#
##..#.##.#
....#.###.
##.....#.#
##....#...
##.......#
#.#......#
.##...#.#.
####..##.#

Tile 2381:
##.#......
#.....#...
#.....#...
.....##...
..##...##.
###......#
#.....#.##
..#...####
#.#...#..#
#..#......

Tile 2593:
###.#.###.
..#.##..##
#.#......#
....#.####
..#...##.#
..#.#.#...
#.##......
..#..#...#
.##.##...#
.###.##.##

Tile 3559:
...#...#..
#..#.#.#..
..........
.#.#......
..#......#
....#....#
.......###
...#..###.
..#.#...#.
..#.##.##.

Tile 2953:
#.##.....#
.........#
#...#.....
#...#....#
...#....#.
#..#...#..
#.....#.##
#...#.#..#
...###..##
..#..##..#

Tile 1283:
..#..#.#.#
##.....#.#
.........#
#.....#...
###......#
..#.#.####
#..#.....#
..#...#..#
###.##....
...#...###

Tile 2897:
.......###
##.#....#.
#.....####
##...#...#
.....#....
#.....#...
.##...##..
.....#...#
......#..#
.#....##.#

Tile 3779:
###..####.
#..##..#.#
#.#...#..#
......#..#
#....#....
...#...##.
......####
##....#..#
#.#....#..
#####....#

Tile 2693:
#.#.#.####
..........
#.#.#....#
..#.#..#.#
##.....#.#
##....#...
.##.#.....
##.......#
.....#....
.###.#..#.

Tile 1453:
#..##....#
#..#....#.
#.#....##.
.##.#....#
..#.#....#
.###.....#
....##....
#...##...#
#.###.....
.##....#..

Tile 1459:
.##.##.###
..#.......
......##.#
##...#...#
#.#.....##
#.#......#
...##.#...
###..#...#
...#....#.
...##.#.##

Tile 1109:
#.#.#.#..#
#..#.####.
.....##..#
.##...#..#
.#...###.#
........#.
.....#.#.#
...#...###
....#.#..#
##..#..##.

Tile 3943:
...###....
##...###.#
####.....#
#.........
.#......#.
..#..#.#.#
..#....#..
##..#....#
#..#.....#
#.##..#.##

Tile 1129:
###...##..
....#....#
#........#
#......#..
..#...#...
#......#.#
....#...#.
.....#....
##......##
#..####.#.

Tile 2837:
...###.#.#
#......#..
..#.....##
.....#...#
#......#..
..........
#......#..
#.#.....##
#.#.#.....
.####.##..

Tile 3299:
####..#...
#........#
#...#..#.#
#.#....#..
#...#.....
...##.#..#
#.#.....##
..##......
#...#.#..#
#.###..##.

Tile 1493:
#..##..#.#
###......#
..........
...#.....#
....#.....
...#.....#
.#........
...###..#.
.#.#...#.#
####.#.#..

Tile 3931:
#.####....
.....###.#
...#....#.
#.#....#.#
#..#.....#
#........#
...##..#..
.....#....
#..#...#.#
#.###.##..

Tile 2879:
#####.....
##.#.#...#
#.....#.##
##....#.##
#..#......
#.#...#...
..#.....#.
...#...###
...#....##
.#.###.#..

Tile 2617:
##.#.#.#.#
.....#.#..
#...#.....
#...##...#
.#.......#
#.#.......
##..#.....
#......###
..#..#...#
.###..#..#

Tile 2383:
..#.#..#.#
#..#......
#...#.#...
....##...#
.#..#.#..#
#####....#
#.#......#
#........#
..##...###
.##.##.###

Tile 3373:
.##..####.
...#..#.##
#..#.....#
####...#.#
#..#..#...
#.#....##.
##.#....##
.#..##..#.
.##..#...#
######..#.

Tile 3803:
.#..#.##..
.......##.
#....#....
..#......#
...##.....
#.........
..##......
#.#...#..#
..##.....#
#..#####..

Tile 3677:
.#.#####.#
#...#.....
.....#....
..#......#
.#.#...#.#
..###.##..
##...##..#
#..#......
#...#..#..
...#####.#

Tile 3323:
####.#..#.
#..#.##..#
#.........
.#.......#
#.#.....#.
#..#.....#
#....##.#.
.......#.#
#####..#..
.#.##.####

Tile 3457:
.#.#..#..#
.#..#.....
..##..#...
......#..#
.#.....#.#
#.........
#..#..#.#.
#####....#
###.#...#.
#..###.###

Tile 1303:
##..#.####
#.#..#....
.....#...#
#.#.......
#..####...
#...##....
###..#..##
##.......#
#...#..#.#
#..#.#..##

Tile 2687:
.####...##
#..#.....#
..#...#...
##.....#.#
#.....#..#
#.........
...#.#...#
.........#
#..#.....#
#.##.#...#

Tile 1907:
..#....###
....#...##
..#.##..#.
.#....##..
......#...
......#.#.
#.....#.##
..#...#...
....#....#
#####.####

Tile 3217:
#.##.##...
#..#.##...
.#..#.##..
#.....#.#.
....#.....
###.#.##..
.#.#.###..
#.........
#......#.#
#.###..##.

Tile 3923:
#.##.#..##
......#..#
#.....#...
..#.#.....
#........#
.#...#...#
.....#...#
.#..#.##.#
..#..#...#
..#####.##

Tile 2239:
#.#.###.##
#..#..#...
.##..#....
#...##..#.
#........#
..#.#.....
##.##.....
#.#..###.#
##..##....
#.#.#..##.

Tile 1823:
###..###..
.#.##...#.
..###....#
#.#..#...#
###.#.....
#.#...#.##
#...##..##
##.#...#.#
#....#.###
.#.##.#..#

Tile 2711:
.#.#.....#
.....#..##
..#..#..##
#.........
..........
#.##..##.#
####..####
###.......
........#.
.#.#.####.

Tile 1123:
###.#.##.#
........##
.......##.
.#........
.#....#..#
###.#.##..
..##......
#.#.#.....
##...#..##
###..#####

Tile 3659:
...##.##..
.#....#...
.#..#.....
..........
.....#.#..
...#...###
#.....#...
.#........
#..#......
#...#.#..#

Tile 3499:
###..##.#.
#..##....#
###.#.....
#####.....
..#.......
###..#.#..
......##.#
.#.......#
#.##.#...#
.#.#.##.##

Tile 3019:
#..#.###..
....#....#
.#......##
###.#....#
..#.#.....
..##....#.
.#..#..#.#
.........#
....#...##
##..#.#..#

Tile 3529:
####....##
..##...#.#
#.........
...#......
......#..#
##......##
#.##....##
##.#...#.#
#.#.......
###.##..#.

Tile 1733:
##..#....#
....#.....
#.#......#
..#..#...#
...#....#.
.....#....
.......#.#
......#..#
#.#.#..###
.###.#.##.

Tile 1367:
#.#.###.#.
#.##.##.#.
##..#.##..
#.....####
.##...#..#
...##.#..#
#.......##
.##..##..#
#.##......
#...###...

Tile 2557:
##.#######
#..#####..
##.#.#...#
#..#.#....
.#..#....#
###...#..#
##..#.#...
#...##..##
#.#.##.#.#
#.#...#..#

Tile 2081:
.###..#..#
.....#....
##.....#..
..........
..........
#.##......
.........#
......#.#.
...#.....#
...###.#.#

Tile 3391:
.##.#.....
...###...#
..#.##....
#...#.#..#
#......##.
#........#
...#..#..#
.....#....
.#...#....
##....#...

Tile 2657:
#.#.##.#..
##...#....
..#...#...
#.........
.........#
##........
##...#....
##.....#..
...#...#.#
##...###..

Tile 1429:
.###.....#
#........#
..#.#..#..
.......###
.......#..
.......##.
##..#...##
.#......#.
..#....#..
.##.##....

Tile 2339:
.#.####...
#......#..
#.#...##..
##....##.#
......##.#
.#......#.
.#...#..##
#........#
#.##.#.###
..#..#.#..

Tile 2347:
..###..###
..###.....
#..#..##..
#......#..
#.#..#.#.#
......##..
.#..#..#..
..#.....##
#.##..##..
#..###....

Tile 2957:
...#.####.
#.....#...
#..#......
#.....#.#.
..#.#..#.#
....#...##
###.#.##.#
.#...##..#
#........#
#.#.####..

Tile 2477:
.###.##.##
.#.....#..
#......#..
....##.#..
##........
..#....#.#
##...#.###
.#.#..#...
..#..#.#.#
.....#.#.#

Tile 1669:
#.##..#.##
.#......#.
#####..#.#
..##...#.#
#.#..#....
##........
##.#......
##..#....#
##.#..#..#
##...##.##

Tile 2887:
######.#..
#..#..##.#
#..#..#..#
#..###..#.
#........#
.....##..#
.#..##.#..
..........
##..#.#..#
##.#..#..#

Tile 3517:
.#....#.##
#..#.##.#.
..........
##...#..##
#.........
#...#.#..#
#...#..#..
...#......
..........
#......#.#

Tile 3257:
####.....#
.#...##...
#.#.#.#..#
#.##......
##.#..#...
.##.##..#.
#......#.#
..##......
#...#....#
#...##.###

Tile 2029:
#.#.....##
.........#
.#..#.....
...#.....#
...#.###.#
....#.#..#
..........
#..#..#...
#........#
.#####..##

Tile 1777:
###....#..
#..#......
......##..
.....#.#..
##....#..#
#..#...#..
..##....##
##..#..#..
#......#.#
.#.....##.

Tile 3881:
#..###..#.
##.#.##..#
#.........
#...#.#..#
#.........
.#..#.#.##
....#.....
#..###.#..
#..##.#..#
###..#.#.#

Tile 3919:
.##..##..#
..........
......#...
..........
...#.#..##
#........#
......###.
#....#.##.
..#.....##
.##.##....

Tile 1051:
####..###.
.....##...
#.#......#
..#.....#.
#....#...#
##.#..####
......####
#..#.....#
#......#..
##.#####..

Tile 2539:
.#.#.#..##
.#.#.#..##
..##...#.#
...#...#.#
#...#..##.
#...##.##.
.#....#..#
....#...#.
#.##..###.
.##.###...

Tile 2833:
#####.###.
.#...#...#
.........#
..#.#.#..#
####..#..#
#..#......
#.##..#...
#.##....##
#.#..#.##.
##.#.##.#.

Tile 1297:
.#.#.####.
..........
##..#####.
#....##..#
.#.......#
.#.##.....
#.#.#.#..#
...#..#...
#...#.#..#
.#...#####

Tile 1093:
.##..#...#
#.#.#.....
....#...#.
...#....##
....##..#.
#.......##
...#.#...#
#...#.#..#
....#..#.#
####.#.#..

Tile 2843:
.#.#..##..
..#...###.
....#.#..#
###..#.##.
..#....#..
#.........
#...#..#.#
#.#...#..#
##..####..
...#####..

Tile 2243:
...##..#.#
.......#..
#........#
....#....#
.........#
#..#......
..#..#.#.#
.#.#.##...
#...##.#..
....###.##

Tile 1091:
..######.#
.##..#..#.
........##
##..#.#.#.
.....###..
..#...#..#
..#.#.#...
...#.....#
#.#.##.#.#
#.....##.#

Tile 2609:
#.#.#...##
#..#..#..#
...####...
..#.#..#.#
#...##.#..
#.##.#..##
#..##....#
#.#...#.#.
.#...##...
.#.###...#

Tile 3527:
.#....###.
#..#...#.#
........##
#.#..#..#.
.......#.#
........##
#.....#...
##..####..
#..##...#.
.#.#.##..#

Tile 1229:
.#####.##.
...#.#....
#.#.##...#
.#...##..#
#....#...#
#.#..#...#
.#....#...
....#....#
#.#......#
#.#####.##

Tile 2549:
.#####....
#........#
.#.##.....
#.#...#..#
#.#......#
...#..#..#
...#...#..
##...##..#
.#.#......
####.#...#

Tile 2131:
#.#..#.#.#
##..#.....
#.#..##..#
#...#....#
###.......
#..#######
....#.....
#...#....#
...#.#...#
#...#...#.

Tile 1201:
#...#.#.##
.....#....
##..#.#..#
...#..#..#
.....#...#
..##..#.##
#.#.#..#.#
.....#.#.#
###.#.#..#
..#.##...#

Tile 1321:
.#..#...##
#.#...##..
...#.....#
#....##..#
#.........
.#.......#
#.##....#.
.#..##.###
#...#...##
#.########

Tile 2999:
.......#..
.....#....
.##.......
#..#.....#
#...#.....
####.#..#.
.#...###.#
##.....#.#
#.####...#
.##.......

Tile 1621:
####.....#
..#..#..#.
.#...###..
##...##...
#..#......
#..##.#...
...#..#..#
.##...##.#
......#..#
.#..#...#.

Tile 1483:
.#####..#.
.#...#...#
#.#.#..#..
....####..
#..#..####
...##.....
....#.#...
..#..##...
#..##.#...
.###...#.#

Tile 1579:
.#..######
##..#....#
..#......#
#...#..#..
#........#
#.#.#.#..#
#..#.##.##
#....##.##
.#....##..
##...#####

Tile 2251:
.#.###..##
...##....#
........##
..#..#####
#..#..#..#
#......#..
##.##....#
#........#
........##
#.###...#.

Tile 1511:
#..##.##.#
..#.....##
##.......#
##...#...#
#.##.##.##
#......#..
#..#......
#.#...##.#
.#........
..#..##.##

Tile 3613:
##.###..##
....#..##.
##..#.#...
..###.##.#
.#.###....
#.#.##....
.#.#..##..
#.......#.
......###.
.#..###.##

Tile 1663:
#...#...##
......#.#.
###.#.#..#
#..#......
#.....#.#.
..........
#.....##..
..........
...#.#...#
#.##..#...

Tile 1997:
##...#....
.#.#.....#
##.#.#....
.#.#..#...
...#.#....
.##.##.##.
#...####.#
..#.......
#.#...#...
.#..#.....

Tile 2371:
#.###.#...
##...###.#
#....##.##
#......#.#
##..##....
#.#...##.#
##...##..#
.....#...#
.##.......
##.....#.#

Tile 3709:
.#..##.#.#
###.#..#..
##.#..##..
##.....#.#
..........
#......##.
....#...#.
.#...#....
.#......##
.#....####

Tile 2143:
######.#..
##..#...#.
#...#.....
.#.#...#.#
.....#....
........##
#..#......
.#.#.....#
...#....##
....#..##.

Tile 2621:
##.##.##..
....#..#.#
#..###....
#....#....
.........#
##....#...
###..#...#
.##.......
.#....#.##
..#..#####

Tile 3221:
.....#....
.....##.#.
.......#..
#...#.....
#..#.#...#
#.#....#.#
#........#
.......##.
#.#......#
#..#.#..#.

Tile 1447:
.##..####.
#........#
.#......#.
........##
...#..####
.#....#...
###...#..#
.#..#.#..#
#.##.#...#
.##.#####.

Tile 2551:
.#####..#.
......#...
..#.......
.##.##..##
..#..#....
#..#.....#
......#.##
#.....#..#
#...#..##.
..##...#..

Tile 2851:
####.##..#
..........
....##...#
##.......#
...##..#.#
.#......##
.......#..
#..#.#....
.#.....#.#
.#...#..##

Tile 2129:
#.#.####..
.#.....#..
#.........
#..#......
#.#...#...
#......#..
.#....#..#
..#.#..#.#
#..#....##
#.##.###.#

Tile 1753:
#..#...#.#
##.......#
#....##.#.
#.......##
#...#...##
#.##......
...#..##..
...#.....#
###......#
#......#.#

Tile 1471:
####..##.#
#......##.
#..##.#...
.#...#..##
##.#.#.#.#
......#..#
#...#....#
#....#..#.
#..#..##..
.##.#.###.

Tile 1019:
#..####...
.....#....
#.........
..#......#
#.#..#....
.##.#.#...
....#....#
#...##...#
...#......
#..#####.#

Tile 3467:
......####
#....##.##
...##..#.#
#.....##..
#.##.#...#
..##...###
........#.
#......##.
.......##.
####.#.#.#

Tile 1223:
.#.#..##.#
#.........
#.#...#..#
.....#...#
###..#....
#..###...#
.....#..##
#..#..##..
.#.###....
##.##.##.#

Tile 2293:
##..#..##.
......#...
#......#..
..#.......
#..#...###
..#....##.
......####
....###.#.
#..##.##.#
..#...#..#

Tile 2647:
.#.#......
..#..##..#
.....#....
#......##.
#........#
#.#..#...#
#....##..#
##...#....
....#....#
#.#...####

Tile 1931:
.#..##.#.#
##.#.....#
#...#....#
#....#.#.#
.#....##.#
...#..#..#
##..##...#
##........
.#..#....#
...#..###.

Tile 2819:
.##.###.#.
.........#
#...#....#
#...#.##..
.....##.#.
.#..##...#
#....#..#.
#..#.##.##
#..##....#
.......###

Tile 2749:
##..#...#.
#..##....#
###......#
##...#.##.
#.###..##.
.#.##....#
#.......#.
...#...#..
#...#...#.
.#..##...#

Tile 2309:
#......###
##....#..#
#..#...###
#.......##
##........
..#####..#
..##..#..#
..#.......
#......#..
.###..#.##

Tile 2203:
..#..#..#.
.#....##.#
.........#
...#.#....
#.....#...
.......#..
#........#
#....#..##
.....#.#.#
.#.###.###

Tile 1697:
...#.#..#.
#.......#.
.##....#.#
#....#.##.
....#..###
....#..#.#
....#..#.#
##..##..##
.......#..
..#.#.#...

Tile 3413:
#.#.#...##
......#..#
...###....
...###....
....#.#..#
.....##...
.........#
......#...
.....#....
.##....#..

Tile 3169:
..#.#.##..
..........
#.........
##..#..##.
......#..#
#..#.#....
#.#.......
.......##.
..#.##.#..
.#..##.##.

Tile 2153:
#.#.#.#.##
#.....#..#
........##
#....##...
#...#....#
#.#.......
#.####..#.
...#.###.#
..#.#.....
##.##.##.#

Tile 1031:
.######.#.
....##...#
...##...#.
....##..##
.#...##...
.........#
.#...#..#.
......#..#
..##.....#
##....####

Tile 1097:
.#.#.#.###
#..###.#.#
....#.....
...#..#..#
.#....##.#
#..#.#....
....#..##.
##.###.#.#
...#.#..#.
.#.#.##...

Tile 1789:
###...##..
#.........
...#.....#
#....#....
##...#....
...#...#..
....#..#.#
..........
..#.#..#.#
###.#..###

Tile 3701:
#...#.#.##
#.#...#..#
#....#...#
.....#..##
#.....##.#
...#..##.#
#.....#...
#...#.....
#.......#.
#...#.##.#

Tile 3617:
#...##.#..
..##...#..
...##.....
.#.....###
..#.#####.
###.#.#.#.
.#.#.#...#
#....##...
#.....###.
##.#...###

Tile 3727:
####...##.
#..#....##
##.#.##..#
...##.##..
....#.....
##....##..
#....##.##
....##....
##..##....
.#....##.#

Tile 3343:
...##.#...
..#.#.....
.....#..#.
#...##.#..
#.#.#....#
...#......
....##..##
...#######
.#..#....#
.#.###...#

Tile 3313:
...####.##
#.#.#.....
#..##...##
.#.#.##..#
#...#....#
..#..#....
.#..#.....
##.##...##
...#......
.###....##

Tile 1847:
..##.##.##
##...#.#..
##...#....
#.#......#
#....#....
.......##.
##.#.#.#.#
...#..#..#
....#..#..
#..##..##.

Tile 3557:
..#..#####
......#..#
#.....#..#
..#.......
#.......##
###.#....#
.#.....#.#
##........
#...#.....
.##...#.##

Tile 1867:
...##.###.
#......##.
#.#.#...#.
#........#
#.....#...
#....#...#
.#..#.#...
...###....
##.#..#.##
#..#.###..

Tile 2039:
##.#.#####
#.#....#..
.#.#.....#
##.....#..
###..#..##
....#.....
##..##....
.........#
..#.#.#..#
###...#.##

Tile 3301:
..#..##..#
....#...#.
#....###..
.....#..#.
....##...#
#......#..
....#....#
......####
.......###
..#..###.#

Tile 1213:
..#.#..#..
#.#....###
..#......#
##.#......
..#....###
...#.....#
.#.#.....#
#.#.....##
..##.#..#.
...#...#.#

Tile 2437:
#.#####.##
.##...#.##
#..#.#...#
.....#....
.##...#.#.
....##.#..
#...#.....
##.#..#..#
#....#..##
.#.######.

Tile 3511:
.#.###.##.
...#...#..
#...#.##.#
.....#....
.#........
........#.
##.#......
....#.....
....#...#.
.#.##..##.

Tile 2719:
..#.#.###.
#.##...#..
...#..##..
#........#
.........#
.....####.
#.....#.#.
#.#.......
...#...##.
###.##..#.
"""
}