classdef ImageData 
% Class that stores image load by user, its category (mask or no - mask)
% and probability of it
    properties
      img; % Image load by user
      probability; % Probability of detrermining the category
      category; % mask or no - mask
    end
    methods
        
    % Constructor
    % it takes 0 arguments (create blank object) or 3 arguments (in order:
    % image, probability (numeric), category (string))
    function obj = ImageData(varargin)
        
        
        if(nargin == 0)
           
            obj.img = [];
            obj.probability = 0;
            obj.category = "Unknown";
           
        elseif(length(varargin) == 3)
                
             if(isa(varargin{1},'uint8')||isa(varargin{1},'logical') ||isa(varargin{1},'double'))
                obj.img = varargin{1}; 
             else
                  obj.img = [];
                  error('Wrong input data');
             end
             if(isnumeric(varargin{2}) & varargin{2} <=100)
                 obj.probability = varargin{2}; 
              else
                  obj.probability = [];
                  error('Wrong input data');
              end
             if(isstring(varargin{3}))     
                obj.category = varargin{3}; 
             else
                 obj.category = [];
                 error('Wrong input data');
             end
                 
        else
           error('Wrong input data');
        end
        
    end
    %Setters
    function obj = set.img(obj, LoadImage)
         
        % input data  control
        if(isa(LoadImage,'uint8')||isa(LoadImage,'logical') ||isa(LoadImage,'double'))
            obj.img = LoadImage;
        else
           error('Wrong input data');
        end
            
        
    end
    function obj = set.probability(obj, Prob)
        
        % input data control
        if(isnumeric(Prob) & Prob <=100)
            obj.probability = Prob;
        else
            error('Wrong input data');
        end
        
        
    end
    function obj = set.category(obj, Cat)
        
       % input data control 
       if(isstring(Cat))
        obj.category = Cat;
       else
         error('Wrong input data');
       end
    end
    % Getters
    function val = get.img(obj)
        
        val = obj.img;
    end
    function val = get.probability(obj)
        
        val = obj.probability;
    end
    function val = get.category(obj)
        
        val = obj.category;
    end
        
    end
    
end