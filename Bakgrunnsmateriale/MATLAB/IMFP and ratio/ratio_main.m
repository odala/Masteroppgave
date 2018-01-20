function varargout = ratio_main(varargin)
% ratio_main MATLAB code for ratio_main.fig
%      ratio_main, by itself, creates a new ratio_main or raises the existing
%      singleton*.
%
%      H = ratio_main returns the handle to a new ratio_main or the handle to
%      the existing singleton*.
%
%      ratio_main('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ratio_main.M with the given input arguments.
%
%      ratio_main('Property','Value',...) creates a new ratio_main or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ratio_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ratio_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ratio_main

% Last Modified by GUIDE v2.5 06-Jul-2016 14:31:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ratio_main_OpeningFcn, ...
                   'gui_OutputFcn',  @ratio_main_OutputFcn, ...
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

% --- Executes just before ratio_main is made visible.
function ratio_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ratio_main (see VARARGIN)

% Choose default command line output for ratio_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using ratio_main.
if strcmp(get(hObject,'Visible'),'off')
    plot([2.5], [0.05], 'b--')
    xlabel('Thickness $d$ [\AA]', 'Interpreter', 'latex', 'Fontsize', 12)
    ylabel('Ratio $R(d)$', 'Interpreter', 'latex', 'Fontsize', 12)
    axis( [0.0, 5.0, 0.0, 1.5 ] )
    set(handles.axes1, 'Fontsize', 12);

    grid on
end

% UIWAIT makes ratio_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ratio_main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update(handles);


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Al', 'Au', 'Br', 'C', 'Cd', 'Ga', 'Hg', 'O', 'Si', 'Te', 'Zn'});

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Al', 'Al2O3', 'CdTe', 'Hg', 'HgTe', 'Si', 'Te', 'TeO'});


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Al', 'Au', 'Br', 'C', 'Cd', 'Ga', 'Hg', 'O', 'Si', 'Te', 'Zn'});


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Al', 'Al2O3', 'CdTe', 'Hg', 'HgTe', 'Si', 'Te', 'TeO'});

% --- Update.
function update(handles)
axes(handles.axes1);
cla;

% --- Set the energy of the Al Ka and Mg Ka x-rays [eV].
Al = 1486.6;
Mg = 1253.6;

% --- Set the energy of the the x-rays [eV].
popup6_selected_value = get(handles.popupmenu6, 'Value');
switch popup6_selected_value
    case 1 % Mg anode
        energyUsed = Mg;
        fprintf('Mg: Energy of x-ray anode = %.1f eV.\n', energyUsed);
    case 2 % Al anode
        energyUsed = Al;
        fprintf('Al: Energy of x-ray anode = %.1f eV.\n', energyUsed);
end

% --- Set emission angle of the electrons with respect
%     to the surface normal [deg].
thetaDeg = 30;
theta = degToRad(thetaDeg);
fprintf('Emission angle (wrt. surface normal [deg]) %.1f\n', thetaDeg);

% --- Define Avogadro's number [atoms / mol].
Nav = 6.0221409e23;

% --- Get the different materials and signals to be used.
popup2_selected_value = get(handles.popupmenu2, 'Value');
popup2_string_list = get(handles.popupmenu2, 'String');
A_signal = char(popup2_string_list(popup2_selected_value));
popup3_selected_value = get(handles.popupmenu3, 'Value');
popup3_string_list = get(handles.popupmenu3, 'String');
A_id = char(popup3_string_list(popup3_selected_value));
popup4_selected_value = get(handles.popupmenu4, 'Value');
popup4_string_list = get(handles.popupmenu4, 'String');
B_signal = char(popup4_string_list(popup4_selected_value));
popup5_selected_value = get(handles.popupmenu5, 'Value');
popup5_string_list = get(handles.popupmenu5, 'String');
B_id = char(popup5_string_list(popup5_selected_value));

% --- Read in corresponding values from file.
B = readParametersFromFile(strcat('param_', B_id, '.txt'));
A = readParametersFromFile(strcat('param_', A_id, '.txt'));
[ nameE_A, E_A ] = readEnergiesFromFile(strcat('energy_', A_signal, '.txt'));
[ nameE_B, E_B ] = readEnergiesFromFile(strcat('energy_', B_signal, '.txt'));
fprintf('\nBulk material: %s. \nOverlayer: %s.\n', B_id, A_id);
fprintf('Ratio of %s-%s to %s-%s signals.\n', A_signal, A_id, B_signal, B_id);

% --- Calculate atomic size [Å].
a_A = (A.M/A.rho/Nav)^(1/3)*1e8;
a_B = (B.M/B.rho/Nav)^(1/3)*1e8;

% --- Calculate inelastic mean free paths for the signal in both the
%     overlayer and in the bulk material [Å].
e1 = 1;
e2 = 2;
fprintf('\nBulk material: %s. \nOverlayer: %s.\n', nameE_A{e1}, nameE_B{e2});
IMFP_AA  = TPP2M( energyUsed - E_A(e1), A.Eg, A.rho, A.Nv, A.M );
IMFP_BB  = TPP2M( energyUsed - E_B(e1), B.Eg, B.rho, B.Nv, B.M );
IMFP_BA  = TPP2M( energyUsed - E_B(e1), A.Eg, A.rho, A.Nv, A.M );
IMFP_AA2 = TPP2M( energyUsed - E_A(e2), A.Eg, A.rho, A.Nv, A.M );
IMFP_BB2 = TPP2M( energyUsed - E_B(e2), B.Eg, B.rho, B.Nv, B.M );
IMFP_BA2 = TPP2M( energyUsed - E_B(e2), A.Eg, A.rho, A.Nv, A.M );

% --- Set thickness array.
d = linspace(0.0, 10.0, 100);

% --- Calculate the ratios for two different energy peaks.
Rd = calculate_ratio( d, theta, a_A, a_B, IMFP_AA, IMFP_BA, IMFP_BB );
Rp = calculate_ratio( d, theta, a_A, a_B, IMFP_AA2, IMFP_BA2, IMFP_BB2 );

% --- Plot ratio as a function of thickness.
plot(d, Rd, 'b--', d, Rp, 'r-')
xlabel('Thickness $d$ [\AA]', 'Interpreter', 'latex', 'Fontsize', 12)
ylabel('Ratio $R(d)$', 'Interpreter', 'latex', 'Fontsize', 12)
h = legend('$R_\mathrm{d}(d)$', '$R_\mathrm{p}(d)$', 'Location', 'SouthEast');
set(h, 'Interpreter', 'latex', 'Fontsize', 12)
axis( [0.0, max(d), 0.0, ceil(10*max([Rd, Rp]))/10 ] )
set(handles.axes1, 'Fontsize', 12);

grid on

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
                                              
% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Mg', 'Al'});
