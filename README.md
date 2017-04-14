pathr   [![Follow](https://img.shields.io/twitter/follow/tylerrinker.svg?style=social)](https://twitter.com/intent/follow?screen_name=tylerrinker)
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

![](tools/pathr_logo/r_pathr.png)

**pathr** is a collection of tools to extract, examine, and reconfigure
elements of file paths. The package is born out of a frustration with
finding the right base **R** tools to grab certain parts of a path.
Often these functions are located in packages that are base install but
not loaded by default (e.g., `tools::file_ext`). Additionally, many
names of path manipulation functions in base **R** are longer and thus
often difficult to remember and require more time to type. Still, other
path manipulation tasks had me building my own custom manipulation tools
via `strsplit` and `file.path`. **pathr** is designed to be a consistent
set of tools that allow the user to solve most path related needs simply
by remembering 7 basic sets of parsing and manipulation tools (the first
seven rows in the table of function usage found in the [Function
Usage](#function-usage) section). The package is designed to be pipeable
(easily used within a **magrittr**/**pipeR** pipeline) but is not
required.


Table of Contents
============

-   [Functions](#functions)
-   [Installation](#installation)
-   [Contact](#contact)
-   [Demonstration](#demonstration)
    -   [Load the Packages/Data](#load-the-packagesdata)
    -   [Parsing](#parsing)
    -   [Manipulating](#manipulating)
        -   [Extracting](#extracting)
        -   [Replacing](#replacing)
        -   [Combining](#combining)
        -   [Expanding](#expanding)
        -   [Miscellaneous](#miscellaneous)
    -   [Examination](#examination)
        -   [Tree](#tree)
        -   [Indented Elements](#indented-elements)
    -   [Action](#action)
        -   [Opening](#opening)
        -   [Copying](#copying)

Functions
============


Functions typically fall into the task category of (1) parsing, (2)
manipulating, (3) examining, & (4) action. The main functions, task
category, & descriptions are summarized in the table below:

<table>
<thead>
<tr class="header">
<th>Function</th>
<th>Task</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>parse_path</code></td>
<td>parsing</td>
<td>Parse path into elements (sub-directories &amp; files)</td>
</tr>
<tr class="even">
<td><code>front</code>/<code>back</code></td>
<td>manipulate</td>
<td>Get first/last n elements of a path</td>
</tr>
<tr class="odd">
<td><code>index</code></td>
<td>manipulate</td>
<td>Get indexed elements of a path</td>
</tr>
<tr class="even">
<td><code>before</code>/<code>after</code></td>
<td>manipulate</td>
<td>Get n elements before/after a regex occurrence</td>
</tr>
<tr class="odd">
<td><code>swap</code>/<code>swap_index</code>/<code>swap_regex</code></td>
<td>manipulate</td>
<td>Replace elements of a path</td>
</tr>
<tr class="even">
<td><code>file_path</code></td>
<td>manipulate</td>
<td>Combine file paths</td>
</tr>
<tr class="odd">
<td><code>expand_path</code></td>
<td>manipulate</td>
<td>Expand tilde prefixed file path</td>
</tr>
<tr class="even">
<td><code>normalize</code></td>
<td>manipulate</td>
<td>Make all path separators forward slashes</td>
</tr>
<tr class="odd">
<td><code>win_fix</code></td>
<td>manipulate</td>
<td>Replace single backslash with a forward slash</td>
</tr>
<tr class="even">
<td><code>file_ext</code>/<code>no_file_ext</code></td>
<td>manipulate</td>
<td>Get/remove file extensions</td>
</tr>
<tr class="odd">
<td><code>tree</code></td>
<td>examine</td>
<td>View path structure as an ASCII style tree (experimental)</td>
</tr>
<tr class="even">
<td><code>indent_path</code></td>
<td>examine</td>
<td>View path hierarchy as an indented list</td>
</tr>
<tr class="odd">
<td><code>copy_path</code></td>
<td>action</td>
<td>Copy path(s) to clipboard</td>
</tr>
<tr class="even">
<td><code>open_path</code></td>
<td>action</td>
<td>Open path(s) (directories &amp; file)</td>
</tr>
</tbody>
</table>

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
- submit suggestions and bug-reports at: <https://github.com/trinker/pathr/issues>    
- send a pull request on: <https://github.com/trinker/pathr/>    
- compose a friendly e-mail to: <tyler.rinker@gmail.com>    

Demonstration
=============

Load the Packages/Data
----------------------

    if (!require("pacman")) install.packages("pacman")

    pacman::p_load(pathr, magrittr)

    data(files)
    set.seed(11); (myfiles <- sample(files, 10))

    ##  [1] "~/Packages/qdap/R/cm_range2long.R"   
    ##  [2] "~/Packages/qdap/contributors.geojson"
    ##  [3] "~/Packages/qdap/R/mcsv_r.R"          
    ##  [4] "~/Packages/qdap/DESCRIPTION"         
    ##  [5] "~/Packages/qdap/README.md"           
    ##  [6] "~/Packages/qdap/R/wfm.R"             
    ##  [7] "~/Packages/qdap/R/adjacency_matrix.R"
    ##  [8] "~/Packages/qdap/R/xnoy.R"            
    ##  [9] "~/Packages/qdap/R/termco.R"          
    ## [10] "~/Packages/qdap/R/bag_o_words.R"

Parsing
-------

The `parse_path` function simply splits an atomic vector of paths into a
list of paths split on the slash separator. For example, my current
working directory, C:/Users/Tyler/GitHub/pathr, becomes:

    getwd() %>%
        parse_path()

    ## [[1]]
    ## [1] "C:"     "Users"  "Tyler"  "GitHub" "pathr"

While this isn't earth shattering it allows the **pathr** manipulation
functions to extract, replace, and recombine parts of the *path*
*elements* into a *sub-path*. Here I use *path* to mean the original
path, C:/Users/Tyler/GitHub/pathr. A path is simply a slash separated
mapping of the location of a file or directory within a hierarchical
order of sub-directories. These sub-directories are the *elements* of
the path. The final output from one of the manipulation functions is a
*sub-path* of the original at most the same number of elements as the
original.

In this example I parse a multi-path vector:

    myfiles %>%
        parse_path()

    ## [[1]]
    ## [1] "~"               "Packages"        "qdap"            "R"              
    ## [5] "cm_range2long.R"
    ## 
    ## [[2]]
    ## [1] "~"                    "Packages"             "qdap"                
    ## [4] "contributors.geojson"
    ## 
    ## [[3]]
    ## [1] "~"        "Packages" "qdap"     "R"        "mcsv_r.R"
    ## 
    ## [[4]]
    ## [1] "~"           "Packages"    "qdap"        "DESCRIPTION"
    ## 
    ## [[5]]
    ## [1] "~"         "Packages"  "qdap"      "README.md"
    ## 
    ## [[6]]
    ## [1] "~"        "Packages" "qdap"     "R"        "wfm.R"   
    ## 
    ## [[7]]
    ## [1] "~"                  "Packages"           "qdap"              
    ## [4] "R"                  "adjacency_matrix.R"
    ## 
    ## [[8]]
    ## [1] "~"        "Packages" "qdap"     "R"        "xnoy.R"  
    ## 
    ## [[9]]
    ## [1] "~"        "Packages" "qdap"     "R"        "termco.R"
    ## 
    ## [[10]]
    ## [1] "~"             "Packages"      "qdap"          "R"            
    ## [5] "bag_o_words.R"

Manipulating
------------

Once the path has been parsed the individual elements can be extracted
and/or replaced to form sub-paths. In this section I break the
manipulation functions into (1) extracting (2) replacing, (3) combining,
and (4) expanding types. There are a few miscellaneous **pathr**
functions that are not an extracting, replacing, combining, or expanding
tool which will be discussed at the end of the Manipulating section.

### Extracting

Extracting can replace path elements by their numeric index or by their
content relative to a matched regular expression. There are three sets
of extracting functions (1) `front`/`back`, (2) `index`, and (3)
`before`/`after`. The first two rely on matching elements to their
numeric position while the latter set uses extraction relative to a
regular expression match.

#### Front & Back

The `front`/`back` set of functions works like `head`/`tail` (in fact
these functions are used under the hood). The user can select the first
`n` elements using `front` or the last `n` elements using `back`. These
functions require that users want either the first or last element of
the path in their sub-path.

Here I replicate base **R**'s `dirname` & `basename` functions using the
default settings of `front` & `back` as `dirname` is taking
`head(x, -1)` elements (or all but the last element) and `basename` is
taking `tail(x, 1)` (or the last element).

    myfiles %>%
        parse_path() %>%
        front()

    ##  [1] "~/Packages/qdap/R" "~/Packages/qdap"   "~/Packages/qdap/R"
    ##  [4] "~/Packages/qdap"   "~/Packages/qdap"   "~/Packages/qdap/R"
    ##  [7] "~/Packages/qdap/R" "~/Packages/qdap/R" "~/Packages/qdap/R"
    ## [10] "~/Packages/qdap/R"

    myfiles %>%
        dirname()

    ##  [1] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [2] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [3] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [4] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [5] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [6] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [7] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [8] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [9] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ## [10] "C:/Users/Tyler/Documents/Packages/qdap/R"

    myfiles %>%
        parse_path() %>% 
        back()

    ##  [1] "cm_range2long.R"      "contributors.geojson" "mcsv_r.R"            
    ##  [4] "DESCRIPTION"          "README.md"            "wfm.R"               
    ##  [7] "adjacency_matrix.R"   "xnoy.R"               "termco.R"            
    ## [10] "bag_o_words.R"

    myfiles %>%
        basename()

    ##  [1] "cm_range2long.R"      "contributors.geojson" "mcsv_r.R"            
    ##  [4] "DESCRIPTION"          "README.md"            "wfm.R"               
    ##  [7] "adjacency_matrix.R"   "xnoy.R"               "termco.R"            
    ## [10] "bag_o_words.R"

But the `front`/`back` set is more versatile still as demonstrated
below:

    myfiles %>%
        parse_path() %>%
        front(3)

    ##  [1] "~/Packages/qdap" "~/Packages/qdap" "~/Packages/qdap"
    ##  [4] "~/Packages/qdap" "~/Packages/qdap" "~/Packages/qdap"
    ##  [7] "~/Packages/qdap" "~/Packages/qdap" "~/Packages/qdap"
    ## [10] "~/Packages/qdap"

    myfiles %>%
        parse_path()  %>% 
        back(3)

    ##  [1] "qdap/R/cm_range2long.R"            
    ##  [2] "Packages/qdap/contributors.geojson"
    ##  [3] "qdap/R/mcsv_r.R"                   
    ##  [4] "Packages/qdap/DESCRIPTION"         
    ##  [5] "Packages/qdap/README.md"           
    ##  [6] "qdap/R/wfm.R"                      
    ##  [7] "qdap/R/adjacency_matrix.R"         
    ##  [8] "qdap/R/xnoy.R"                     
    ##  [9] "qdap/R/termco.R"                   
    ## [10] "qdap/R/bag_o_words.R"

#### Indices

The `index` function compliments the `front`/`back` set by allowing the
user to select the middle elements of a path. Unlike `front`/`back`, the
`index` function does not require elements to be sequential. The user
will get a sub-path equal in length to the length of the `inds`
argument.

    myfiles %>%
        parse_path() %>%
        index(4)

    ##  [1] "R"                    "contributors.geojson" "R"                   
    ##  [4] "DESCRIPTION"          "README.md"            "R"                   
    ##  [7] "R"                    "R"                    "R"                   
    ## [10] "R"

    myfiles %>%
        parse_path() %>%
        index(2:4)

    ##  [1] "Packages/qdap/R"                   
    ##  [2] "Packages/qdap/contributors.geojson"
    ##  [3] "Packages/qdap/R"                   
    ##  [4] "Packages/qdap/DESCRIPTION"         
    ##  [5] "Packages/qdap/README.md"           
    ##  [6] "Packages/qdap/R"                   
    ##  [7] "Packages/qdap/R"                   
    ##  [8] "Packages/qdap/R"                   
    ##  [9] "Packages/qdap/R"                   
    ## [10] "Packages/qdap/R"

    myfiles %>%
        parse_path() %>%
        index(c(2, 4))

    ##  [1] "Packages/R"                    "Packages/contributors.geojson"
    ##  [3] "Packages/R"                    "Packages/DESCRIPTION"         
    ##  [5] "Packages/README.md"            "Packages/R"                   
    ##  [7] "Packages/R"                    "Packages/R"                   
    ##  [9] "Packages/R"                    "Packages/R"

#### Before & After Regex

The `before`/`after` differ from the previous sets of manipulation
functions in that it allows the user to select elements based on their
content rather than numeric position. The user provides a regular
expression to match against. All elements `before` or `after` this regex
match will be selected for use in the sub-path. The user may include the
regex matched element by setting `include = TRUE`.

Here I extract all elements after the element containing the regex
`"^qdap$"`.

    myfiles %>%
        parse_path() %>%
        after("^qdap$")

    ##  [1] "R/cm_range2long.R"    "contributors.geojson" "R/mcsv_r.R"          
    ##  [4] "DESCRIPTION"          "README.md"            "R/wfm.R"             
    ##  [7] "R/adjacency_matrix.R" "R/xnoy.R"             "R/termco.R"          
    ## [10] "R/bag_o_words.R"

The user can include the element that matched the regex as well using
`include = TRUE`:

    myfiles %>%
        parse_path() %>%
        after("^qdap$", include = TRUE)

    ##  [1] "qdap/R/cm_range2long.R"    "qdap/contributors.geojson"
    ##  [3] "qdap/R/mcsv_r.R"           "qdap/DESCRIPTION"         
    ##  [5] "qdap/README.md"            "qdap/R/wfm.R"             
    ##  [7] "qdap/R/adjacency_matrix.R" "qdap/R/xnoy.R"            
    ##  [9] "qdap/R/termco.R"           "qdap/R/bag_o_words.R"

Here I use `before` to extract all elements before the regex match to
paths that contain an element with a file that ends in `.R`. If a path
does not contain that element match `NA` is returned.

    myfiles %>%
        parse_path() %>%
        before("\\.R$")

    ##  [1] "~/Packages/qdap/R" NA                  "~/Packages/qdap/R"
    ##  [4] NA                  NA                  "~/Packages/qdap/R"
    ##  [7] "~/Packages/qdap/R" "~/Packages/qdap/R" "~/Packages/qdap/R"
    ## [10] "~/Packages/qdap/R"

### Replacing

Often the user will want to replace elements of a path with another. The
`swap` function allows the user to match with a numeric index or a
regular expression to determine the element locations to be replaced.
The `swap_index` & `swap_regex` functions are less flexible than the
more inclusive function but are also more explicit, transparent and
pipeable. Preference is typically given to the later `swap_xxx`
functions in chained usage.

#### `swap`

In this scenario I replace the root tilde with `MyRoot`:

    myfiles %>%
        parse_path() %>%
        swap(1, "MyRoot")

    ##  [1] "MyRoot/Packages/qdap/R/cm_range2long.R"   
    ##  [2] "MyRoot/Packages/qdap/contributors.geojson"
    ##  [3] "MyRoot/Packages/qdap/R/mcsv_r.R"          
    ##  [4] "MyRoot/Packages/qdap/DESCRIPTION"         
    ##  [5] "MyRoot/Packages/qdap/README.md"           
    ##  [6] "MyRoot/Packages/qdap/R/wfm.R"             
    ##  [7] "MyRoot/Packages/qdap/R/adjacency_matrix.R"
    ##  [8] "MyRoot/Packages/qdap/R/xnoy.R"            
    ##  [9] "MyRoot/Packages/qdap/R/termco.R"          
    ## [10] "MyRoot/Packages/qdap/R/bag_o_words.R"

#### `swap_index` & `swap_regex`

In the next use I replace `qdap` with `textMining` by referencing the
third element:

    myfiles %>%
        parse_path() %>%
        swap_index(3, "textMining")

    ##  [1] "~/Packages/textMining/R/cm_range2long.R"   
    ##  [2] "~/Packages/textMining/contributors.geojson"
    ##  [3] "~/Packages/textMining/R/mcsv_r.R"          
    ##  [4] "~/Packages/textMining/DESCRIPTION"         
    ##  [5] "~/Packages/textMining/README.md"           
    ##  [6] "~/Packages/textMining/R/wfm.R"             
    ##  [7] "~/Packages/textMining/R/adjacency_matrix.R"
    ##  [8] "~/Packages/textMining/R/xnoy.R"            
    ##  [9] "~/Packages/textMining/R/termco.R"          
    ## [10] "~/Packages/textMining/R/bag_o_words.R"

When the element position is unknown `swap_regex` provides a means to
replace elements:

    myfiles %>%
        parse_path() %>%
        swap_regex("^qdap$", "textMining")

    ##  [1] "~/Packages/textMining/R/cm_range2long.R"   
    ##  [2] "~/Packages/textMining/contributors.geojson"
    ##  [3] "~/Packages/textMining/R/mcsv_r.R"          
    ##  [4] "~/Packages/textMining/DESCRIPTION"         
    ##  [5] "~/Packages/textMining/README.md"           
    ##  [6] "~/Packages/textMining/R/wfm.R"             
    ##  [7] "~/Packages/textMining/R/adjacency_matrix.R"
    ##  [8] "~/Packages/textMining/R/xnoy.R"            
    ##  [9] "~/Packages/textMining/R/termco.R"          
    ## [10] "~/Packages/textMining/R/bag_o_words.R"

    myfiles %>%
        parse_path() %>%
        swap_regex("\\.R$", "function.R")

    ##  [1] "~/Packages/qdap/R/function.R"        
    ##  [2] "~/Packages/qdap/contributors.geojson"
    ##  [3] "~/Packages/qdap/R/function.R"        
    ##  [4] "~/Packages/qdap/DESCRIPTION"         
    ##  [5] "~/Packages/qdap/README.md"           
    ##  [6] "~/Packages/qdap/R/function.R"        
    ##  [7] "~/Packages/qdap/R/function.R"        
    ##  [8] "~/Packages/qdap/R/function.R"        
    ##  [9] "~/Packages/qdap/R/function.R"        
    ## [10] "~/Packages/qdap/R/function.R"

### Combining

While the above tools work to produce sub-paths with an equal or less
length of elements `file_path` is a means to combine/construct file
paths that may be greater in length than the original path/elements
supplied. `file_path` is wrapper for `base::file.path` that uses the
underscore naming convention and normalizes the separator to be a single
forward slash.

    file_path("root", "mydir", paste0("file", 1:2, ".pdf"))

    ## [1] "root/mydir/file1.pdf" "root/mydir/file2.pdf"

This is especially useful when combined with extraction/replacement
techniques to form new paths as shown below:

    myfiles %>%
        parse_path()  %>% 
        after("R$", include = TRUE)  %>%
        na.omit() %>%
        file_path("Root", "newPackage", .)

    ## [1] "Root/newPackage/R/cm_range2long.R"   
    ## [2] "Root/newPackage/R/mcsv_r.R"          
    ## [3] "Root/newPackage/R/wfm.R"             
    ## [4] "Root/newPackage/R/adjacency_matrix.R"
    ## [5] "Root/newPackage/R/xnoy.R"            
    ## [6] "Root/newPackage/R/termco.R"          
    ## [7] "Root/newPackage/R/bag_o_words.R"

### Expanding

Like `file_path` above, `expand_path` produces a path that is longer
than the input path. `expand_path` is wrapper for `base::path.expand`
used to expand tilde prefixed paths by replacing the leading tilde with
the user's home directory.

    expand_path("~/mydir/subdir/myfile.pdf")

    ## [1] "C:/Users/Tyler/Documents/mydir/subdir/myfile.pdf"

The user may have noticed that in the example [above](#extracting),
demonstrating `front`'s ability to mimic `dirname`, is incomplete. That
is the outputs from `front` and `dirname` are not identical. This is
because `dirname`, by default, expands the tilde in the example
`myfiles` whereas `front` does not. Simply adding `expand_path` on the
end of the chain replicates `dirname` exactly.

    myfiles %>%
        parse_path() %>% 
        front() %>%
        expand_path()

    ##  [1] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [2] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [3] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [4] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [5] "C:/Users/Tyler/Documents/Packages/qdap"  
    ##  [6] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [7] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [8] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ##  [9] "C:/Users/Tyler/Documents/Packages/qdap/R"
    ## [10] "C:/Users/Tyler/Documents/Packages/qdap/R"

### Miscellaneous

As noted above, **pathr** contains a few functions that are not an
extracting, replacing, combining, or extracting tool.

#### Normalizing

`normalize` replaces all path slash separators with an **R** friendly
forward slash.

    c("C:\\Users\\Tyler\\AppData\\Local\\Temp\\Rtmp2Ll9d9", "C:/R/R-3.2.2") %>%
        parse_path() %>%
        normalize()

    ## [1] "C:/Users/Tyler/AppData/Local/Temp/Rtmp2Ll9d9"
    ## [2] "C:/R/R-3.2.2"

#### Windows Fix (single backslashes)

`win_fix` reads an **R** unfriendly Windows path (single backslashes)
and replaces with friendly forward slashes. This functionality can't be
demonstrated within a knitr document because the single backslashes
can't be parsed or copied to the clipboard from within R.

If the user were to copy the following path,
`~\Packages\qdap\R\cm_code.overlap.R`, to the clipboard and run
`win_fix()` the result would be: `"~/Packages/qdap/R/cm_code.overlap.R"`

Examination
-----------

Functions of this class are designed to allow the user to examine
structural aspects of a path and contents.

### Tree

`tree` allows the user to see the hierarchical structure of a path's
contents (all the sub-directories and files contained within a parent
directory) as a tree. This function is (with default
`use.data.tree = FALSE`) OS dependent, and requires that the tree
program ([tree for
Windows](https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/tree.mspx?mfr=true)
or [tree for Unix](http://www.computerhope.com/unix/tree.htm)) be
installed.

On my Windows system this is the tree structure for the **pathr**
package as installed in **R** library:

    file_path(.libPaths(), "pathr") %>%
        tree()

    ## Folder PATH listing for volume Windows
    ## Volume serial number is 70BF-5124
    ## C:\R\R-3.3.3\LIBRARY\PATHR
    ## |   build.R
    ## |   CITATION
    ## |   DESCRIPTION
    ## |   INDEX
    ## |   maintenance.R
    ## |   NAMESPACE
    ## |   NEWS
    ## |   
    ## +---data
    ## |       Rdata.rdb
    ## |       Rdata.rds
    ## |       Rdata.rdx
    ## |       
    ## +---extra_statdoc
    ## |       readme.R
    ## |       
    ## +---help
    ## |       aliases.rds
    ## |       AnIndex
    ## |       pathr.rdb
    ## |       pathr.rdx
    ## |       paths.rds
    ## |       
    ## +---html
    ## |       00Index.html
    ## |       R.css
    ## |       
    ## +---Meta
    ## |       data.rds
    ## |       hsearch.rds
    ## |       links.rds
    ## |       nsInfo.rds
    ## |       package.rds
    ## |       Rd.rds
    ## |       
    ## +---R
    ## |       pathr
    ## |       pathr.rdb
    ## |       pathr.rdx
    ## |       
    ## +---staticdocs
    ## |       index.R
    ## |       
    ## \---tests
    ##     |   testthat.R
    ##     |   
    ##     \---testthat
    ##             test-before.R
    ##             test-class_manipulate.R
    ##             test-copy_path.R
    ##             test-file_path.R
    ##             test-front.R
    ##             test-indent_path.R
    ##             test-index.R
    ##             test-is.global.R
    ##             test-normalize.R
    ##             test-parse_path.R
    ##             test-swap.R
    ##             test-win_fix.R
    ## 

Users concerned with OS dependence can use a **data.tree**
implementation of `tree`. This version is slower but is uniform and
requires no outside sependencies to be installed. Additionally, the
output is a **data.tree** `"Node"` class and can be manipulated
accordingly.

    file_path(.libPaths(), "pathr") %>%
        tree(use.data.tree = TRUE)

    ##                              levelName
    ## 1  pathr                              
    ## 2   ¦--build.R                        
    ## 3   ¦--CITATION                       
    ## 4   ¦--data                           
    ## 5   ¦   ¦--Rdata.rdb                  
    ## 6   ¦   ¦--Rdata.rds                  
    ## 7   ¦   °--Rdata.rdx                  
    ## 8   ¦--DESCRIPTION                    
    ## 9   ¦--extra_statdoc                  
    ## 10  ¦   °--readme.R                   
    ## 11  ¦--help                           
    ## 12  ¦   ¦--aliases.rds                
    ## 13  ¦   ¦--AnIndex                    
    ## 14  ¦   ¦--pathr.rdb                  
    ## 15  ¦   ¦--pathr.rdx                  
    ## 16  ¦   °--paths.rds                  
    ## 17  ¦--html                           
    ## 18  ¦   ¦--00Index.html               
    ## 19  ¦   °--R.css                      
    ## 20  ¦--INDEX                          
    ## 21  ¦--maintenance.R                  
    ## 22  ¦--Meta                           
    ## 23  ¦   ¦--data.rds                   
    ## 24  ¦   ¦--hsearch.rds                
    ## 25  ¦   ¦--links.rds                  
    ## 26  ¦   ¦--nsInfo.rds                 
    ## 27  ¦   ¦--package.rds                
    ## 28  ¦   °--Rd.rds                     
    ## 29  ¦--NAMESPACE                      
    ## 30  ¦--NEWS                           
    ## 31  ¦--R                              
    ## 32  ¦   ¦--pathr                      
    ## 33  ¦   ¦--pathr.rdb                  
    ## 34  ¦   °--pathr.rdx                  
    ## 35  ¦--staticdocs                     
    ## 36  ¦   °--index.R                    
    ## 37  °--tests                          
    ## 38      ¦--testthat.R                 
    ## 39      °--testthat                   
    ## 40          ¦--test-before.R          
    ## 41          ¦--test-class_manipulate.R
    ## 42          ¦--test-copy_path.R       
    ## 43          ¦--test-file_path.R       
    ## 44          ¦--test-front.R           
    ## 45          ¦--test-indent_path.R     
    ## 46          ¦--test-index.R           
    ## 47          ¦--test-is.global.R       
    ## 48          ¦--test-normalize.R       
    ## 49          ¦--test-parse_path.R      
    ## 50          ¦--test-swap.R            
    ## 51          °--test-win_fix.R

### Indented Elements

`indent_path` on the other hand, works on individual paths (not
contents) to visualize the hierarchical structure of a path's elements.

    file_path(.libPaths(), "pathr/DESCRIPTION") %>%
        indent_path()

    ## -> C:
    ##   -> R
    ##     -> R-3.3.3
    ##       -> library
    ##         -> pathr
    ##           -> DESCRIPTION

Action
------

The last type of functions in **pathr** use the operating system to do
some sort of action.

### Opening

`open_path` uses the operating system defaults to open directories and
files. This function is operating system and setting dependent. Results
may not be consistent across operating systems. Depending upon the
default programs for file types the results may vary as well. Some files
may not be able to be opened.

#### Opening Directories

    open_path()

    file_path(.libPaths(), "pathr") %>%
        open_path()

#### Opening Files

    file_path(R.home(), "doc/html/about.html") %>%
        open_path()

### Copying

`copy_path` uses the [**clipr**]() package's `write_clip` function to
write the current vector, `x`, to the clipboard but still returns `x`.
This makes the copying pipeable, allowing the contents to be copied yet
be passed along in the chain.

    pacman::p_load(clipr)

    R.home() %>%
        list.files(full.names = TRUE) %>%
        copy_path() %>%
        parse_path() %>%
        back(1) 

    ##  [1] "bin"            "CHANGES"        "COPYING"        "doc"           
    ##  [5] "etc"            "include"        "library"        "MD5"           
    ##  [9] "modules"        "README"         "README.R-3.3.3" "share"         
    ## [13] "src"            "Tcl"            "tests"          "unins000.dat"  
    ## [17] "unins000.exe"

    ## What was copied to the clipboard
    clipr::read_clip()

    ##  [1] "C:/R/R-33~1.3/bin"            "C:/R/R-33~1.3/CHANGES"       
    ##  [3] "C:/R/R-33~1.3/COPYING"        "C:/R/R-33~1.3/doc"           
    ##  [5] "C:/R/R-33~1.3/etc"            "C:/R/R-33~1.3/include"       
    ##  [7] "C:/R/R-33~1.3/library"        "C:/R/R-33~1.3/MD5"           
    ##  [9] "C:/R/R-33~1.3/modules"        "C:/R/R-33~1.3/README"        
    ## [11] "C:/R/R-33~1.3/README.R-3.3.3" "C:/R/R-33~1.3/share"         
    ## [13] "C:/R/R-33~1.3/src"            "C:/R/R-33~1.3/Tcl"           
    ## [15] "C:/R/R-33~1.3/tests"          "C:/R/R-33~1.3/unins000.dat"  
    ## [17] "C:/R/R-33~1.3/unins000.exe"