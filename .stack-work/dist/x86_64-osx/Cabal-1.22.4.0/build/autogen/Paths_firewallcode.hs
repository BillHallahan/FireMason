module Paths_firewallcode (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/BillHallahan/Documents/Research/Firewalls/firewallcode/.stack-work/install/x86_64-osx/ghc-7.10.2/7.10.2/bin"
libdir     = "/Users/BillHallahan/Documents/Research/Firewalls/firewallcode/.stack-work/install/x86_64-osx/ghc-7.10.2/7.10.2/lib/x86_64-osx-ghc-7.10.2/firewallcode-0.1.0.0-Iww6h8udxHzE26UToDd5NE"
datadir    = "/Users/BillHallahan/Documents/Research/Firewalls/firewallcode/.stack-work/install/x86_64-osx/ghc-7.10.2/7.10.2/share/x86_64-osx-ghc-7.10.2/firewallcode-0.1.0.0"
libexecdir = "/Users/BillHallahan/Documents/Research/Firewalls/firewallcode/.stack-work/install/x86_64-osx/ghc-7.10.2/7.10.2/libexec"
sysconfdir = "/Users/BillHallahan/Documents/Research/Firewalls/firewallcode/.stack-work/install/x86_64-osx/ghc-7.10.2/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "firewallcode_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "firewallcode_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "firewallcode_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "firewallcode_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "firewallcode_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)