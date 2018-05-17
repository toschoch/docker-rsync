#!/bin/bash

inotifywait -mr --format '%w %e %f' \
-e close_write -e move \
/data \
| while read dir event file; do

       FILECHANGE=${dir}${file}

       if [[ ${file} =~ ^[\.]{1,1}.*$ ]] ; then
            :
       else
            if [[ ${file} =~ ${POSTREGEX:-^.*.json$} ]] ; then
                echo "post ${FILECHANGE}..."
                exec post -host ${SOLR_HOST} -c ${SOLR_CORE} ${FILECHANGE} &
            fi
       fi

done