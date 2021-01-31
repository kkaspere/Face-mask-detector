classdef Classificator
% Class that classify loaded photo 

    properties(Access = private)
        NeuralNetwork; % Neural network responsible for classification    
    end
    methods
        function obj = Classificator(filename)
            obj.NeuralNetwork = importdata(filename); % Loading trained neural network
        end
        function [category, accuracy] = ClassifyPhoto(obj, img)
             % Function that classify the photo to proper category (mask or not mask),
             % it returns category in text and the probability of it
             
             % Classification
             [Prediction,Probability] = classify(obj.NeuralNetwork, img);
             
             % Scale probability to [%]
             accuracy = round(max(Probability)*100,2);
             
             % Set category
             if(Prediction =='maski')
                 category = "Mask";            
             elseif(Prediction == 'niemaski')
                 category = "Not mask";
             else
                 category = "Unknown";
             end
            
        end
    end
    
end