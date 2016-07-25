#' can also try to make one main repo that connects to multiple computers and syncs
#' either make into a package or make a link to the script that imports on default
#' cross-check package Navailability with available.packages()
#' add option to compare package versions
#ap<-available.packages()
#"simcf" %in% rownames(ap)

saveInstalledPackages=function(){
  #' saves installed packages into a .csv file 
  #' the prefix of this file is the system platform 
  #' (e.g., x86_64-apple-darwin13.4.0_installedPackages.csv)
  #' can be used with copyInstalledPackages to copy package libraries across systems
  R.version=sessionInfo()["R.version"]
  platform = R.version$R.version$platform
  packageList<-installed.packages()[,"Package"]
  write.table(packageList,file=paste(platform, "_installedPackages.csv",sep=""),
              row.names=FALSE, col.names = FALSE)
  sprintf("saved %s", paste(platform, "_installedPackages.csv", sep=""))
}

copyInstalledPackages=function(installedPackagesFile){
  #' @param installedPackagesFile A .csv file 
  #' (e.g., x86_64-apple-darwin13.4.0_installedPackages.csv)
  #' a one column .csv file listing installed packages from a R library on another computer
  currentPackages<- installed.packages()[,"Package"]
  packageListFile<-read.table(installedPackagesFile)
  colnames(packageListFile)<-c("packages")
  packagesToInstall<-as.character(packageListFile$packages)
  newPackages <- setdiff(packagesToInstall,currentPackages)
  if(length(newPackages)) install.packages(newPackages)
  sprintf("installed the following %i package(s): %s", 
        length(newPackages), paste(newPackages, collapse=', ' ))
}
