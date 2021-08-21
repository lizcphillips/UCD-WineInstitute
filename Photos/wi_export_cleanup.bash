#!/bin/bash
#post-OpenRefine cleanups for Wine Institute photo groupings
path=/mnt/c/Users/ecphillips/staging
for file in $path/*.txt
do
    cp $file $file.bak
    cat $file | sed 's|<origination label="Photographer"><persname role="pht" rules="rda" source="local">null</persname></origination>||g' | sed 's|<p>Also labeled null</p>||g' | sed 's|<scopecontent><p>null</p></scopecontent>||g' | sed 's|>"|>|g' | sed 's|"<|<|g' | sed 's|\\"|"|g' | sed 's|<odd><head>Caption</head><p>null</p></odd>||g' | sed 's|""|"|g' > $file.2
    mv $file.2 $file
done
diff -b $path/*.bak $path/*.txt | less
