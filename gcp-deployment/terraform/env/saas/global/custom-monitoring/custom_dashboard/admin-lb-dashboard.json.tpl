{
    "displayName": "Admin LoadBalancer Logging Monitoring Dashboard",
    "mosaicLayout": {
      "columns": 12,
      "tiles": [
        {
          "height": 1,
          "widget": {
            "text": {
              "format": "RAW"
            },
            "title": "Admin LoadBalancer Dashboard for HOST_PROJECT_ID"
          },
          "width": 12
        },
        {
          "height": 4,
          "widget": {
            "title": "Google Cloud HTTP/S Load Balancing Rule - Request count (filtered) for HOST_PROJECT_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 1
        },
        {
          "height": 4,
          "widget": {
            "title": "Total latency for HOST_PROJECT_ID [50TH PERCENTILE]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_PERCENTILE_50"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/total_latencies\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 1
        },
        {
          "height": 4,
          "widget": {
            "title": "Backend Request Count for HOST_PROJECT_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_request_count\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 5
        },
        {
          "height": 4,
          "widget": {
            "title": "Backend latency for HOST_PROJECT_ID [50TH PERCENTILE]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_PERCENTILE_50"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_latencies\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 5
        },
        {
          "height": 4,
          "widget": {
            "title": "Google Cloud HTTP/S Load Balancing Rule - Frontend RTT (filtered) for HOST_PROJECT_ID [50TH PERCENTILE]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_PERCENTILE_50"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/frontend_tcp_rtt\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 9
        },
        {
          "height": 4,
          "widget": {
            "title": "Google Cloud HTTP/S Load Balancing Rule - Request bytes (filtered) for HOST_PROJECT_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "STACKED_AREA",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_bytes_count\" resource.type=\"https_lb_rule\" resource.label.\"project_id\"=\"HOST_PROJECT_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 9
        },
        {
          "height": 4,
          "widget": {
            "logsPanel": {
              "filter": "resource.type=\"http_load_balancer\"",
              "resourceNames": [
                "projects/HOST_PROJECT_NUMBER"
              ]
            },
            "title": "LoadBalancer Logs for for HOST_PROJECT_ID"
          },
          "width": 12,
          "yPos": 13
        }
      ]
    }
  }