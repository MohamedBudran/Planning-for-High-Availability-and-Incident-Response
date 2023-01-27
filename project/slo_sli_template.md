# API Service

| **Category** |                                         **SLI**                                         | **SLO**                                                                                                     |
|:------------:|:---------------------------------------------------------------------------------------:|-------------------------------------------------------------------------------------------------------------|
| Availability |              Total number of successful requests / total number of requests             | 99%                                                                                                         |
|    Latency   | Buckets of requests in a histogram showing the 90th percentile over the last 30 seconds | 90% of requests below 100ms                                                                                 |
| Error Budget |  Proportion of the all failed requests against the proportion all failed requests used  | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
|  Throughput  |                    Total number of successful requests over 5 minutes                   | 5 RPS indicates the application is functioning                                                              |