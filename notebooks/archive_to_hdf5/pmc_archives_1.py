import logging
import warnings
import zipfile
from pathlib import Path
from typing import Generator

import pandas as pd
import tables

import pmc_tables

warnings.filterwarnings("ignore", category=tables.NaturalNameWarning)
logger = logging.getLogger(__name__)


def main(zip_archives: Generator[Path, None, None], hdf5_file: Path) -> None:
    """Copy data from a list of zip archives to an HDF5 file."""
    counter = 0
    with pd.HDFStore(
            hdf5_file.as_posix(), mode='a', compression='blosc:blosclz', complevel=6) as store:
        for archive_file in zip_archives:
            if counter % 1_000 == 0:
                logger.info("Counter: %s", counter)
            counter += 1
            try:
                with zipfile.ZipFile(archive_file.as_posix()) as archive:
                    pmc_tables.save_archive_to_hdf5(archive, store)
            except (zipfile.BadZipFile, pmc_tables.errors.MalformedArchiveError) as e:
                logger.error("ZIP file `%s` is malformed (%s: %s). Skipping...", archive_file,
                             type(e), e)
                continue


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input-dir')
    parser.add_argument('-o', '--output-file')
    args = parser.parse_args()

    logging.basicConfig(format='[%(name)s] %(message)s', level=logging.DEBUG)

    zip_archives = Path(args.input_dir).absolute().glob('*/*.zip')
    hdf5_file = Path(args.output_file).absolute()

    main(zip_archives, hdf5_file)
