# Kubernetes Service Study

This study unit covers the Kubernetes Service concept in the following order:

1. Service concept
2. ClusterIP
3. selector
4. port
5. targetPort
6. Endpoints and EndpointSlice
7. Service Lab 01
8. Git documentation after the lab

# Directory Structure


service-study/
├── README.md
├── concept/
│   └── kubernetes-service-concept.odt
├── examples/
│   ├── deployment.yaml
│   └── clusterip-service.yaml
├── commands/
│   └── service-checks.md
└── labs/
    └── service-lab-01/
        ├── README.md
        ├── manifests/
        │   ├── namespace.yaml
        │   ├── deployment.yaml
        │   └── service.yaml
        └── notes/
            ├── investigation.md
            └── solution-and-verification.md


# Study Method

1. Read the concept document.
2. Review the working example.
3. Practice the inspection commands.
4. Apply the broken lab manifests.
5. Investigate before editing files.
6. Fix the logical configuration errors.
7. Verify traffic through the Service.
8. Document the work with Git after completing the lab.

The lab starts in a valid but broken state. It does not include the solution.
