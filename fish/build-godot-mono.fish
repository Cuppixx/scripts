#!/usr/bin/env fish

set workdir /mnt/data/software/engines/godot/source/godot
cd $workdir

function run_step
    set cmd $argv
    echo
    echo "=== Next: $cmd ==="
    read -P "Do you want to run this step? [y/N]: " -l answer
    if test "$answer" != "y"
        echo ">>> Skipping step: $cmd"
        return
    end

    echo
    echo "=== Running: $cmd ==="
    eval $cmd
    if test $status -ne 0
        echo "!!! Error: Command failed — exiting."
        exit 1
    end
end
run_step "scons -c"
run_step "find ../nupkgs/ -mindepth 1 -delete"
run_step "scons platform=linuxbsd target=editor use_llvm=yes linker=mold dev_build=yes debug_symbols=yes optimize=debug module_mono_enabled=yes"
run_step "touch ./bin/_sc_"
run_step "./bin/godot.linuxbsd.editor.dev.x86_64.llvm.mono --headless --generate-mono-glue modules/mono/glue"
run_step "./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd --push-nupkgs-local ../nupkgs"
run_step "scons platform=linuxbsd target=template_debug use_llvm=yes linker=mold debug_symbols=yes optimize=debug module_mono_enabled=yes"
run_step "scons platform=linuxbsd target=template_release production=yes lto=full optimize=speed module_mono_enabled=yes"

echo
echo "Godot Mono build completed successfully!"
echo "You may now copy the build files into your designated custom_build folder."
