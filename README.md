# For ODMB development projects
Please add folders when adding a feature to make it easier to compare between versions.

## How to do git sparse-checkout
0. Requries git version above 2.25. (Please source the vivadoEnvironment script)
1. Checkout the root directory
~~~~bash
git clone https://github.com/odmb/odmbDevelopment.git --no-checkout --filter=blob:none
cd odmbDevelopment
git sparse-checkout init --cone # to fetch only root files
~~~~

2. Choose what folder to checkout
~~~~bash
git sparse-checkout set KintexUltrascale_Template
~~~~

### More commands
Adding more to checkout
~~~~bash
git sparse-checkout add odmb_alct_projects/odmb_alct_full/firmware
~~~~

Revert to only root directory
~~~~bash
git sparse-checkout set ./
~~~~

Listing what is checked out
~~~~bash
git sparse-checkout list
~~~~
