FROM node:18-alpine

WORKDIR /workspace

RUN mkdir "${HOME}/.ssh" && chmod 0700 "${HOME}/.ssh"

RUN yarn config set cache-folder ~/.yarn

RUN apk add --update --no-cache git tar curl vim zsh the_silver_searcher shadow nginx

RUN sh -c "$(curl -fsSL https://raw.github.com/beeman/server-shell/master/tools/install.sh)"

RUN usermod -s /bin/zsh root

CMD ["nginx", "-g", "daemon off;"]
