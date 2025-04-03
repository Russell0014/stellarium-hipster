# HIPSTER

A Docker-containerized version of the Stellarium HIPSTER tool for generating HiPS (Hierarchical Progressive Surveys) from spherical projected images.

Based on: [Stellarium HIPSTER Tool](https://github.com/Stellarium/stellarium-data/tree/master/hipster)

This container provides an isolated environment for running the HIPSTER tool, ensuring consistent behavior across different systems.

## Features

- Converts spherical projected images to HiPS format
- Supports multiple coordinate frames (equatorial, galactic)
- Custom positioning with theta/phi parameters
- Image optimization options
- Bump map to normal map conversion

## Supported Input Formats

- JPEG
- PNG
- WebP

## Installation

### Using Docker

1. Build the Docker image:

```bash
docker build -t hipster-dev .
```

2. Run the development container:

```bash
docker run -it --rm \
    -v $(pwd):/app \
    -w /app \
    hipster-dev
```

### Building from Source

Inside the container or on your local system:

```bash
make
```

## Usage

Basic syntax:

```bash
hipster [options] <input-image>
```

### Common Examples

1. Create a survey in galactic coordinates:

```bash
hipster --frame=galactic -o output_directory input_image.jpg
```

2. Create a survey with specific center position:

```bash
hipster --theta=45 --phi=180 -o output_directory input_image.jpg
```

3. Create optimized PNG output with compression:

```bash
hipster --pngquant -f png -o output_directory input_image.jpg
```

4. Convert bump maps to normal maps:

```bash
hipster --bump-to-normal -o output_directory bump_map.jpg
```

## Options

Use the help command to see all available options:

```bash
hipster --help
```

## License

This project is a containerized version of the [Stellarium HIPSTER Tool](https://github.com/Stellarium/stellarium-data), which is part of the Stellarium project. The original code and this containerized version are licensed under the GNU General Public License v2.0.

For more details, see the [Stellarium Project License](https://github.com/Stellarium/stellarium-data/blob/master/LICENSE).
