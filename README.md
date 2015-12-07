pathr
============


[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Build
Status](https://travis-ci.org/trinker/pathr.svg?branch=master)](https://travis-ci.org/trinker/pathr)
[![Coverage
Status](https://coveralls.io/repos/trinker/pathr/badge.svg?branch=master)](https://coveralls.io/r/trinker/pathr?branch=master)
<a href="https://img.shields.io/badge/Version-0.0.1-orange.svg"><img src="https://img.shields.io/badge/Version-0.0.1-orange.svg" alt="Version"/></a>
</p>
<img src="inst/pathr_logo/r_pathr.png" width="320" alt="pathr Logo">

**pathr** is a collection of tools to extract, examine, and reconfigure
elements of file paths.

Function Usage
==============

Functions typically fall into the task category of (1) parsing, (2)
manipulating, (3) examining. The main functions, task category, &
descriptions are summarized in the table below:

<table>
<thead>
<tr class="header">
<th align="left">Function</th>
<th align="left">Task</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><code>parse_path</code></td>
<td align="left">parsing</td>
<td align="left">Parse path into elements (sub-directories &amp; files)</td>
</tr>
<tr class="even">
<td align="left"><code>front</code>/<code>back</code></td>
<td align="left">manipulate</td>
<td align="left">Get first/last n elements of a path</td>
</tr>
<tr class="odd">
<td align="left"><code>index</code></td>
<td align="left">manipulate</td>
<td align="left">Get indexed elements of a path</td>
</tr>
<tr class="even">
<td align="left"><code>before</code>/<code>after</code></td>
<td align="left">manipulate</td>
<td align="left">Get n elements before/after a regex occurrence</td>
</tr>
<tr class="odd">
<td align="left"><code>swap</code>/<code>swap_index</code>/<code>swap_regex</code></td>
<td align="left">manipulate</td>
<td align="left">Replace elements of a path</td>
</tr>
<tr class="even">
<td align="left"><code>normalize</code></td>
<td align="left">manipulate</td>
<td align="left">Make all path separators forward slashes</td>
</tr>
<tr class="odd">
<td align="left"><code>file_ext</code>/<code>no_file_ext</code></td>
<td align="left">manipulate</td>
<td align="left">Get/remove file extensions</td>
</tr>
<tr class="even">
<td align="left"><code>tree</code></td>
<td align="left">examine</td>
<td align="left">View path structure as an ascci style tree (experimental)</td>
</tr>
<tr class="odd">
<td align="left"><code>indent_path</code></td>
<td align="left">examine</td>
<td align="left">View path hierarchy as an indented list</td>
</tr>
</tbody>
</table>

The `copy` function is also available and extends
[`clipr::write_clipboard`](https://github.com/mdlincoln/clipr) to allow
the user to easily copy a path to the clipboard but return the original
value. This makes `copy` pipeable.


Table of Contents
============

-   [Function Usage](#function-usage)
-   [Installation](#installation)
-   [Contact](#contact)
-   [Demonstration](#demonstration)
    -   [Load the Packages/Data](#load-the-packagesdata)

Installation
============


To download the development version of **pathr**:

Download the [zip ball](https://github.com/trinker/pathr/zipball/master)
or [tar ball](https://github.com/trinker/pathr/tarball/master),
decompress and run `R CMD INSTALL` on it, or use the **pacman** package
to install the development version:

    if (!require("pacman")) install.packages("pacman")
    pacman::p_load_gh("trinker/pathr")

Contact
=======

You are welcome to: 
* submit suggestions and bug-reports at: <https://github.com/trinker/pathr/issues> 
* send a pull request on: <https://github.com/trinker/pathr/> 
* compose a friendly e-mail to: <tyler.rinker@gmail.com>


Demonstration
=============

***Under Construction*** - Excuse the sparsity/spelling in this early
development stage

Load the Packages/Data
----------------------

    if (!require("pacman")) install.packages("pacman")

    pacman::p_load(pathr, magrittr)

    data(files)
    head(files)

    ## [1] "~/Packages/qdap/contributors.geojson"
    ## [2] "~/Packages/qdap/data"                
    ## [3] "~/Packages/qdap/DESCRIPTION"         
    ## [4] "~/Packages/qdap/FAQ.md"              
    ## [5] "~/Packages/qdap/inst"                
    ## [6] "~/Packages/qdap/INSTALL"