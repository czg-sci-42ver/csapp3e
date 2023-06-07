Recently I want to use new `amd_pstate` to increase cpu performance by something like overclocking or more *customization* shown [here][1], I followed this [wiki][2] with update of `grub` and `mkinitcpio` based on my module.

```bash
$ ls /usr/lib/modules/$(uname -r)/kernel/drivers/cpufreq/
acpi-cpufreq.ko.zst  amd_freq_sensitivity.ko.zst  amd-pstate-ut.ko.zst  p4-clockmod.ko.zst  pcc-cpufreq.ko.zst  powernow-k8.ko.zst  speedstep-lib.ko.zst

$ sudo cat  /etc/mkinitcpio.conf
# https://forum.manjaro.org/t/testing-update-2022-06-03-linux-5-18-systemd-251-gnome-42-2-nvidia-mesa-pulseaudio-perl/112820/20
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm amd_pstate_ut amd_freq_sensitivity)
...
HOOKS=(base udev autodetect keyboard keymap consolefont modconf block filesystems fsck)
...
$ sudo cat  /etc/default/grub | grep -v \#
...
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet reboot=acpi nowatchdog nmi_watchdog=0 nvidia_drm.modeset=1 drm.debug=0x1ff nvidia.NVreg_RegistryDwords=EnableBrightnessControl=1 processor.ignore_ppc=1 processor.ignore_tpc=1 amd_pstate=active amd_pstate.shared_mem=1 amd_pstate.enable=1 initcall_blacklist=acpi_cpufreq_init "
```

However in `journalctl` has errors
```bash
Jun 07 11:25:08 CzgArch kernel: amd_pstate: the _CPC object is not present in SBIOS or ACPI disabled
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: amd_pstate_ut_acpi_cpc_valid the _CPC object is not present in SBIOS!
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: 1    amd_pstate_ut_acpi_cpc_valid         fail!
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: amd_pstate_ut_pstate_enable amd pstate must be enabled!
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: 2    amd_pstate_ut_check_enabled         fail!
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: 3    amd_pstate_ut_check_perf         success!
Jun 07 11:25:08 CzgArch kernel: amd_pstate_ut: 4    amd_pstate_ut_check_freq         success!
```

And in above wiki, I found this
> Change Enable *CPPC* from Auto to Enabled, or any similar settings in your UEFI. If they are not present, consult the *vendor website* for an update.

I use grub based on efi, and I checked my [vendor web][3] for bios update, but not newer since my current version:
```bash
$ ls /boot/efi 
 EFI  'System Volume Information'
$ sudo dmidecode -t bios -q
BIOS Information
        Vendor: LENOVO
        Version: EUCN39WW
...
                UEFI is supported
```
---
#### check support
Also, after reading kernel [doc][4], I checked whether my cpu and kernel may support `amd_pstate`. based on this forum [Q&A][5], I know the current *kernel* support `amd_pstate`.  (the `CONFIG_X86_AMD_PSTATE_UT=m` is same as what the kernel doc want.)
```bash
$ zcat /proc/config.gz | grep PSTATE
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_AMD_PSTATE=y
CONFIG_X86_AMD_PSTATE_UT=m
```

I also [check][6] *cpu* support
```bash
$ lscpu | grep -e 'cppc\|msr' 
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip rdpid overflow_recov succor smca
```
---
#### try update firmware
After viewing this [post][7], maybe [changing firmware][8] in linux directly instead of using BIOS to communicate with the hardware is one solution. However I found no updates.
```bash
$ fwupdmgr get-updates
Firmware metadata has not been updated for 30 days and may not be up to date.
Update now? (Requires internet connection) [y|N]: y
Updating lvfs
Downloading…             [*********************************      ] Less than one minute remaining…Request failed : Error: connect ETIMEDOUT 142.251.42.238:443
Retrying in 15 seconds
Downloading…             [************************************** ] Less than one minute remaining…
Successfully downloaded new metadata: 0 local devices supported
Devices with no available firmware updates: 
 • MSFT0001:00 04F3:3140
 • MZVLB512HBJQ-000L2
 • System Firmware
 • UEFI Device Firmware
 • USB2.1 Hub
No updatable devices
```
---

There is [one topic][9] related with cpcc in lenove community, but I don't find my computer legion r7000 there.

---
Q: 

1- Does above problem resulted by no CPCC on my machine? If so, Do my cpu and installed kernel support CPCC as I listed above in section 'check support' and is Bios the root cause of unavailability of CPCC ? Is there one way to use CPCC without help of BIOS? Just like above says, can I make small modification to my *firmware* in linux to enable CPCC?

2- How to achieve above '[one topic][9]' 'Messing around in the firmware'(i.e. view contents in firmware.)?


  [1]: https://forum.manjaro.org/t/anyone-running-amd-pstate-active/140643/6
  [2]: https://wiki.archlinux.org/title/CPU_frequency_scaling#Scaling_drivers
  [3]: https://newsupport.lenovo.com.cn/driveList.html?fromsource=driveList&selname=Lenovo%20Legion%20r7000%202020
  [4]: https://www.kernel.org/doc/html/latest/admin-guide/pm/amd-pstate.html
  [5]: https://forum.manjaro.org/t/how-to-enable-amd-pstate/123720/2
  [6]: https://forum.manjaro.org/t/is-the-amd-pstate-driver-included-in-5-17-rc1-kernel/99978/8
  [7]: https://www.phoronix.com/news/AMD-P-State-Linux-5.17
  [8]: https://wiki.archlinux.org/title/fwupd#Stuck_when_rebooting
  [9]: https://forums.lenovo.com/t5/Other-Linux-Discussions/amd-pstate-driver-support-for-AMD-laptops/m-p/5135917?page=1#5599568