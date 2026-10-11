# Sprite format

Each pet folder contains `pet.json` and the image named by `spritesheetPath`.
The relative image path keeps the package portable.

```json
{
  "id": "rebecca",
  "displayName": "Rebecca",
  "description": "A custom animated companion.",
  "spriteVersionNumber": 2,
  "spritesheetPath": "spritesheet.webp"
}
```

Atlas: 1536 × 2288 pixels; 8 columns × 11 rows; cells 192 × 208 pixels.
Rows and columns are zero-based. Unused cells are fully transparent.

| Row | State | Animation frames |
| --- | --- | --- |
| 0 | Idle | 6; column 6 holds the neutral reference |
| 1 | Moving right | 8 |
| 2 | Moving left | 8 |
| 3 | Waving/greeting | 4 |
| 4 | Jumping | 5 |
| 5 | Failed | 8 |
| 6 | Waiting for input | 6 |
| 7 | Active work | 6 |
| 8 | Review | 6 |
| 9 | Look directions, first half | 8 |
| 10 | Look directions, second half | 8 |

The look directions progress clockwise in screen coordinates. Zero degrees means up,
90 right, 180 down, and 270 left. Row 9 runs 0 through 157.5 degrees; row 10 runs
180 through 337.5 degrees, in increments of 22.5 degrees. Neutral gaze uses the
idle reference rather than the zero-degree upward-looking pose.

Rebecca draws her pistol during the greeting row. Amelia waves a British flag.
The active-work row represents focused work, not running on foot. Sleep poses in
earlier concept previews are not separate states in this atlas format.
