/*
 * dvrk_arm.cpp
 *
 *  Created on: 2016. okt. 10.
 *      Author: tamas
 */

#include "dvrk/arm_types.hpp"

namespace dvrk {

// Enum value DEFINITIONS
// The initialization occurs in the scope of the class,
// so the private DVRKArmParams constructor can be used.
    
// TODO set maxvels for MTM-s and ECM
const ArmTypes ArmTypes::MTML = ArmTypes("MTML", 8, 
	{0.01, 5.0, std::numeric_limits<double>::infinity()},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01});
const ArmTypes ArmTypes::MTMR = ArmTypes("MTMR", 8, 
	{0.01, 5.0, std::numeric_limits<double>::infinity()},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01});
const ArmTypes ArmTypes::PSM1 = ArmTypes("PSM1", 7, 
	{0.3, 250.0, 15.0},
	{8.0, 25.0, 0.6, 6.0, 6.0, 9.0, 15.0});
const ArmTypes ArmTypes::PSM2 = ArmTypes("PSM2", 7, 
	{0.3, 250.0, 15.0},
	{8.0, 25.0, 0.6, 6.0, 6.0, 9.0, 15.0});
const ArmTypes ArmTypes::ECM = ArmTypes("ECM", 6, 
	{0.01, 5.0, std::numeric_limits<double>::infinity()},
	{0.01, 0.01, 0.01, 0.01, 0.01, 0.01});

}