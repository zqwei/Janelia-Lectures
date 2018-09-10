## Installation
* location: `dm11/imaging/LM/Imaris_Workshop`
* installation license: `*.lic` file


## Imaris Basic: 3D visualization techniques and animations

### Open file
* Open -- resampling

### Display adjustment
* Edit -- `Show display adjustment`
    * change color of channel
    * auto adjust all channels
* Volume
    * `Blend` -- add `Opacity` transition of rendering
    * `Shadow Projection` -- most computational complex rendering
    * `Normal`
    * `MIP`
* Light Source `Camera` -- light source

### Snapshot and movie
* `Snapshot`
* `Animation`
    * key frame animations
* `3D View`
    * `Ortho Slicer`
    * `Oblique Slicer`
    * `Clipping Plane` (put it under frame)

## Object detection/Co-localization using spot segmentation and Matlab XTensions

### `3D View` -- `Spots` and `Create` Flow
* `Segment only a region of interest`
    * `Estimated XY diameter` using `Measurement Points` or `Slicing tool`
    * `Background subtraction` -- 3D Mexican hat filter, solving the different dynamic range of the points in the image
* `Different spot sizes`
### Co-localization
* `Coloc`
* `Spots` -- `Tools` -- `Colocalized spots`

## Volumetric measurements using surface segmentation

### `3D View` -- `Surfaces`: Other shape not described well using spheres
* Using local maximum from `Background subtraction`
* Trick of `Smooth` to reveal different details
* Trick of `Split touching objects` to cut the adjacent objects
   * `Seed points diamenter`
   * Watershed algorithm to break down neighbors 
* The created surface can be used a mask for other channels
* Check splitted objects
   * `Color` -- `Object ID`
   * `Filter` -- `Volume` etc.
* Manually -- change mode to `Select`
   * merge -- `control` then select merged objects -- then in `Edit` selecting `unify`
   * split -- `shift` then draw cuts -- then in `Edit` selecting `split`
   
### `Vantage`
* Statistics in 
   * 1D view
   * objects view

### Manual
* `Surface` -- `Draw` -- `Contour` -- `Mode` -- `Draw`: mannual draw ROI
* `Surface` -- `Draw` -- `Contour` -- `Mode` -- `Isoline`: semi-automatic draw ROI
* `Surface` -- `Draw` -- `Board`: copy and paste created ROI from one plane to the other
* `Surface` -- `Edit` -- `Mask`: mask data using surface

## 3D particle tracking

## Batch analysis and exporting
