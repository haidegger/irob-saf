classdef DissectionStates
    enumeration
        init, tissue_grabbed, done_dissection_group, done_retraction, at_tgt_dp, at_tgt_goal, at_distant_dp, at_distant_goal, abort
    end
    
    methods
        function nv = next(obj, reqmsg, group_done)
            nv = DissectionStates.abort;
            
            switch obj
                case DissectionStates.init
                    disp('init');
                    if reqmsg.TargetType == reqmsg.GRABBING
                        nv = DissectionStates.tissue_grabbed;
                    end
                    
                case DissectionStates.tissue_grabbed
                    disp('tissue_grabbed');
                    if reqmsg.TargetType == reqmsg.RETRACTION
                        nv = DissectionStates.done_dissection_group;
                    end
                    
                case DissectionStates.done_dissection_group
                    disp('done_dissection_group');
                    if reqmsg.TargetType == reqmsg.RETRACTION
                        nv = DissectionStates.done_retraction;
                    end
                    
                case DissectionStates.done_retraction
                    disp('done_retraction');
                    if reqmsg.TargetType == reqmsg.DISSECTION
                        nv = DissectionStates.at_tgt_dp;
                    end
                    
                case DissectionStates.at_tgt_dp
                    disp('at_tgt_dp');
                    if reqmsg.TargetType == reqmsg.DISSECTION
                        nv = DissectionStates.at_tgt_goal;
                        
                    end
                    
                case DissectionStates.at_tgt_goal
                    disp('at_tgt_goal');
                    if reqmsg.TargetType == reqmsg.DISTANT
                        if group_done
                            nv = DissectionStates.at_distant_dp;
                        else
                            nv = DissectionStates.at_distant_goal;
                        end
                    end
                case DissectionStates.at_distant_dp
                    disp('at_distant_dp');
                    if reqmsg.TargetType == reqmsg.DISTANT
                        nv = DissectionStates.done_retraction;
                    end
                    
                case DissectionStates.at_distant_goal
                    disp('at_distant_goal');
                    if reqmsg.TargetType == reqmsg.DISSECTION
                        nv = DissectionStates.at_tgt_dp;
                    end
                    
                otherwise
                    disp('other_state');
                    nv = DissectionStates.abort;
                    warning('Unexpected query, do nothing...')
            end
        end
    end
    
end
