# Install the broker
include_recipe "reviewbot::broker"

# Install the extension
include_recipe "reviewbot::extension"

# Install the worker
include_recipe "reviewbot::worker"
