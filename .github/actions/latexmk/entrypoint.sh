#!/bin/bash
set -eux

# Set the LaTeX file name, defaulting to main.tex if not provided
LATEX_FILE_NAME="${INPUT_LATEX_FILE_NAME:-main.tex}"

# Determine the version or branch name
if [[ "${GITHUB_REF}" == refs/tags/* ]]; then
  VERSION_NAME=$(echo "${GITHUB_REF}" | sed 's/refs\/tags\///')
else
  VERSION_NAME=$(echo "${GITHUB_HEAD_REF}")
fi

# Determine the output PDF name
FILE_BASENAME=$(basename "${LATEX_FILE_NAME}" .tex)
OUTPUT_PDF="${FILE_BASENAME}-${VERSION_NAME}.pdf"

# Export environment variables for GitHub Actions to use in later steps
echo "LATEXMK_OUTPUT_PDF=${OUTPUT_PDF}" >> $GITHUB_ENV

# Build the LaTeX document
latexmk "${LATEX_FILE_NAME}"

# Rename the output file with version or branch information
mv "${FILE_BASENAME}.pdf" "${OUTPUT_PDF}"
