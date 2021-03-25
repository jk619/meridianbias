[ -f prfresultsmgz.zip ] || curl -L --output "prfresultsmgz.zip"  https://osf.io/tqprz/download
[ -d prfresultsmgz ] || unzip prfresultsmgz.zip
[ -f prfresultsmgz.zip ] || rm prfresultsmgz.zip

[ -d benson_atlas ] || mkdir benson_atlas


curl -o "./benson_atlas/lh.varea.mgz" -LJO https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/lh.benson14_varea.v4_0.mgz
curl -o "./benson_atlas/rh.varea.mgz" -LJO https://github.com/noahbenson/neuropythy/raw/master/neuropythy/lib/data/fsaverage/surf/rh.benson14_varea.v4_0.mgz

[ -d vistasoft ] || git clone https://github.com/vistalab/vistasoft.git

