files = systemfunc("ls *.nc")  
f = addfiles(files,"r")
print(f)

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h3>Posicionamento das variáveis dentro do diretório e alinhando com o seu devido local.</h3>
    </body>
</html>

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>Observado.</h6>
    </body>
</html>

n_ob=1

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>BAM-NCEP.</h6>
    </body>
</html>

n_ncep_1=3
n_ncep_2=3
n_ncep_3=3

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>BAM-SMG versão 2.0.0</h6>
    </body>
</html>

n_smg_1=3
n_smg_2=3
n_smg_3=3

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>BAM-SMG versão 2.1.0</h6>
    </body>
</html>

n_smg_1=3
n_smg_2=3
n_smg_3=3

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>GFS</h6>
    </body>
</html>

n_gfs_1=3
n_gfs_2=3
n_gfs_3=3

;No caso rodar no jupyter notebook, acrescentar esses campos
<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <h6>ÁREAS</h6>
         <div>
     <table>
      <thead>
       <th>área</th>   
       <th>latitude inicial</th>
       <th>latitude final</th>
       <th>longitude inicial</th>
       <th>longitude final</th>
      </thead>
      <tbody>
       <td>South American</td>   
       <td>-36</td>
       <td>0</td>
       <td>280</td>
       <td>325</td>   
      </tbody>
      <tbody>
       <td>La Plata</td>
       <td>-36</td>
       <td>-24</td>
       <td>295</td>
       <td>315</td>
      </tbody>
      <tbody>
       <td>Southeast</td>
       <td>-24</td>
       <td>-12</td>
       <td>310</td>
       <td>325</td>
      </tbody>
      <tbody>
       <td>Central West</td>
       <td>-24</td>
       <td>-12</td>
       <td>295</td>
       <td>310</td> 
      </tbody>
      <tbody>
       <td>Northeast</td>
       <td>-12</td>
       <td>0</td>
       <td>310</td>
       <td>325</td> 
      </tbody>
      <tbody>
       <td>Amazon</td>
       <td>-12</td>
       <td>0</td>
       <td>295</td>
       <td>310</td> 
      </tbody>
     </table>
    </div>
    </body>
</html>

area =(/ "SA" ,  "La_Plata",  "southeast",   "Central_West" , "northeast" ,"Amazon" /)
lai  =(/  -36 ,  -36       ,  -24        ,  -24             , -12         ,  -12    /)
laf  =(/    0 ,  -24       ,  -12        ,  -12             , 0           ,  -0     /)
loi  =(/  280 ,  295       ,  310        ,  295             , 310         ,  295    /)
lof  =(/  325 ,  315       ,  325        ,  310             , 325         ,  310    /)

ob = new( (/6,25/), float)
path = getfilepath (f[0])
T_agg = f[0]->PREC_surface(:,:,:)
T_agg@_FillValue=-9.99e+08
i=0
k=0
    do while(i.le.5) .and. (k.le.5)    
        nni=25
        do nn=0, nni-1         
            TT=dim_avg_Wrap(dim_avg_Wrap(T_agg(:,{lai(k):laf(k)},{loi(k):lof(k)})))
            ob(i,nn)=TT(nn)
        end do  
    k=k+1
    i=i+1
end do

print(path)
print (ob)

gfs_1 = new( (/6,25/), float)
path_gfs_1 = getfilepath (f[7])
T_agg_gfs_1 = f[7]->APCP_surface(:,:,:)
T_agg_gfs_1@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_gfs_1=dim_avg_Wrap(dim_avg_Wrap(T_agg_gfs_1(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    gfs_1(i,nn)=TT_gfs_1(nn)
  end do
i=i+1
k=k+1
end do

print(path_gfs_1)
print (gfs_1)

gfs_2 = new( (/6,25/), float)
path_gfs_2 = getfilepath (f[8])
T_agg_gfs_2 = f[8]->APCP_surface(:,:,:)
T_agg_gfs_2@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_gfs_2=dim_avg_Wrap(dim_avg_Wrap(T_agg_gfs_2(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    gfs_2(i,nn)=TT_gfs_2(nn)
  end do
i=i+1
k=k+1
end do

print(path_gfs_2)
print (gfs_2)

gfs_3 = new( (/6,25/), float)
path_gfs_3 = getfilepath (f[9])
T_agg_gfs_3 = f[9]->APCP_surface(:,:,:)
T_agg_gfs_3@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_gfs_3=dim_avg_Wrap(dim_avg_Wrap(T_agg_gfs_3(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    gfs_3(i,nn)=TT_gfs_3(nn)
  end do
i=i+1
k=k+1
end do

print(path_gfs_3)
print (gfs_3)

bam_ncep_1 = new( (/6,25/), float)
path_bam_ncep_1 = getfilepath (f[1])
T_agg_bam_ncep_1 = f[1]->prec(:,:,:)
T_agg_bam_ncep_1@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_ncep_1=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_ncep_1(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_ncep_1(i,nn)=TT_bam_ncep_1(nn)
  end do
i=i+1
k=k+1
end do

print(bam_ncep_1)
print(path_bam_ncep_1)

bam_ncep_2 = new( (/6,25/), float)
path_bam_ncep_2 = getfilepath (f[1])
T_agg_bam_ncep_2 = f[1]->prec(:,:,:)
T_agg_bam_ncep_2@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_ncep_2=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_ncep_2(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_ncep_2(i,nn)=TT_bam_ncep_2(nn)
  end do
i=i+1
k=k+1
end do

print(bam_ncep_2)
print(path_bam_ncep_2)

bam_ncep_3 = new( (/6,25/), float)
path_bam_ncep_3 = getfilepath (f[3])
T_agg_bam_ncep_3 = f[3]->prec(:,:,:)
T_agg_bam_ncep_3@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_ncep_3=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_ncep_3(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_ncep_3(i,nn)=TT_bam_ncep_3(nn)
  end do
i=i+1
k=k+1
end do

print(bam_ncep_3)
print(path_bam_ncep_3)

bam_smg_1 = new( (/6,25/), float)
path_bam_smg_1 = getfilepath (f[3])
T_agg_bam_smg_1 = f[3]->prec(:,:,:)
T_agg_bam_smg_1@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_smg_1=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_smg_1(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_smg_1(i,nn)=TT_bam_smg_1(nn)
  end do
i=i+1
k=k+1
end do

print(bam_smg_1)
print(path_bam_smg_1)

bam_smg_2 = new( (/6,25/), float)
path_bam_smg_2 = getfilepath (f[n_smg_2])
T_agg_bam_smg_2 = f[n_smg_2]->prec(:,:,:)
T_agg_bam_smg_2@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_smg_2=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_smg_2(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_smg_2(i,nn)=TT_bam_smg_2(nn)
  end do
i=i+1
k=k+1
end do

print(bam_smg_2)
print(path_bam_smg_2)

bam_smg_3 = new( (/6,25/), float)
path_bam_smg_3 = getfilepath (f[n_smg_3])
T_agg_bam_smg_3 = f[n_smg_3]->prec(:,:,:)
T_agg_bam_smg_3@_FillValue=-9.99e+08
i=0  
k=0
do while(i.le.5) .and. (k.le.5)   
  nni=25
  do nn=0, nni-1
    TT_bam_smg_3=dim_avg_Wrap(dim_avg_Wrap(T_agg_bam_smg_3(:,{lai(k):laf(k)},{loi(k):lof(k)})))
    bam_smg_3(i,nn)=TT_bam_smg_3(nn)
  end do
i=i+1
k=k+1
end do

print(bam_smg_3)
print(path_bam_smg_3)
