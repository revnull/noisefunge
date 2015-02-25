{-
    This source file is a part of the noisefunge programming environment.

    Copyright (C) 2015 Rev. Johnny Healey <rev.null@gmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

import Language.NoiseFunge.API
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    case args of
        [fname,inbuf,outbuf] -> do
            prog <- readFile fname
            withAPIConnection $ \conn -> do
                pid <- addProgram conn fname inbuf outbuf (lines prog)
                print pid
        _ -> error "Usage: nfloader FILENAME INBUF OUTBUF"
