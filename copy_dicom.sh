#/bin/bash

list=('4d-lung' 'anti-pd-1_melanoma' 'apollo' 'breast-diagnosis' 'breast-mri-nact-pilot' 'cbis-ddsm' 'cc-radiomics-phantom' 'cptac-ccrcc' 'cptac-cm' 'cptac-gbm' 'cptac-hnscc' 'cptac-lscc' 'cptac-luad' 'cptac-pda' 'cptac-ucec' 'ct-colonography' 'ct-lymph-nodes' 'head-neck-cetuximab' 'head-neck-pet-ct' 'hnscc' 'hnscc-3dct-rt' 'ispy1' 'ivygap' 'lctsc' 'lgg-1p19qdeletion' 'lidc-idri' 'lung-phantom' 'lungct-diagnosis' 'mouse-astrocytoma' 'mouse-mammary' 'mri-dir' 'naf-prostate' 'nsclc-radiogenomics' 'nsclc-radiomics' 'nsclc-radiomics-genomics' 'pancreas-ct' 'phantom-fda' 'prostate-3t' 'prostate-diagnosis' 'prostate-fused-mri-pathology' 'prostate-mri' 'prostatex' 'qiba-ct-1c' 'qin-breast-dce-mri' 'qin-headneck' 'qin-lung-ct' 'qin-pet-phantom' 'rembrandt' 'rider-breast-mri' 'rider-lung-ct' 'rider-lung-pet-ct' 'rider-neuro-mri' 'rider-phantom-mri' 'rider-phantom-pet-ct' 'soft-tissue-sarcoma' 'spie-aapm-lung-ct-challenge' 'tcga-blca' 'tcga-brca' 'tcga-cesc' 'tcga-coad' 'tcga-esca' 'tcga-gbm' 'tcga-hnsc' 'tcga-kich' 'tcga-kirc' 'tcga-kirp' 'tcga-lgg' 'tcga-lihc' 'tcga-luad' 'tcga-lusc' 'tcga-ov' 'tcga-prad' 'tcga-read' 'tcga-sarc' 'tcga-stad' 'tcga-thca' 'tcga-ucec')

for store in ${list[@]}; do
	mkdir -p /tmp/tcia-${store}/dicom
	touch /tmp/tcia-${store}/dicom/abc
	gsutil cp -r /tmp/tcia-${store} gs://hcls-public-data-dicom
	gsutil -u hcls-public-data ls gs://gcs-public-data--healthcare-tcia-${store}/dicom | head -n 10 | xargs -I {} gsutil -u hcls-public-data -m cp -r {} gs://hcls-public-data-dicom/tcia-${store}/dicom
	gsutil rm -f gs://hcls-public-data-dicom/tcia-${store}/dicom/abc
done

