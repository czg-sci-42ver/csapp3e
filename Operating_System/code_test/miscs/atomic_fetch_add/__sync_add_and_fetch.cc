int main()
{
  int i = 3;
  int j = __sync_add_and_fetch(&i, 1);
  return 0;
}
