#!/bin/bash
while read r; do 
	rm -f "$r"; 
done < ~/.caged.log
rm -f ~/.caged.log
 
