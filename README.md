# marp-action
This  GitHub action creating presentation files using [Marp](https://marp.app/). 

## Inputs

### `src-dir`

**Required** The directory where your markdown files are located in your repository.  

E.g. if your markdown files are located in a folder `slides` in your repository provide `slides` as input. Default `.` .

### 'src-files' 

**Optional** A JSON-formatted list of files to be processed.

All files outside of the `src-dir` directory will be ignored, though.

## Outputs

Not available.

## Example usage
```
uses: aheil/marp-action@v1.0.0
with:
  src-dir: 'slides'  
```

## More examples

```
uses: aheil/marp-action@v1.1.0
with:
  src-dir: 'slides'
  src-files: '["foo.md","slides/bar.md"]'
```