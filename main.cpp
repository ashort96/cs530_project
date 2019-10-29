#include <stdio.h>
#include <string.h>

#include <benchmark/benchmark.h>


static void BM_StringCreation(benchmark::State& state)
{
    for (auto _ : state)
        std::string empty_string;
}

static void BM_StringCopy(benchmark::State& state) {
  std::string x = "hello";
  for (auto _ : state)
    std::string copy(x);
}



static void BM_memcpy(benchmark::State& state) {
  char* src = new char[state.range(0)];
  char* dst = new char[state.range(0)];
  memset(src, 'x', state.range(0));
  for (auto _ : state)
    memcpy(dst, src, state.range(0));
  state.SetBytesProcessed(int64_t(state.iterations()) *
                          int64_t(state.range(0)));
  delete[] src;
  delete[] dst;
}

static void BM_StringCompare(benchmark::State& state) {
  std::string s1(state.range(0), '-');
  std::string s2(state.range(0), '-');
  for (auto _ : state) {
    benchmark::DoNotOptimize(s1.compare(s2));
  }
  state.SetComplexityN(state.range(0));
}


BENCHMARK(BM_StringCreation);
BENCHMARK(BM_StringCopy);
BENCHMARK(BM_memcpy)->RangeMultiplier(2)->Range(8, 8<<10);
BENCHMARK(BM_StringCompare)
    ->RangeMultiplier(2)->Range(1<<10, 1<<18)->Complexity();

BENCHMARK_MAIN();
