# Clone qmk and flash tools
```bash
export QMK_HOME=~/qmk_firmware/
git clone https://github.com/qmk/qmk_firmware $QMK_HOME
git clone https://github.com/OpenAnnePro/AnnePro2-Tools
```
# Copy keymaps files
```bash
ln -s $(pwd)/annepro2_keymap.c ${QMK_HOME}/keyboards/annepro2/keymaps/rigel/keymap.c
ln -s $(pwd)/annepro2_config.h ${QMK_HOME}/keyboards/annepro2/c18/config.h
ln -s $(pwd)/annepro2_rules.mk ${QMK_HOME}/keyboards/annepro2/c18/rules.mk
```
# build and flash bin files
```bash
make annepro2/c18:rigel
~/AnnePro2-Tools/target/release/annepro2_tools annepro2.bin
```
