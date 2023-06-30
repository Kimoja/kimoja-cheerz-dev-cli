<gtags git>

<tags circleci circle ci local>

## Lancer le conteneneur de la ci en locale 
- In your zshrc or bashrc config
  - Create a `Personal access tokens` Github, export it to env:`export GITHUB_TOKEN="[PAT]"`
  - Export to env the Github username:`export GITHUB_USERNAME="[USERNAME]"`
- Run the login command at ghcr.io to retrieve the base image used for generation
  `echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin`
- Build of the image
  `docker build -t kustom_img_spec_gen  -f spec/support/images_spec/Dockerfile .`
```bash
docker run --rm \
  --platform linux/amd64 \
  --name kustom_img_spec_gen \
  --volume $(pwd):/app \
  kustom_img_spec_gen 
```
@tag>>

</gtags>