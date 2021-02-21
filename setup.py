"""
Setup for internal project package
"""

import setuptools

setuptools.setup(
    name="project-internal",
    version="0.1.0",
    author="Grzegorz Melniczak",
    author_email="gmelniczak@gmail.com",
    description="Internal Package",
    packages=setuptools.find_packages(),
    classifiers=["Programming Language :: Python :: 3"],
    python_requires=">=3.8",
)
