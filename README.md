# Descrition:   
[FHI's](https://www.fhi.no/) base image for pipeline building.   

# Base distribution:
Debian Bullseye   

# Software included:
R 4.1.1 (r-base, r-core. r-dev)   
nodejs   
npm   
rsync   
git   
libssl   
gcc/ccp (v9 and V10)    

# Usage
You can use this image as a standalone image   

<code>git clone https://github.com/garcia-nacho/fhibase</code>
<code> cd fhibase </code>
<code> docker build -t garcianacho/fhibase .</code>   

Alternativery you can download it from dockerhub   

<code>docker pull garcianacho/fhibase</code>   

**docker run -it --rm garcianacho/fhibase bash**   
or include it in your Dockerfile    
**FROM garcianacho/fhibase**

### Note that this image is based on [rocker's Dockerfile for r-base](https://github.com/rocker-org/rocker/blob/df1414259dceb0282f163f29f4dccfa184d38d86/r-base/4.1.2/Dockerfile)

