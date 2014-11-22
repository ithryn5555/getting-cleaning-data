# Overview

The script `run_analysis.R`performs the 5 parts described in the course project's definition.

* Similar data is merged using the `rbind()` function.
* Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names from `features.txt`, which is included with the downloaded data.
* Activity names and IDs are taken from `activity_labels.txt`, which is also included with the downloaded data.
* Any columns with vague names are clarified.
* A new dataset is generated with all the average measures for each subject and activity type. The output file is called `tidy_data.txt`.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets for further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`.
* Activity names through the `activities` variable are handled in this fashion as well.
* `all_data` merges `x_data`, `y_data` and `subject_data` together.
* `tidy_data` contains the relevant averages which will be later stored in a `.txt` file.