import std.stdio;
import core.stdc.stdlib;

enum int MINREQ = 0xFFF;

void main()
{
  uint required = int(-1);
  void *mem = null;
  while (mem == null)
  {
    writefln("Required %X\n", required);
    mem = malloc(required);
    if ((required >>= 1) < MINREQ)
    {
      if (mem)
        free(mem);
      writeln("Connot allocate enough memory\n");
    }
  }

  free(mem);
  mem = malloc(required);
  if (mem == null)
  {
    writeln("Connot allocate enough memory\n");
  }

  writefln("Memory size allocated = %X\n", required);
  free(mem);
}
