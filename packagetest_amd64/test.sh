## PROGRAMS FOR TESTING:

# PYTHON PACKAGES
#echo ""; echo "Checking for Python packages..."; echo ""
#for package in "PySide6" "Bio" "scipy" "seaborn" "tabulate" "matplotlib" "dendropy"
#do
#    test=$(cat <<EOF
#try: import ${package}; print("${package} installed")
#except: print("${package} not found")
#EOF
#    )
#    python -c "$test"
#done

# R PACKAGES
echo ""; echo "Testing for R packages..."; echo ""
UE="UE"; SE="SE"
for package in "mcmcse" "rase" "treebalance" "rlist" "poweRbal" "treestats"
do
    output=`echo $(R -e "\"${package}\" %in% rownames(installed.packages())") | tail -c 7 | head -c 2`
    if [ "$output" = "$UE" ]; then echo "$package installed"; else echo "$package not found"; fi
done
echo ""; echo "Full List:"; echo ""
echo $(R -e "cat(rownames(installed.packages()))") | cut -d ">" -f2- | cut -c 38- | rev | cut -c 4- | rev

# JULIA PACKAGES
echo ""; echo "Testing for Julia packages..."; echo ""
#for package in "StatsBase" "Combinatorics" "PProf" "Distributions" "Phylo" "Optim" "RCall" "Tapestree" "Parameters" "StaticArrays" "BenchmarkTools" "SIMD" "Setfield" "KernelDensity" "PDMats" "SpecialFunctions" "ExponentialUtilities"
#do
#    julia -e "try import ${package} catch; println(\"${package} not found\") else println(\"${package} installed\") end"
#done