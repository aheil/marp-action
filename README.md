# marp-action
This  GitHub action creating presentation files using [Marp](https://marp.app/). 

## Inputs

### `src-dir`

**Required** The directory where your markdown files are located in your repository.  

E.g. if your markdown files are located in a folder `slides` in your repository provide `slides` as input. Default `.` .

## Outputs

Not available.

## Example usage
```
uses: aheil/marp-action@v1.0.0
with:
  src: 'slides'
```