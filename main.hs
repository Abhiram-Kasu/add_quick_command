import Distribution.Compat.Prelude (exitSuccess)
import GHC.Internal.System.Environment (getArgs)
import System.Directory (getHomeDirectory)
import System.FilePath ((</>))

parse_args :: [String] -> Maybe (String, String)
parse_args args =
  case args of
    [command, description] | not (null command) && not (null description) -> Just (command, description)
    _ -> Nothing

quick_command_path :: IO String
quick_command_path = do
  homePath <- getHomeDirectory
  return (homePath </> "quick_commands.txt")

main :: IO ()
main = do
  args <- getArgs
  case parse_args args of
    Just (command, description) -> do
      let final_command = command ++ " | " ++ description
      quick_command_file <- quick_command_path
      appendFile quick_command_file (final_command ++ "\n")
      exitSuccess
    Nothing -> do
      putStrLn "Usage: ./add_qc <command> <command description>"
      exitSuccess
