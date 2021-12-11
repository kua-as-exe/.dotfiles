
# ~ https://github.com/aristocratos/btop

sudo snap install btop

sudo snap connect btop:system-observe
sudo snap connect btop:physical-memory-observe
sudo snap connect btop:mount-observe
sudo snap connect btop:hardware-observe
sudo snap connect btop:network-observe
sudo snap connect btop:process-control 
