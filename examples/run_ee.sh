#!/usr/bin/env bash
DATA_DIR="CBLUEDatasets"

TASK_NAME="ee"
MODEL_TYPE="bert"
MODEL_DIR="data/model_data"
MODEL_NAME="chinese-bert-wwm"
OUTPUT_DIR="data/output"

MAX_LENGTH=128

echo "Start running"

if [ $# == 0 ]; then
    python baselines/run_classifier.py \
        --data_dir=${DATA_DIR} \
        --model_type=${MODEL_TYPE} \
        --model_dir=${MODEL_DIR} \
        --model_name=${MODEL_NAME} \
        --task_name=${TASK_NAME} \
        --output_dir=${OUTPUT_DIR} \
        --do_train \
        --max_length=${MAX_LENGTH} \
        --train_batch_size=16 \
        --eval_batch_size=16 \
        --learning_rate=3e-5 \
        --epochs=3 \
        --warmup_proportion=0.1 \
        --earlystop_patience=3 \
        --logging_steps=200 \
        --save_steps=200 \
        --seed=2021
elif [ $1 == "predict" ]; then
    python baselines/run_classifier.py \
        --data_dir=${DATA_DIR} \
        --model_type=${MODEL_TYPE} \
        --model_name=${MODEL_NAME} \
        --model_dir=${MODEL_DIR} \
        --task_name=${TASK_NAME} \
        --output_dir=${OUTPUT_DIR} \
        --do_predict \
        --max_length=${MAX_LENGTH} \
        --eval_batch_size=16
fi