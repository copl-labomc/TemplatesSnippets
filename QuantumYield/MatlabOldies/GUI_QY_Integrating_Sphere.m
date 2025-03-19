function varargout = GUI_QY_Integrating_Sphere(varargin)
% GUI_QY_INTEGRATING_SPHERE MATLAB code for GUI_QY_Integrating_Sphere.fig
%      GUI_QY_INTEGRATING_SPHERE, by itself, creates a new GUI_QY_INTEGRATING_SPHERE or raises the existing
%      singleton*.
%
%      H = GUI_QY_INTEGRATING_SPHERE returns the handle to a new GUI_QY_INTEGRATING_SPHERE or the handle to
%      the existing singleton*.
%
%      GUI_QY_INTEGRATING_SPHERE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_QY_INTEGRATING_SPHERE.M with the given input arguments.
%
%      GUI_QY_INTEGRATING_SPHERE('Property','Value',...) creates a new GUI_QY_INTEGRATING_SPHERE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_QY_Integrating_Sphere_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_QY_Integrating_Sphere_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_QY_Integrating_Sphere

% Last Modified by GUIDE v2.5 25-Aug-2017 11:40:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_QY_Integrating_Sphere_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_QY_Integrating_Sphere_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_QY_Integrating_Sphere is made visible.
function GUI_QY_Integrating_Sphere_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_QY_Integrating_Sphere (see VARARGIN)

% Choose default command line output for GUI_QY_Integrating_Sphere
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_QY_Integrating_Sphere wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_QY_Integrating_Sphere_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1 l_1.
 function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  [FileName,PathName]= uigetfile('*.txt','File to select l_1', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
l_1 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','l_1',l_1)
 
 



% --- Executes on button press in pushbutton2 l_2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]= uigetfile('*.txt','File to select l_2', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
l_2 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','l_2',l_2)


% --- Executes on button press in  l_3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]= uigetfile('*.txt','File to select l_3', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
l_3 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','l_3',l_3)


% --- Executes on button press in pushbutton4 p_1.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]= uigetfile('*.txt','File to select p_1', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
p_1 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','p_1',p_1)


% --- Executes on button press in pushbutton5 p_2.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]= uigetfile('*.txt','File to select p_2', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
p_2 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','p_2',p_2)


% --- Executes on button press in pushbutton6 p_3.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]= uigetfile('*.txt','File to select p_3', 'Y:\Nano\Data\QY');
 s={};
           file=fullfile(PathName,FileName);
fileID = fopen(file);
 formatSpec = '%f';
sizeA = [2 Inf];
p_3 = fscanf(fileID,formatSpec,sizeA)';
assignin ('base','p_3',p_3)


% --- Executes on button press in pushbutton7 Make Graph.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l_1 = evalin('base','l_1');
l_2 = evalin('base','l_2');
l_3 = evalin('base','l_3');
p_1 = evalin('base','p_1');
p_2 = evalin('base','p_2');
p_3 = evalin('base','p_3');
[G_vide, G_plein]= QY_graph(l_1,p_1,l_2,p_2,l_3,p_3);
assignin ('base','G_vide',G_vide);
assignin ('base','G_plein',G_plein);





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8 Calculate QY.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lambda_l1 = str2double(get(handles.edit2,'string'));
lambda_l2 = str2double(get(handles.edit3,'string'));
lambda_p1 = str2double(get(handles.edit4,'string'));
lambda_p2 = str2double(get(handles.edit5,'string'));
l_1 = evalin('base','l_1');
l_2 = evalin('base','l_2');
l_3 = evalin('base','l_3');
p_1 = evalin('base','p_1');
p_2 = evalin('base','p_2');
p_3 = evalin('base','p_3');
[QY_1, QY_2,QY_3, QY_mean, QY_std] = QY_calcul (l_1,l_2,l_3,p_1,p_2,p_3, lambda_l1,lambda_l2,lambda_p1,lambda_p2);
Results = table(QY_1, QY_2, QY_3, QY_mean, QY_std);
assignin ('base','Results',Results);
set(handles.edit6,'String',QY_1);
set(handles.edit7,'String',QY_2);
set(handles.edit8,'String',QY_3);
set(handles.edit9,'String',QY_mean);
set(handles.edit10,'String',QY_std);





function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9 Save Data.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Results = evalin('base','Results');
[FileName,PathName] = uiputfile('*.txt','Select location of file','Y:\Nano\Data\QY');
FullFileName = strcat(PathName,FileName);
fid = fopen(FullFileName, 'w');
writetable(Results,FullFileName,'Delimiter',' ');
fclose(fid);

