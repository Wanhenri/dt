files = systemfunc("ls *.nc")  
f = addfiles(files,"r")

;print(files)
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
