classdef MarkerArray < robotics.ros.Message
    %MarkerArray MATLAB implementation of irob_msgs/MarkerArray
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'irob_msgs/MarkerArray' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'c9e1830a452cc3028f829f2ccce86637' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        IrobMsgsMarkerClass = robotics.ros.msg.internal.MessageFactory.getClassForType('irob_msgs/Marker') % Dispatch to MATLAB class for message type irob_msgs/Marker
        StdMsgsHeaderClass = robotics.ros.msg.internal.MessageFactory.getClassForType('std_msgs/Header') % Dispatch to MATLAB class for message type std_msgs/Header
    end
    
    properties (Dependent)
        Header
        Markers
    end
    
    properties (Access = protected)
        Cache = struct('Header', [], 'Markers', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Header', 'Markers'} % List of non-constant message properties
        ROSPropertyList = {'header', 'markers'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = MarkerArray(msg)
            %MarkerArray Construct the message object MarkerArray
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
        
        function header = get.Header(obj)
            %get.Header Get the value for property Header
            if isempty(obj.Cache.Header)
                obj.Cache.Header = feval(obj.StdMsgsHeaderClass, obj.JavaMessage.getHeader);
            end
            header = obj.Cache.Header;
        end
        
        function set.Header(obj, header)
            %set.Header Set the value for property Header
            validateattributes(header, {obj.StdMsgsHeaderClass}, {'nonempty', 'scalar'}, 'MarkerArray', 'Header');
            
            obj.JavaMessage.setHeader(header.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Header)
                obj.Cache.Header.setJavaObject(header.getJavaObject);
            end
        end
        
        function markers = get.Markers(obj)
            %get.Markers Get the value for property Markers
            if isempty(obj.Cache.Markers)
                javaArray = obj.JavaMessage.getMarkers;
                array = obj.readJavaArray(javaArray, obj.IrobMsgsMarkerClass);
                obj.Cache.Markers = feval(obj.IrobMsgsMarkerClass, array);
            end
            markers = obj.Cache.Markers;
        end
        
        function set.Markers(obj, markers)
            %set.Markers Set the value for property Markers
            if ~isvector(markers) && isempty(markers)
                % Allow empty [] input
                markers = feval([obj.IrobMsgsMarkerClass '.empty'], 0, 1);
            end
            
            validateattributes(markers, {obj.IrobMsgsMarkerClass}, {'vector'}, 'MarkerArray', 'Markers');
            
            javaArray = obj.JavaMessage.getMarkers;
            array = obj.writeJavaArray(markers, javaArray, obj.IrobMsgsMarkerClass);
            obj.JavaMessage.setMarkers(array);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Markers)
                obj.Cache.Markers = [];
                obj.Cache.Markers = obj.Markers;
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Header = [];
            obj.Cache.Markers = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.Header = copy(obj.Header);
            cpObj.Markers = copy(obj.Markers);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Header = feval([obj.StdMsgsHeaderClass '.loadobj'], strObj.Header);
            MarkersCell = arrayfun(@(x) feval([obj.IrobMsgsMarkerClass '.loadobj'], x), strObj.Markers, 'UniformOutput', false);
            obj.Markers = vertcat(MarkersCell{:});
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
            
            strObj.Header = saveobj(obj.Header);
            strObj.Markers = arrayfun(@(x) saveobj(x), obj.Markers);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.irob_msgs.MarkerArray.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.irob_msgs.MarkerArray;
            obj.reload(strObj);
        end
    end
end
