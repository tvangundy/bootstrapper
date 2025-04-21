# bootstrapper
POC repository for the windsor bootstrapper
# S3 Approach

# GITHUB Approach
```
[Container] 2025/04/21 14:15:43.170402 Running on CodeBuild On-demand
[Container] 2025/04/21 14:15:43.170414 Waiting for agent ping
[Container] 2025/04/21 14:15:43.748674 Waiting for DOWNLOAD_SOURCE
[Container] 2025/04/21 14:15:46.624690 Phase is DOWNLOAD_SOURCE
[Container] 2025/04/21 14:15:46.626569 CODEBUILD_SRC_DIR=/codebuild/output/src33526744/src/github.com/tvangundy/bootstrapper
[Container] 2025/04/21 14:15:46.627219 YAML location is /codebuild/output/src33526744/src/github.com/tvangundy/bootstrapper/cloudformation/buildspec.yml
[Container] 2025/04/21 14:15:46.665897 Setting HTTP client timeout to higher timeout for Github and GitHub Enterprise sources
[Container] 2025/04/21 14:15:46.695229 Processing environment variables
[Container] 2025/04/21 14:15:46.700120 Setting HTTP client timeout to higher timeout for Github and GitHub Enterprise sources
[Container] 2025/04/21 14:15:47.198168 No runtime version selected in buildspec.
[Container] 2025/04/21 14:15:47.224297 Moving to directory /codebuild/output/src33526744/src/github.com/tvangundy/bootstrapper
[Container] 2025/04/21 14:15:47.224325 Cache is not defined in the buildspec
[Container] 2025/04/21 14:15:47.372265 Skip cache due to: no paths specified to be cached
[Container] 2025/04/21 14:15:47.372654 Registering with agent
[Container] 2025/04/21 14:15:47.523905 Phases found in YAML: 3
[Container] 2025/04/21 14:15:47.523927  PRE_BUILD: 3 commands
[Container] 2025/04/21 14:15:47.523932  BUILD: 3 commands
[Container] 2025/04/21 14:15:47.523936  INSTALL: 12 commands
[Container] 2025/04/21 14:15:47.524510 Phase complete: DOWNLOAD_SOURCE State: SUCCEEDED
[Container] 2025/04/21 14:15:47.524526 Phase context status code:  Message: 
[Container] 2025/04/21 14:15:47.699172 Entering phase INSTALL
[Container] 2025/04/21 14:15:47.839945 Running command export HOME=$(pwd)

[Container] 2025/04/21 14:15:47.847662 Running command export DOCKER_HOST=unix:///var/run/docker.sock

[Container] 2025/04/21 14:15:47.853732 Running command export WINDSOR_PROJECT_ROOT=$(pwd)

[Container] 2025/04/21 14:15:47.859977 Running command curl -L -o windsor_${WINDSOR_VERSION}_${OS}_${ARCH}.tar.gz https://github.com/windsorcli/cli/releases/download/v${WINDSOR_VERSION}/windsor_${WINDSOR_VERSION}_${OS}_${ARCH}.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0

100 40.7M  100 40.7M    0     0  99.8M      0 --:--:-- --:--:-- --:--:-- 99.8M

[Container] 2025/04/21 14:15:48.356953 Running command sudo tar -xzf windsor_${WINDSOR_VERSION}_${OS}_${ARCH}.tar.gz -C /usr/local/bin

[Container] 2025/04/21 14:15:49.749356 Running command sudo chmod +x /usr/local/bin/windsor

[Container] 2025/04/21 14:15:49.813405 Running command curl -L -o aqua_${OS}_${ARCH}.tar.gz https://github.com/aquaproj/aqua/releases/download/v${AQUA_VERSION}/aqua_${OS}_${ARCH}.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0

100 7781k  100 7781k    0     0  23.1M      0 --:--:-- --:--:-- --:--:-- 23.1M

[Container] 2025/04/21 14:15:50.160388 Running command mkdir -p aqua

[Container] 2025/04/21 14:15:50.170349 Running command tar -xzf aqua_${OS}_${ARCH}.tar.gz -C aqua

[Container] 2025/04/21 14:15:50.330398 Running command export PATH=$(pwd)/aqua:$PATH

[Container] 2025/04/21 14:15:50.338826 Running command aqua install
time="2025-04-21T14:15:50Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=aqua-proxy package_version=v1.2.8 program=aqua registry=
time="2025-04-21T14:15:51Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 env=linux/amd64 package_name=aqua-proxy package_version=v1.2.8 program=aqua registry=
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=terraform env=linux/amd64 package_name=hashicorp/terraform package_version=v1.11.4 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=talosctl env=linux/amd64 package_name=siderolabs/talos package_version=v1.9.5 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=omnictl env=linux/amd64 package_name=siderolabs/omni/omnictl package_version=v0.48.0 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=omni env=linux/amd64 package_name=siderolabs/omni/omni package_version=v0.48.0 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=kubectl env=linux/amd64 package_name=kubernetes/kubectl package_version=v1.32.3 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=task env=linux/amd64 package_name=go-task/task package_version=v3.42.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=go env=linux/amd64 package_name=golang/go package_version=go1.24.2 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=gofmt env=linux/amd64 package_name=golang/go package_version=go1.24.2 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=colima env=linux/amd64 package_name=abiosoft/colima package_version=v0.8.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=lima env=linux/amd64 package_name=lima-vm/lima package_version=v1.0.7 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=limactl env=linux/amd64 package_name=lima-vm/lima package_version=v1.0.7 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=containerd env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=containerd-shim-runc-v2 env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=ctr env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=docker env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=docker-init env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=docker-proxy env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=dockerd env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=runc env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=docker-cli-plugin-docker-compose env=linux/amd64 package_name=docker/compose package_version=v2.34.0 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=aws env=linux/amd64 package_name=aws/aws-cli package_version=2.26.0 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=aws_completer env=linux/amd64 package_name=aws/aws-cli package_version=2.26.0 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=helm env=linux/amd64 package_name=helm/helm package_version=v3.17.3 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=flux env=linux/amd64 package_name=fluxcd/flux2 package_version=v2.5.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=vault env=linux/amd64 package_name=hashicorp/vault package_version=v1.19.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=k9s env=linux/amd64 package_name=derailed/k9s package_version=v0.50.2 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=sops env=linux/amd64 package_name=getsops/sops package_version=v3.10.1 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="create a symbolic link" aqua_version=2.49.0-0 command=op env=linux/amd64 package_name=1password/cli package_version=v2.30.3 program=aqua
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=kubernetes/kubectl package_version=v1.32.3 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=hashicorp/terraform package_version=v1.11.4 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=siderolabs/talos package_version=v1.9.5 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=siderolabs/omni/omni package_version=v0.48.0 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=siderolabs/omni/omnictl package_version=v0.48.0 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=go-task/task package_version=v3.42.1 program=aqua registry=standard
time="2025-04-21T14:15:52Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=golang/go package_version=go1.24.2 program=aqua registry=standard
time="2025-04-21T14:15:53Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=abiosoft/colima package_version=v0.8.1 program=aqua registry=standard
time="2025-04-21T14:15:53Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=lima-vm/lima package_version=v1.0.7 program=aqua registry=standard
time="2025-04-21T14:15:54Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=docker/cli package_version=v27.4.1 program=aqua registry=standard
time="2025-04-21T14:15:55Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=docker/compose package_version=v2.34.0 program=aqua registry=standard
time="2025-04-21T14:15:55Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=aws/aws-cli package_version=2.26.0 program=aqua registry=standard
time="2025-04-21T14:15:57Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=helm/helm package_version=v3.17.3 program=aqua registry=standard
time="2025-04-21T14:15:59Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=fluxcd/flux2 package_version=v2.5.1 program=aqua registry=standard
time="2025-04-21T14:15:59Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=hashicorp/vault package_version=v1.19.1 program=aqua registry=standard
time="2025-04-21T14:15:59Z" level=info msg="verify a package with slsa-verifier" aqua_version=2.49.0-0 env=linux/amd64 package_name=fluxcd/flux2 package_version=v2.5.1 program=aqua registry=standard
time="2025-04-21T14:15:59Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=slsa-framework/slsa-verifier package_version=v2.7.0 program=aqua registry=
time="2025-04-21T14:15:59Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=derailed/k9s package_version=v0.50.2 program=aqua registry=standard
time="2025-04-21T14:16:01Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=getsops/sops package_version=v3.10.1 program=aqua registry=standard
Verified signature against tlog entry index 174190529 at URL: https://rekor.sigstore.dev/api/v1/log/entries/108e9186e8c5677a76c087dfaee382d13f92ee507dc41496950c17ee7631df3573af4c3a01e017c2
Verified build using builder "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_generic_slsa3.yml@refs/tags/v2.0.0" at commit 8d5f40dca5aa5d3c0fc3414457dda15a0ac92fa4
Verifying artifact /tmp/438166102: PASSED

PASSED: SLSA verification passed
time="2025-04-21T14:16:02Z" level=info msg="verify a package with slsa-verifier" aqua_version=2.49.0-0 env=linux/amd64 package_name=getsops/sops package_version=v3.10.1 program=aqua registry=standard
time="2025-04-21T14:16:02Z" level=info msg="download and unarchive the package" aqua_version=2.49.0-0 env=linux/amd64 package_name=1password/cli package_version=v2.30.3 program=aqua registry=standard
Verified build using builder "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_generic_slsa3.yml@refs/tags/v2.1.0" at commit acc47adaa001f997b479515f0992c3b95e7b3a72
Verifying artifact /tmp/859869761: PASSED

PASSED: SLSA verification passed

[Container] 2025/04/21 14:16:07.209120 Running command export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH

[Container] 2025/04/21 14:16:07.564550 Phase complete: INSTALL State: SUCCEEDED
[Container] 2025/04/21 14:16:07.564573 Phase context status code:  Message: 
[Container] 2025/04/21 14:16:07.668345 Entering phase PRE_BUILD
[Container] 2025/04/21 14:16:07.670315 Running command windsor version
Version: 0.5.6
Commit SHA: c2a3ce962991976cb41a4a1e5e8d8493646bc20e
Platform: linux/amd64

[Container] 2025/04/21 14:16:08.159794 Running command terraform version
Terraform v1.11.4
on linux_amd64

[Container] 2025/04/21 14:16:09.147750 Running command windsor init aws
Initialization successful

[Container] 2025/04/21 14:16:09.207413 Phase complete: PRE_BUILD State: SUCCEEDED
[Container] 2025/04/21 14:16:09.207440 Phase context status code:  Message: 
[Container] 2025/04/21 14:16:09.243217 Entering phase BUILD
[Container] 2025/04/21 14:16:09.244204 Running command echo "Executing windsor action ${ACTION}"
Executing windsor action up

[Container] 2025/04/21 14:16:09.250372 Running command if [ "${ACTION}" = "down" ]; then
  windsor down
  aws s3 rb s3://windsor-bootstrapper-test-bucket --force
else
  windsor up
fi

✔ 🛠️ Checking tool versions - Done
✔ 🌎 Initializing Terraform in s3 - Done
✔ 🌎 Planning Terraform changes in s3 - Done
✔ 🌎 Applying Terraform changes in s3 - Done
Windsor environment set up successfully.

[Container] 2025/04/21 14:16:33.119410 Running command aws s3 ls
2025-04-16 12:47:47 codepipelinestartertempla-codepipelineartifactsbuc-bmwas1s2d0zz
2025-04-21 14:16:33 windsor-bootstrapper-test-bucket

[Container] 2025/04/21 14:16:38.184727 Phase complete: BUILD State: SUCCEEDED
[Container] 2025/04/21 14:16:38.184771 Phase context status code:  Message: 
[Container] 2025/04/21 14:16:38.230559 Entering phase POST_BUILD
[Container] 2025/04/21 14:16:38.332483 Phase complete: POST_BUILD State: SUCCEEDED
[Container] 2025/04/21 14:16:38.332510 Phase context status code:  Message: 
[Container] 2025/04/21 14:16:38.495033 Set report auto-discover timeout to 5 seconds
[Container] 2025/04/21 14:16:38.539411 Expanding base directory path:  .
[Container] 2025/04/21 14:16:38.541555 Assembling file list
[Container] 2025/04/21 14:16:38.541625 Expanding .
[Container] 2025/04/21 14:16:38.581484 Expanding file paths for base directory .
[Container] 2025/04/21 14:16:38.581502 Assembling file list
[Container] 2025/04/21 14:16:38.581506 Expanding **/*
[Container] 2025/04/21 14:16:38.814314 No matching auto-discover report paths found
[Container] 2025/04/21 14:16:38.814400 Report auto-discover file discovery took 0.319366 seconds
[Container] 2025/04/21 14:16:38.814434 Phase complete: UPLOAD_ARTIFACTS State: SUCCEEDED
[Container] 2025/04/21 14:16:38.814441 Phase context status code:  Message: 
```
