# The quran-id package
Copyright © 2023

The [`quran-id`](https://ctan.org/pkg/quran-id) package is an extension of the [`quran`](https://ctan.org/pkg/quran) LaTeX package, designed to enhance the typesetting of the Holy Quran by incorporating specific Indonesian translations. It provides support for Indonesian translations carried out by notable translators such as `Indonesian Ministry of Religious Affairs`,  and `Jalal ad-Din al-Mahalli and Jalal ad-Din as-Suyuti`.

## Sample Usage

```
\documentclass{article}

\usepackage{arabxetex}
\usepackage{quran-id}

\begin{document}

    \begin{arab}[utf]
        \quransurah[112]
    \end{arab}
    \quransurahid[112]

\end{document}
```

## Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/xetex/latex/quran-id/doc/quran-id-doc.pdf).


## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Available at https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```
