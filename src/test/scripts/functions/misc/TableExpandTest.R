#-------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#-------------------------------------------------------------


args <- commandArgs(TRUE)
options(digits=22)
library("Matrix")

A = as.matrix(readMM(paste(args[1], "A.mtx", sep="")))
m = as.integer(args[2]);
left = as.logical(args[3]);

#note: this outer formulation is equivalent to table but does not 
#  require padding and convertion from R's factor-based table

if( left ){
   C = outer(as.vector(A), seq(1,m), "==");
} else {
   C = outer(seq(1,m), as.vector(A), "==");
}


writeMM(as(as.matrix(C), "CsparseMatrix"), paste(args[4], "C", sep="")); 
