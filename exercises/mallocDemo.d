import core.stdc.stdlib;
import core.stdc.string;
import std.string;
import std.stdio;
import std.traits;

const int MAX_WORD_LENGTH = 30;

void main()
{
  string wordString;

  writefln("Digite uma palavra (<%d caracteres): ", MAX_WORD_LENGTH);
  readf("%s", wordString);

  const uint bufferSize = uint((string.sizeof) * (wordString.length + 1));

  auto word = malloc(bufferSize);
  if (word is null)
  {
    import core.exception : onOutOfMemoryError;

    onOutOfMemoryError();
  }

  writefln("You entered: %s\n", word);

  free(word);
}
