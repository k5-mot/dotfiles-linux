##
## Makefile
##
##   For installation of dotfiles.
##

## Makefile Path.
MAKEPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
## Configuration Path.
CONFPATH    := $(addsuffix /config,$(MAKEPATH))
## Configurations
DOTFILES    := $(subst $(CONFPATH)/,,$(shell find $(CONFPATH) -type d -name ".old" -prune -o -type f -print))
DOTDIRS     := $(subst $(CONFPATH)/,,$(shell find $(CONFPATH) -type d -name ".old" -prune -o -mindepth 1 -type d -print))

.DEFAULT_GOAL := help

all:          ## All operations

list:         ## Show dotfiles
	@echo "MAKEPATH: $(MAKEPATH)"
	@echo "CONFPATH: $(CONFPATH)"
	@echo "LINKLIST: "
	@$(foreach val, $(DOTFILES), echo "$(CONFPATH)/$(val) -> $(HOME)/$(val)";)

install:      ## Create symlink to home directory
	@echo 'Install dotfiles'
	@$(foreach val, $(addprefix $(HOME)/,$(DOTDIRS)), mkdir -pv $(val);)
	@$(foreach val, $(DOTFILES), ln -sfnv $(CONFPATH)/$(val) $(HOME)/$(val);)

clean:        ## Remove dotfiles
	@echo 'Remove dotfiles'
	@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

reinstall:    ## Remove & Install dotfiles
	@make clean
	@make install

setup-wget:   ## Setup for Wget
	@echo ca-certificate = $(HOME)/.config/certs/cacert.pem >> $(HOME)/.wgetrc

setup-vscode: ## Setup for VSCode
	@bash $(CONFPATH)/.config/Code/install_extension.sh $(CONFPATH)/.config/Code/extension-list

setup-git:    ## Setup for Git
	@cp -rf $(CONFPATH)/.config/git/gitconfig_user_sample $(HOME)/.config/git/gitconfig_user

help:         ## Print help for Makefile
	@echo 'Copyright (c) 2020-2021 k5-mot All Rights Reserved.'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

