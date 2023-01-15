
#
# Copyright 2019 Xilinx Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

from enum import Enum, unique

@unique
class QError(Enum):
  BIAS_CORRECTION	=	20001
  CALIB_RESULT_MISMATCH	=	20002
  EXPORT_ONNX		=	20003
  EXPORT_XMODEL		=	20004
  FAST_FINETINE		=	20005
  FIX_INPUT_TYPE	=	20006
  GRAPH_PARTITION	=	20007
  ILLEGAL_BITWIDTH	=	20008
  IMPORT_KERNEL		=	20009
  NO_CALIB_RESULT	=	20010
  NO_CALIBRATION	=	20011
  NO_FORWARD		=	20012
  OP_REGIST		=	20013
  PROC_TIMEOUT		=	20014
  PYTORCH_TRACE		=	20015
  QUANT_CONFIG		=	20016
  SHAPE_MISMATCH	=	20017
  TORCH_VERSION		=	20018
  XMODEL_BATCHSIZE	=	20019
  INSPECTOR_OUTPUT_FORMAT	=	20020
  INSPECTOR_INPUT_FORMAT	=	20021
  UNSUPPORTED_OPS	=	20022
  TRACED_NOT_SUPPORT	=	20023
  NO_SCRIPT_MODEL	=	20024
  REUSED_MODULE         =	20025
  DATA_PARALLEL_NOT_ALLOWED	=	20026
  INPUT_NOT_QUANTIZED	=	20027
  NOT_A_MODULE  	=	20028
  QAT_PROCESS_ERROR	=	20029
  QAT_DEPLOYABLE_MODEL_ERROR	=	20030
  XMODEL_DEVICE	        =	20031
  UNREGISTERED_TARGET   =       20032
  INPUT_DIMENSION       =       20033
  PARAM_NUMBER          =       20034

@unique
class QWarning(Enum):
  BATCHNORM_AFFINE	=	21001
  BIAS_CORRECTION	=	21002
  BITWIDTH_MISMATCH	=	21003
  CONVERT_XMODEL	=	21004
  CUDA_UNAVAILABLE	=	21005
  DATA_DUMP		=	21006
  DATA_PARALLEL		=	21007
  DEPLOY_MODEL		=	21008
  DEVICE_MISMATCH	=	21009
  EXPORT_XMODEL		=	21010
  FAST_FINETUNE		=	21011
  FINETUNE_IGNORED	=	21012
  FLOAT_OP		=	21013
  INSPECTOR_PATTERN	=	21014
  LEAKYRELU		=	21015
  MATPLOTLIB		=	21016
  MEMORY_SHORTAGE	=	21017
  NO_XIR		=	21018
  QUANT_GROUP		=	21019
  REPLACE_RELU6		=	21020
  REPLACE_RELUK		=	21021
  REPLACE_SIGMOID	=	21022
  REPLACE_SILU		=	21023
  SHIFT_CHECK		=	21024
  TENSOR_NOT_QUANTIZED	=	21025
  TENSOR_TYPE_NOT_QUANTIZABLE	=	21026
  TENSOR_VALUE_INVALID	=	21027
  TORCH_VERSION		=	21028
  XIR_MISMATCH		=	21029
  XMODEL_DEVICE		=	21030
  REUSED_MODULE 	=	21031
  DEPRECATED_ARGUMENT	=	21032
  SCALE_VALUE   	=	21033
  HW_AWARE_QUANT        =       21034

@unique
class QNote(Enum):
  NOT_FUSED_BN		=	22001