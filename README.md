FLOSIC Documentation
====================

This is the source code for FLOSIC's documentation update.
**Og_man** contains the original source code for the last published documentation.
**Updt_Man** contains the updated version of the code, this includes:
- Changed file layout
- Updated Information
     
## How to Compile:

You will need the *Sphinx* documentation generator and the *PyData* theme. You can install them with pip,
    
    $ pip install Sphinx pydata-sphinx-theme

Once you have installed these, you can run compile the documentation in different formats (see recipes in Makefile for reference). To build the html output:
     
     $ make html

The **html** target will build the output into the `BUILDDIR` variable, which is set to **_build**.

## Updating the Documentation:

Sphinx uses the reSructuredText markup language. Reference can be found here: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

## Future Updates:

- Have a concrete list of additions to make and have done by the end of the Summer 20223.
- Add Suggestions for contributors in the README file

## Additional Support:
If you have any questions please email me directly at ville2a@cmich.edu

If you have suggestions, please post onto the Issues section. 
