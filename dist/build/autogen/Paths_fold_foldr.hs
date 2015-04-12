module Paths_fold_foldr (
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
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/anastasia/Haskell/fold-foldr/.cabal-sandbox/bin"
libdir     = "/home/anastasia/Haskell/fold-foldr/.cabal-sandbox/lib/x86_64-linux-ghc-7.8.3/fold-foldr-0.1.0.0"
datadir    = "/home/anastasia/Haskell/fold-foldr/.cabal-sandbox/share/x86_64-linux-ghc-7.8.3/fold-foldr-0.1.0.0"
libexecdir = "/home/anastasia/Haskell/fold-foldr/.cabal-sandbox/libexec"
sysconfdir = "/home/anastasia/Haskell/fold-foldr/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fold_foldr_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fold_foldr_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "fold_foldr_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fold_foldr_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fold_foldr_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
