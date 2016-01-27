

currentDir=$(dirname "$(readlink -f "$0")")	###### Returns the directiry in which this script exist (bivec/scripts)
bivecDir="$(dirname "$currentDir")"		####### Returns the root directory of bivec

preproc=${bivecDir}/scripts/preprocess.py
dataDir=${bivecDir}/data
corpusName=${dataDir}/train.para 		####### Note: Src and Trg files should have the same name with different extensions (example: train.parallel.en    train.parallel.it)

srcL="en"
trgL="it"

srcFile=${corpusName}.prep.${srcL}
trgFile=${corpusName}.prep.${trgL}
outVec=${bivecDir}/vectors

cbow=1
size=100
win=5
negative=5
hs=0
sample=1e-4
trgSample=1e-4
threads=8
binary=1
evaluation=0
iter=5
alignOpt=0


echo "Preprocessing Corpus: SourceFile"
python ${preproc} ${corpusName}.${srcL} >${srcFile}

echo "Preprocessing Corpus: TargetFile"
python ${preproc} ${corpusName}.${trgL} >${trgFile}


echo "Running Bivec: Forward"
echo "${bivecDir}/bin/bivec -src-train ${srcFile} -src-lang ${srcL} -tgt-train ${trgFile} -tgt-lang ${trgL}  -output ${outVec}/vectors -cbow ${cbow} -size ${size} -window ${win} -negative ${negative} -hs ${hs} -sample ${sample} -tgt-sample ${trgSample} -threads ${threads} -binary ${binary} -eval ${evaluation} -iter ${iter} -align-opt ${alignOpt}"
${bivecDir}/bin/bivec -src-train ${srcFile} -src-lang ${srcL} -tgt-train ${trgFile} -tgt-lang ${trgL}  -output ${outVec}/vectors -cbow ${cbow} -size ${size} -window ${win} -negative ${negative} -hs ${hs} -sample ${sample} -tgt-sample ${trgSample} -threads ${threads} -binary ${binary} -eval ${evaluation} -iter ${iter} -align-opt ${alignOpt}


echo "Running Bivec: Backward"
${bivecDir}/bin/bivec -src-train ${trgFile} -src-lang ${trgL} -tgt-train ${srcFile} -tgt-lang ${srcL}  -output ${outVec}/vectors -cbow ${cbow} -size ${size} -window ${win} -negative ${negative} -hs ${hs} -sample ${sample} -tgt-sample ${trgSample} -threads ${threads} -binary ${binary} -eval ${evaluation} -iter ${iter} -align-opt ${alignOpt}
