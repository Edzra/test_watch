FROM alpine

# Copy a file into the image (force rebuild when file changes)
COPY unchache.txt /unchache.txt

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
