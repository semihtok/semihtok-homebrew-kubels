# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubels < Formula
  desc "kubels (kube ls) is a Kubernetes tool that allows you to list Kubernetes resources with a simple command(s)."
  homepage "https://github.com/semihtok/kubels"
  version "0.2.0"
  license "Apache 2.0"

  depends_on "git"
  depends_on "go"

  on_macos do
    url "https://github.com/semihtok/kubels/releases/download/v0.2.0/kubels_0.2.0_darwin_amd64.tar.gz"
    sha256 "46fa2a2007c3d684230d476811365de02155f86ae0734d39c6fd6e2c9bfbda83"

    def install
      bin.install "kubels"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Kubels
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/semihtok/kubels/releases/download/v0.2.0/kubels_0.2.0_linux_armv6.tar.gz"
      sha256 "86a3b704d631d6ed985bcd21abadf57f7971a461f73fa6ba1e19ba0023a885cf"

      def install
        bin.install "kubels"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/semihtok/kubels/releases/download/v0.2.0/kubels_0.2.0_linux_amd64.tar.gz"
      sha256 "3062907eecfab773707e225b2aec9dce79f972957d56ce1437bbfb5ae12b49c0"

      def install
        bin.install "kubels"
      end
    end
  end
end
