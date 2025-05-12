= Introduction <introduction>
The WTF-File format is a *byte-aligned*, *binary image file format* designed to represent both *static and animated images* in a compact and extensible way. It defines a strict layout where every component—fixed or variable in size—is stored in complete bytes, simplifying parsing and reducing implementation complexity.

Each WTF file begins with a *1-byte version field* and a* 9-byte header*, followed by a *flexible set of sections* including a *Color Lookup Table (CLUT)*, *metadata*, and *image data*. All fields are modular and aligned to byte boundaries, enabling deterministic reading without the need for bit-level operations.

*The format supports:*
- Up to *65,535 × 65,535 pixels* per image
- *Five color spaces*: Grayscale, RGB, CMY, HSV, and YCbCr
- *Three transparency modes*: None, fixed, and per-pixel (dynamic)
- *Animation* with up to 255 frames and frame timing ranging from 1 frame every 127 seconds to 127 frames per second
- *Compression* via a optional CLUT for image data

Metadata is included using key-value pairs, where keys are restricted to non-control ASCII characters and values may contain arbitrary UTF-8 text. Padding bytes are used throughout to maintain byte alignment and structural consistency.

The WTF-File format’s strict byte alignment and fixed structure ensure efficient parsing with minimal overhead. Each segment is designed to be processed sequentially or mapped directly into memory, eliminating the need for bit-level operations. This makes the format ideal for low-level systems, embedded environments, custom renderers, or situations where precise control over file structure, memory usage, and data access speed is required.


