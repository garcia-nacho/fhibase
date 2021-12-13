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
To build the image run: 

<code>git clone https://github.com/garcia-nacho/fhibase</code>    
<code> cd fhibase </code>    
<code> docker build -t garcianacho/fhibase .</code>    

Alternativery you can download it from dockerhub   

<code>docker pull garcianacho/fhibase</code>    

You can use the image as a standalone image:

<code>docker run -it --rm garcianacho/fhibase bash</code>      
or include it in your Dockerfile    
<code>FROM garcianacho/fhibase</code>

### Note that this image is based on [rocker's Dockerfile for r-base](https://github.com/rocker-org/rocker/blob/df1414259dceb0282f163f29f4dccfa184d38d86/r-base/4.1.2/Dockerfile)

