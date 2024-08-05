# My Java Mini App with Multi-Stage Dockerfile and jlink

This repository contains a simple Java mini application that demonstrates the use of a multi-stage Dockerfile along with the `jlink` command from the Java JDK. The purpose of this project is to create a custom, lightweight Java runtime image tailored specifically for this application, and to leverage Docker's multi-stage builds for efficient and optimized containerization.

## Why Use jlink?

`jlink` is a tool provided by the Java JDK that allows you to create a custom runtime image containing only the modules your application requires. This has several benefits:

1. **Reduced Size:** By including only the necessary modules, the size of the runtime environment is significantly reduced compared to a full JDK or JRE.
2. **Improved Performance:** The custom runtime image can improve performance by eliminating unnecessary components.
3. **Enhanced Security:** A smaller runtime surface area reduces potential attack vectors, improving the security of the application.

## Why Use Docker Multi-Stage Builds?

Docker multi-stage builds are a powerful feature that enables the creation of small, efficient Docker images. In a multi-stage build, you can use multiple `FROM` statements in a Dockerfile, each starting a new build stage. This approach allows you to separate the build environment from the runtime environment, leading to several advantages:

1. **Smaller Image Size:** By copying only the necessary files from the build stage to the final image, you can drastically reduce the size of the resulting Docker image.
2. **Separation of Concerns:** You can use different base images for building and running the application, ensuring that the runtime image contains only what is needed to run the application.
3. **Improved Build Efficiency:** Multi-stage builds can speed up the build process by allowing the reuse of layers, reducing the time needed to build subsequent images.
