{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Pascal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\Pascal-0.1.0.0-8BsyPrpW4WU5LOoJRt1OQn"
dynlibdir  = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\Pascal-0.1.0.0"
libexecdir = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\Pascal-0.1.0.0-8BsyPrpW4WU5LOoJRt1OQn\\x86_64-windows-ghc-8.6.5\\Pascal-0.1.0.0"
sysconfdir = "C:\\Users\\dhruv\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Pascal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Pascal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Pascal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Pascal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Pascal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Pascal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
