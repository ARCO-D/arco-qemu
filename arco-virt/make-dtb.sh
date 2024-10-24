help(){
  echo -e "\e[33musage:\e[0m"
  echo "make-dtb make:   compile arco.dts->arco.dtb"
  echo "make-dtb demake: compile virt.dtb->virt.dts"
}

demakedtb(){
  dtc virt.dtb -I dtb -O dts -o virt.dts
}

makedtb(){
  dtc arco.dts -I dts -O dtb -o arco.dtb
}

if [ ! $# -eq 1 ]; then
  help
  exit
fi

if [[ $1 == "m"* ]]; then
  makedtb
elif [[ $1 == "d"* ]]; then
  demakedtb
else
  help
fi
