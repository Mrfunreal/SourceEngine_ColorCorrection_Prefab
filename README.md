# SourceEngine ColorCorrection Prefab
These files aid you in creating ColorCorrections for the source engine using third party tools.<br>
While Photoshop can natively read and write RAW formats, many others can not.

Requirements: FFMPEG + Gimp (Any image editor with Non-Destructive adjustment layers works.)<br>
To install FFMPEG, open CMD and run `Winget Install FFMPEG`

Usage:
1. Load map
2. Disable CC entities via `Mat_ColCorrection_DisableEntities 1`<br>
   Some games require `script Convars.SetValue("Mat_ColCorrection_DisableEntities",1)`<br>
   Others need the launch setting `+Mat_ColCorrection_DisableEntities 1`
3. Take screenshots, close game
4. Load screenshot into image editor, add ColorChart.tga onto it.
5. Adjust colors using the adjustment layers (In gimp, grouping of images, and color adjusment to the group is needed)
6. Apply the adjustments to only the colorchart.
7. Export modified colorchard as a TGA (No edits to resolution or lossy compression - Gimp's "RLE compression" is lossless)
8. Drag TGA onto Convert_CC.bat.
9. Rename the new .Raw file according to your needs
