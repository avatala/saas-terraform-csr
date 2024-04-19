{
    "displayName": "Freemium GKE Logging Monitoring Dashboard",
    "mosaicLayout": {
      "columns": 12,
      "tiles": [
        {
          "height": 1,
          "widget": {
            "text": {
              "format": "RAW"
            },
            "title": "Freemium-project Freemium_Project_ID"
          },
          "width": 11
        },
        {
          "height": 4,
          "widget": {
            "logsPanel": {
              "filter": "resource.type=\"k8s_pod\"",
              "resourceNames": [
                "projects/Freemium_Project_Number"
              ]
            },
            "title": "GKE Pods Logs Panel for Freemium_Project_ID"
          },
          "width": 6,
          "yPos": 1
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Container - CPU request utilization for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/cpu/request_utilization\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
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
            "title": "Kubernetes Container - CPU limit utilization for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/cpu/limit_utilization\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
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
            "title": "Kubernetes Container - CPU usage time for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/cpu/core_usage_time\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
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
                "label": "y1Axis",
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
            "title": "Kubernetes Container - Memory request utilization (filtered) [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/memory/request_utilization\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
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
            "title": "Kubernetes Container - Memory limit utilization for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/memory/limit_utilization\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
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
            "title": "Kubernetes Container - Memory usage for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/memory/used_bytes\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 13
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Container - Uptime for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/uptime\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 13
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Pod - Volume utilization for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/pod/volume/utilization\" resource.type=\"k8s_pod\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 17
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Pod - Volume capacity for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/pod/volume/total_bytes\" resource.type=\"k8s_pod\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 17
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Pod - Bytes received for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"kubernetes.io/pod/network/received_bytes_count\" resource.type=\"k8s_pod\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
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
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 21
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Pod - Bytes transmitted for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"kubernetes.io/pod/network/sent_bytes_count\" resource.type=\"k8s_pod\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
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
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 21
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Container - Ephemeral storage usage for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_MEAN"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/ephemeral_storage/used_bytes\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
                      "secondaryAggregation": {
                        "alignmentPeriod": "60s"
                      }
                    }
                  }
                }
              ],
              "timeshiftDuration": "0s",
              "yAxis": {
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "yPos": 25
        },
        {
          "height": 4,
          "widget": {
            "title": "Kubernetes Container - Page faults for Freemium_Project_ID [MEAN]",
            "xyChart": {
              "chartOptions": {
                "mode": "COLOR"
              },
              "dataSets": [
                {
                  "minAlignmentPeriod": "60s",
                  "plotType": "LINE",
                  "targetAxis": "Y1",
                  "timeSeriesQuery": {
                    "timeSeriesFilter": {
                      "aggregation": {
                        "alignmentPeriod": "60s",
                        "perSeriesAligner": "ALIGN_RATE"
                      },
                      "filter": "metric.type=\"kubernetes.io/container/memory/page_fault_count\" resource.type=\"k8s_container\" resource.label.\"project_id\"=\"Freemium_Project_ID\"",
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
                "label": "y1Axis",
                "scale": "LINEAR"
              }
            }
          },
          "width": 6,
          "xPos": 6,
          "yPos": 25
        }
      ]
    }
}  