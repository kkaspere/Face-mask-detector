classdef DataManager
% Class responsible for managing loading and saving data
    properties     
    end
    methods
        function obj = DataManager()
    
        end
        function [img,read] = LoadImageFromFile(obj)
        % Function that load image from file, it returns the image
        % and information whether it was successfully read (read = 1 if it
        % was, 0 if not)
        
            % get path and filename selected by user 
            [file,path] = uigetfile('*.png;*.jpg;*.jpeg');
            
            % if user selected cancel
            if isequal(file,0)
                img = 0;
                read = 0;
            else
                try
                  img = imread(fullfile(path, file));
                  read = 1;
                catch ME
                  read = 0;
                  disp('Wrong input format');
                end
            end
     
        end
        function SaveResultsToFile(obj, datatable)
        % Saves results of app operation (table with ImageData objects - datatable) to file    
        
            % get path and filename selected by user 
            [file,path] = uiputfile('*.mat');
            
            % saves only when user didn't select cancel (file==0 - user
            % selected cancel
            if(file~=0)
             save(file,'datatable');
            end
           
        end
        function ShowCameraPreview(obj, MyWebCam, CameraAxes) 
        % Function that shows view from the webcamera in gui window
        
            img = image(CameraAxes);            
            % Set position of the camera axes
            axis(CameraAxes,'ij');
            res = split(MyWebCam.Resolution,'x');
            % Set camera axes range based on camera resolution
            CameraAxes.XLim = [0,str2double(res{1})];
            CameraAxes.YLim = [0,str2double(res{2})];
            
            % Show the camera preview
            MyWebCam.preview(img);
        end
        function img = CaptureImageFromWebCam(obj, MyWebCam)
        % Function that captures image from webcam and returns it
        
            img = snapshot(MyWebCam);
        end
            

        
    end
    
end