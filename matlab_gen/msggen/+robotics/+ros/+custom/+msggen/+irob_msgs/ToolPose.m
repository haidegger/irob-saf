classdef ToolPose < robotics.ros.Message
    %ToolPose MATLAB implementation of irob_msgs/ToolPose
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'irob_msgs/ToolPose' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '8406662f97ef757296f32a74d0e1fb2b' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsPointClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Point') % Dispatch to MATLAB class for message type geometry_msgs/Point
        GeometryMsgsQuaternionClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Quaternion') % Dispatch to MATLAB class for message type geometry_msgs/Quaternion
    end
    
    properties (Dependent)
        Position
        Orientation
        Jaw
    end
    
    properties (Access = protected)
        Cache = struct('Position', [], 'Orientation', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Jaw', 'Orientation', 'Position'} % List of non-constant message properties
        ROSPropertyList = {'jaw', 'orientation', 'position'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = ToolPose(msg)
            %ToolPose Construct the message object ToolPose
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function position = get.Position(obj)
            %get.Position Get the value for property Position
            if isempty(obj.Cache.Position)
                obj.Cache.Position = feval(obj.GeometryMsgsPointClass, obj.JavaMessage.getPosition);
            end
            position = obj.Cache.Position;
        end
        
        function set.Position(obj, position)
            %set.Position Set the value for property Position
            validateattributes(position, {obj.GeometryMsgsPointClass}, {'nonempty', 'scalar'}, 'ToolPose', 'Position');
            
            obj.JavaMessage.setPosition(position.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Position)
                obj.Cache.Position.setJavaObject(position.getJavaObject);
            end
        end
        
        function orientation = get.Orientation(obj)
            %get.Orientation Get the value for property Orientation
            if isempty(obj.Cache.Orientation)
                obj.Cache.Orientation = feval(obj.GeometryMsgsQuaternionClass, obj.JavaMessage.getOrientation);
            end
            orientation = obj.Cache.Orientation;
        end
        
        function set.Orientation(obj, orientation)
            %set.Orientation Set the value for property Orientation
            validateattributes(orientation, {obj.GeometryMsgsQuaternionClass}, {'nonempty', 'scalar'}, 'ToolPose', 'Orientation');
            
            obj.JavaMessage.setOrientation(orientation.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Orientation)
                obj.Cache.Orientation.setJavaObject(orientation.getJavaObject);
            end
        end
        
        function jaw = get.Jaw(obj)
            %get.Jaw Get the value for property Jaw
            jaw = double(obj.JavaMessage.getJaw);
        end
        
        function set.Jaw(obj, jaw)
            %set.Jaw Set the value for property Jaw
            validateattributes(jaw, {'numeric'}, {'nonempty', 'scalar'}, 'ToolPose', 'Jaw');
            
            obj.JavaMessage.setJaw(jaw);
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Position = [];
            obj.Cache.Orientation = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.Jaw = obj.Jaw;
            
            % Recursively copy compound properties
            cpObj.Position = copy(obj.Position);
            cpObj.Orientation = copy(obj.Orientation);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Jaw = strObj.Jaw;
            obj.Position = feval([obj.GeometryMsgsPointClass '.loadobj'], strObj.Position);
            obj.Orientation = feval([obj.GeometryMsgsQuaternionClass '.loadobj'], strObj.Orientation);
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Jaw = obj.Jaw;
            strObj.Position = saveobj(obj.Position);
            strObj.Orientation = saveobj(obj.Orientation);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.irob_msgs.ToolPose.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.irob_msgs.ToolPose;
            obj.reload(strObj);
        end
    end
end
