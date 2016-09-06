{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_firewallcode (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/BillHallahan/.cabal/bin"
libdir     = "/Users/BillHallahan/.cabal/lib/x86_64-osx-ghc-8.0.1/firewallcode-0.1.0.0-7NscJG1pdHcLtJYKfjek6i"
datadir    = "/Users/BillHallahan/.cabal/share/x86_64-osx-ghc-8.0.1/firewallcode-0.1.0.0"
libexecdir = "/Users/BillHallahan/.cabal/libexec"
sysconfdir = "/Users/BillHallahan/.cabal/etc"

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
