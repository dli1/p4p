#!/bin/bash

#SBATCH --job-name=cycle
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --partition=gpu_shared
#SBATCH --output=r_prec_poem_image_cycle_%j.log

#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE,STAGE_OUT,TIME_LIMIT
#SBATCH --mail-user=silvan1999nl@gmail.com

module purge

module load 2019
module load Python/3.7.5-foss-2019b
module load cuDNN/7.6.5.32-CUDA-10.1.243
module load NCCL/2.5.6-CUDA-10.1.243

source venv/bin/activate
cd model_code

srun python main_chi.py --cfg cfg/eval/eval_poem_image_cycle.yml --gpu 0 --eval_offset 0